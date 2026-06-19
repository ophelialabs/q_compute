# Q_Control — Optical Quantum Ground Station (OQGS) Overview

## Purpose
Brief overview of the Optical Quantum Ground Station used for ground‑to‑space QKD (e.g., QEYSSat uplink): hardware, operations, and integration.

## High‑Level Functions
- Transmit weak coherent pulses or entangled photons to LEO satellites.  
- Maintain polarization, timing, and pointing fidelity.  
- Post‑process time‑tags to build secure keys (SOC).

## Core Hardware
- Telescope & mount (precision tracking)  
- Quantum sources (WCP / entangled photon sources)  
- Polarization compensation (LCVRs) and fast steering mirrors  
- Timing hardware (Rubidium/GPS disciplined clocks) and DAQ (FPGA time‑taggers)

## Operations & SOC Role
- Pre‑pass modeling (atmosphere, link feasibility).  
- Real‑time tracking and polarization compensation during passes.  
- Cross‑correlation of time‑tags, error correction, privacy amplification, and key management.

## Standards & Integration
- ETSI GS QKD 014 (REST API) for key delivery.  
- Use mTLS and HSMs for secure key storage and transfer.  
- Typical use: AES key rotation or OTP demos for high‑security tests.

## Quick Start
- Validate tracking and beacon handshake first.  
- Calibrate polarization compensation (LCVRs) with beacon feedback.  
- Run SOC pipeline on a test pass: time‑tag sync → sifting → error correction → privacy amplification.

## References
- ETSI QKD ISG, PVLAS experiment literature, and QEYSSat public docs for implementation details.


