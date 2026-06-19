# Homodyne Detection — Practical Overview

## What it is
Balanced homodyne detection mixes a weak optical signal with a strong local oscillator (LO) to measure amplitude/phase quadratures with high sensitivity.

## How it works (short)
- Mix signal + LO on a 50/50 beam splitter.  
- Two photodiodes measure outputs; subtract photocurrents to cancel LO noise.  
- The differential current ∝ A_LO × A_signal × cos(phase difference).

## Typical Hardware
- 50/50 beam splitter (high symmetry)  
- Matched photodiode pair (matched responsivity/capacitance)  
- Stable, high‑power LO with phase control (piezo/phase shifter)  
- Low‑noise transimpedance amplifiers and balanced subtraction

## Key Performance Metrics
- Shot‑noise clearance (shot noise >> electronic noise)  
- Common Mode Rejection Ratio (CMRR) of detector pair  
- Spatial mode overlap (visibility) between LO and signal

## Common Challenges & Mitigations
- Phase noise → pilot tone or pilot pulses for phase estimation and digital compensation.  
- LO manipulation attacks (in QKD) → prefer Local LO (LLO) with pilot tone synchronization.  
- Detector saturation/blinding → real‑time shot‑noise monitoring and linearity checks.

## Applications
- CV‑QKD receivers (homodyne/heterodyne)  
- Quantum state tomography and squeezed light detection  
- High‑sensitivity interferometry (LIGO, metrology)

## Practical Tips
- Ensure >10 dB shot‑noise clearance for quantum‑limited operation.  
- Use pilot tones and DSP for LLO synchronization in telecom links.  
- Match photodiode pairs and keep amplifier noise low.
