# Homodyne Detection and Continuous-Variable QKD — Overview

Homodyne detection is a sensitive measurement technique that extracts information by mixing a weak signal with a reference oscillation (the Local Oscillator, LO) at the same frequency. In optics and quantum mechanics it is the primary tool for measuring the field quadratures (amplitude X and phase P) of light.

## Core mechanism
- Mixing: A weak signal is combined with a strong LO on a 50/50 beam splitter.  
- Interference: LO and signal must share frequency and a stable relative phase.  
- Detection: Two photodiodes measure intensities at the beam splitter outputs.  
- Subtraction: In a balanced detector, the two photocurrents are subtracted to cancel common-mode noise and yield a signal proportional to a field quadrature.

Key characteristics:
- Phase sensitivity: Vary LO phase to measure X (in‑phase) or P (quadrature).  
- Quantum precision: Resolves vacuum fluctuations and squeezed states.  
- Direct conversion: Converts signal to baseband (DC), unlike heterodyne detection.

Primary applications:
- Quantum communication (QKD, QRNG)  
- Gravitational-wave detectors (e.g., LIGO upgrades)  
- Coherent fiber communications and sensing  
- Remote sensing (velocity, topography)

---

## Mathematical derivation (simplified)

Fields:
- Signal: \(E_S = A_S \cos(\omega t + \theta)\)  
- Local oscillator: \(E_{LO} = A_{LO} \cos(\omega t + \phi)\)

Beam splitter outputs (50/50):
\[
E_1 = \frac{1}{\sqrt{2}}(E_{LO} + E_S),\qquad
E_2 = \frac{1}{\sqrt{2}}(E_{LO} - E_S)
\]
Photocurrents (intensity ∝ |E|^2) and subtraction give:
\[
i_{diff} \propto 2 E_{LO} E_S \Rightarrow i_{diff}\propto A_{LO}A_{S}\cos(\theta-\phi)
\]
Implications:
- The small signal \(A_S\) is amplified by the large LO amplitude \(A_{LO}\).  
- Adjusting LO phase \(\phi\) selects the measured quadrature.

---

## Hardware requirements (summary)

Component | Requirement | Purpose
--- | ---: | ---
50/50 beam splitter | High symmetry (<0.5% deviation) | Ensures LO noise cancels
Photodiode pair | Matched responsivity & capacitance | Prevents noise leakage
Local Oscillator | High power; spatial mode match | Lifts signal above electronics noise
Phase controller | Piezo or phase shifter | Sweep/lock relative phase
Transimpedance amplifier | Low-noise, high-bandwidth | Convert current to voltage

Key technical challenges:
- Common-Mode Rejection Ratio (CMRR) — target >30 dB  
- Spatial overlap (visibility) — mismatch reduces signal and adds vacuum noise  
- Shot-noise clearance — LO shot noise must be ≫ electronic dark noise (typically >10 dB)

---

## Shot noise and its role in QKD

Shot noise is the quantum-limited variance from photon arrival statistics. For a balanced homodyne detector:
\[
\sigma_{sn}^2 = 2 e \, R \, P_{LO} \, B
\]
where e is the electron charge, R is photodiode responsivity, \(P_{LO}\) is LO power and B is bandwidth.

Shot-noise clearance: compare dark noise (LO off) to shot noise (LO on). For quantum-limited operation, shot noise should be 10–20 dB above dark noise.

In CV-QKD, shot noise is the normalization unit (1 SNU) used to spot excess noise and detect eavesdropping.

---

## CV‑QKD basics (protocol flow)

- Alice: prepares weak pulses, Gaussian-modulates amplitude X and phase P.  
- Bob: measures with homodyne detector; randomly chooses X or P by changing LO phase.  
- Sifting: Alice and Bob keep only matching-quadrature events.  
- Reconciliation + privacy amplification yield final secret keys.

Why CV-QKD? Uses standard telecom components, high symbol rates, and is daylight‑tolerant due to the LO acting as a narrowband filter.

---

## CV vs DV QKD (high-level)

Feature | CV-QKD | DV-QKD
--- | --- | ---
Detection | Homodyne (quadratures) | Single-photon counters
Hardware | Telecom components (PIN diodes, LOs) | SNSPDs/APDs (often cryogenic)
Operating env. | Room temperature, daylight-friendly | Often requires cooling; sunlight-sensitive
Data rate | Very high (Gbps potential) | Lower (detector dead time)
Distance | Short-to-medium (<~100 km) | Long-range (can exceed 400 km)

---

## Reconciliation in CV-QKD (overview)

The goal is to transform correlated real-valued measurements into identical bit strings.

Channel model:
\[
X_B = t X_A + z
\]
where t is transmission and z is noise (shot + electronic).

Two approaches:
- Direct reconciliation — Bob corrects to Alice (limited by 3 dB loss).  
- Reverse reconciliation — Alice corrects to Bob (robust to loss; standard in CV-QKD).

Pipeline:
1. Quantization (multi-level slicing)  
2. Slepian–Wolf coding (Bob sends syndrome using LDPC codes)  
3. Error correction (high-efficiency LDPC; target β close to 1)  
4. Privacy amplification (universal hashing)

Reconciliation efficiency β affects secret-key rate: \(\Delta K = \beta I_{AB} - I_{AE}\).

---

## LDPC and hardware tradeoffs

LDPC codes (especially MET-LDPC) are optimized for low SNR. Key points:
- Use rate-adaptive codes (puncturing/shortening) as SNR changes.  
- Large block sizes (10^6–10^8 bits) needed for close-to-Shannon efficiency.  
- GPUs are common for prototypes; FPGAs lower latency but are harder to implement.

---

## Secret Key Rate (reverse reconciliation)

\[
K = f\cdot[\beta I(A\!:\!B)-\chi(E\!:\!B)]
\]
- f: repetition rate (Hz)  
- β: reconciliation efficiency  
- \(I(A:B) = \tfrac{1}{2}\log_2(1+\text{SNR})\) for Gaussian modulation  
- \(\chi(E:B)\): Holevo bound (Eve’s maximum info about Bob)

SNR at Bob:
\[
\text{SNR} = \frac{T V_A}{1 + T\xi + \nu_{el}}
\]
with transmissivity T, modulation variance \(V_A\), excess noise ξ, and electronic noise \(\nu_{el}\).

Distance regimes:
- Short (<15 km): plateau, limited by electronics and processing.  
- Medium (15–50 km): exponential loss-dominated decay.  
- Long (>50 km): waterfall cutoff when βI(A:B) ≈ χ(E:B).

---

## Excess noise monitoring & sources

Parameter estimation:
- Bob calibrates shot noise \(N_0\) and electronic noise \(v_{el}\).  
- Alice and Bob reveal a test subset to estimate T and ξ.  
- Express variances in SNU; use upper confidence bounds for security (finite-size effects).

Sources of technical excess noise:
- Laser RIN (relative intensity noise)  
- Residual phase noise (laser coherence/locking)  
- Raman scattering from co-propagating classical channels

Real-time detectors use change-point algorithms (e.g., CUSUM) and abort the protocol if ξ exceeds thresholds (often 0.01–0.1 SNU).

---

## Security proofs and the Holevo bound

- Assume collective attacks and worst-case quantum-capable Eve.  
- Holevo bound:
\[
\chi(E:B) = S(\rho_E) - \int dp_B\, S(\rho_{E|m_B})
\]
- Gaussian optimality: given measured covariance, Gaussian attacks are optimal — simplifies parameterization to (T, ξ).  
- Finite-size corrections increase security margins and reduce SKR for small blocks.

---

## Phase stability and pilot tones

Phase jitter between signal and LO maps into excess noise. For small phase error δφ:
\[
X_{measured} = X\cos(\delta\phi) - P\sin(\delta\phi)
\]
Contribution to excess noise: \(\xi_{phase}\approx V_A\cdot\mathrm{var}(\delta\phi)\).

Mitigation:
- Pilot tones (time- or frequency-multiplexed) used for real-time phase estimation and digital compensation.  
- Local LO (LLO) vs Transmitted LO (TLO): LLO is more secure (no transmitted strong LO), TLO inherently shares fiber drift but opens LO-manipulation risks.

Pilot-tone budget considerations: pilot power, frequency offset, and DSP speed (must correct faster than laser coherence time).

---

## Attacks and defenses (concise)

- Trojan-horse: defend with isolators and filters.  
- LO manipulation: prefer LLO; authenticate/check LO if TLO used.  
- Saturation/blinding: real-time shot-noise monitoring and linearity checks.  
- Side-channels (EM/power): shielding, randomized power consumption, constant-time processing.

---

## State of the art & trends

- Distance records: lab ~202 km; field deployments 100+ km (very low SKR).  
- High SKR: Gbps at short distances using FPGA/GPU acceleration.  
- Integration: Photonic integrated circuits (SiPh) for stability and cost reduction.  
- Coexistence: CV-QKD can co-propagate with high-capacity classical channels (WDM).

---

## Standardization and certification

Key SDOs:
- ETSI QKD ISG — interoperability and certification frameworks.  
- ITU‑T — QKD network architectures and protocol recommendations.  
- 3GPP/GSMA — roadmaps enabling QKD integration into 5G–6G.

Common Criteria (ISO/IEC 15408) for QKD:
- Protection Profiles (PP) define module boundaries and security objectives.  
- Functional requirements include secure RNG, key zeroization, tamper detection, and side-channel resistance.  
- Typical target assurance: EAL4+ for commercial QKD.

Certification focuses: entropy tests for QRNG, shot-noise calibration and dynamic checks, optical isolation, tamper sensors, constant-time LDPC implementations, and audited finite-size security proofs.

---

## Vendor evaluation checklist (practical)

- QRNG standards compliance (NIST / AIS 20/31) and health tests.  
- Shot-noise clearance and dynamic calibration.  
- Local LO generation or authenticated LO delivery.  
- Optical isolation and wavelength filtering.  
- Tamper detection and key zeroization.  
- Constant-time cryptographic/post-processing implementation.  
- ETSI/CC interoperability and REST key delivery interfaces.

---

## (Optional) Security Target (ST) example
...existing code...
{ add a specific Security Target (ST) example here if required }
