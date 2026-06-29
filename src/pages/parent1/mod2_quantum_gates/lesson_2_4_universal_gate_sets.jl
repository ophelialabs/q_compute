### A Pluto.jl notebook ###
# v0.19.25

#> [frontmatter]
#> chapter = 2
#> section = 4
#> order = 4
#> image = "https://raw.githubusercontent.com/JuliaQuantumComputing/QuantumTutorials.jl/main/assets/universal_gates.png"
#> title = "Universal Gate Sets"
#> tags = ["parent1_mod2", "quantum_gates", "universality", "completeness"]
#> layout = "layout.jlhtml"
#> description = "Understand quantum gate universality and completeness"

using Markdown
using InteractiveUtils

# ╔═╡ 055ef0df-8ab8-4e54-a476-89d521f29ee0
using PlutoUI, LinearAlgebra, Plots

# ╔═╡ 4f643fd4-1e8d-4304-961b-a30a37a58de3
TableOfContents()

# ╔═╡ acdd466e-14f5-11ee-1921-93e6c67d7ec4
md"""
# Universal Gate Sets

## Overview

A **universal gate set** is a collection of gates that can approximate any unitary operation to arbitrary precision. Understanding universality is key to knowing what quantum computers can do.

### Learning Objectives
- Understand gate universality and completeness
- Learn the Solovay-Kitaev theorem
- Identify common universal gate sets
- Approximate arbitrary rotations
"""

# ╔═╡ 832a1b2f-42dc-4a5d-9389-9f8f35a1759b
md"""
## What is Gate Universality?

A set of quantum gates is **universal** if:
1. Any unitary operation on n qubits can be approximated
2. The approximation can be arbitrarily accurate
3. The gates in the set generate a dense subset of U(2ⁿ)

**Key theorem: Solovay-Kitaev Theorem**

Any unitary gate U can be approximated using gates from a finite universal set {G₁, G₂, ...} with overhead:

$$\text{Depth} = O(\log^c(1/\epsilon))$$

where ε is the desired accuracy and c ≈ 2-4.
"""

# ╔═╡ 8656f15c-a603-45f6-8ac6-4941580830e8
md"""
## Common Universal Gate Sets

### Set 1: {H, T, CNOT}

**Components:**
- **Hadamard (H)**: Creates superposition
- **T gate**: Phase rotation (π/4)
- **CNOT**: Creates entanglement

**Why universal:**
- H and T can approximate arbitrary single-qubit rotations
- CNOT can entangle/disentangle qubits
- Together: can build any n-qubit unitary

**Tradeoff:** T gate is hard to implement physically (requires magic state distillation)
"""

# ╔═╡ 177b8901-68ad-4319-b4fa-28fb30f3a731
begin
	# Define the universal set {H, T, CNOT}
	H = (1/sqrt(2)) * [1 1; 1 -1]
	T = [1 0; 0 exp(im * π/4)]
	I2 = Matrix(1.0I, 2, 2)
	I4 = Matrix(1.0I, 4, 4)
	
	CNOT = [
		1 0 0 0;
		0 1 0 0;
		0 0 0 1;
		0 0 1 0
	]
	
	md"""
	**Universal Gate Set 1: {H, T, CNOT}**
	
	This is the most commonly used set in quantum computing.
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0c1ab
md"""
### Set 2: {H, S, CNOT}

**Components:**
- **Hadamard (H)**: Superposition
- **S gate**: Phase rotation (π/2)
- **CNOT**: Entanglement

**Limitation:** Not universal, but can approximate easily by using arbitrary rotation gates.

### Set 3: {H, Toffoli}

**Components:**
- **Hadamard (H)**: Single-qubit superposition
- **Toffoli (CCX)**: 3-qubit gate

**Property:** Universal for quantum computing (though less practical than {H, T, CNOT})

### Set 4: {Any continuous 1-qubit rotations, CNOT}

**Components:**
- Arbitrary Rₓ(θ), Rᵧ(θ), Rz(θ) rotations
- CNOT for multi-qubit operations

**Property:** Inherently universal; minimal approximation needed
"""

# ╔═╡ ba9f13cc-bf18-4589-9e89-3d5c869e158f
md"""
## Why These Gates?

### Necessity of Single-Qubit Rotations
Single-qubit gates must be able to reach all points on the Bloch sphere.

Any single-qubit unitary can be written as:
$$U = e^{i\alpha} \begin{pmatrix} e^{-i\beta/2}\cos(\gamma/2) & -e^{i\delta-i\beta/2}\sin(\gamma/2) \\ e^{i\delta-i\beta/2}\sin(\gamma/2) & e^{i\beta/2}\cos(\gamma/2) \end{pmatrix}$$

This is a **3-parameter** rotation (the Bloch sphere is 3D).

### Necessity of Entanglement
Multi-qubit gates are essential for:
- Creating entanglement (CNOT, CZ)
- Implementing quantum algorithms
- Achieving exponential speedup
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8b
md"""
## Approximating Arbitrary Gates

### Example: Approximating Rx(π/8) using {H, T}

One useful combination is:
$$\text{Rx}(\pi/8) \approx \frac{1}{\sqrt{2}}(T + H T^{\dagger} H)$$

This shows how to build rotations from discrete gates.

### The Solovay-Kitaev Algorithm

Algorithm to compile arbitrary gates into universal set:

1. Start with target unitary U
2. Find good approximation in universal set
3. Recursively approximate the remainder
4. Depth grows as O(log^c(1/ε))

This ensures quantum computers can simulate any unitary operation!
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8c
md"""
## Practical Considerations

### Physical Implementation

Different quantum hardware supports different gate sets:

| Platform | Native Gates | Universal Set |
|----------|--------------|---------------|
| Superconducting | CX, RX, RZ | {RX, RZ, CX} |
| Ion Trap | XX, RZ (global) | {RX, RZ, XX} |
| Atomic | Ry, CZ | {RY, CZ} |
| Photonic | Linear opt., nonlinear | {Single-qubit, 2-qubit} |

### Decomposition

Most high-level languages (Qiskit, Cirq) automatically:
1. Take user circuit with any gates
2. Decompose into hardware-native universal set
3. Optimize the resulting circuit
4. Submit to hardware
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8d
begin
	# Example: Decompose a gate into universal set
	
	# Target gate: arbitrary rotation Ry(π/3)
	target_angle = π/3
	Ry_target = [
		cos(target_angle/2) -sin(target_angle/2);
		sin(target_angle/2) cos(target_angle/2)
	]
	
	# Approximate using rotations
	# Ry(π/3) ≈ Rz(α) Ry(β) Rz(γ) for appropriate α, β, γ
	
	md"""
	**Gate Decomposition Example:**
	
	Target: Rᵧ(π/3)
	
	Can be decomposed as product of single-qubit rotations.
	"""
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
md"""
## Summary: Universal vs Non-Universal

### Universal Gate Sets ✓
- Can approximate any unitary
- Sufficient for quantum computing
- Examples: {H, T, CNOT}, {H, S, CNOT + Hadamard on all qubits}

### Non-Universal Gate Sets ✗
- {H, CNOT} only: can only create certain states
- {Pauli gates} only: very limited
- Useful for specific purposes but can't do everything

**The key insight:** Universality requires either:
1. Dense single-qubit operations (rotations), OR
2. A sufficient discrete set (like {H, T, CNOT})
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
md"""
## Exercises

### Exercise 2.4.1: Verify Universality Properties
For the universal set {H, T, CNOT}:
1. Show that T⁸ = I (periodicity)
2. Verify that H² = I
3. Compute [H, T] and [T, H]

### Exercise 2.4.2: Single-Qubit Completeness
Show that any 2×2 unitary can be written as:
$$U = e^{i\alpha} R_z(\beta) R_y(\gamma) R_z(\delta)$$

**Hint:** Use the Euler angle decomposition.

### Exercise 2.4.3: Implement Arbitrary Rotation (Advanced)
Approximate Rx(π/12) using only Hadamard and T gates.

**Hint:** Study the Solovay-Kitaev theorem and approximation methods.

### Exercise 2.4.4: Hardware Decomposition
Given a target gate X (Pauli-X), decompose it into:
1. {Hadamard, Z} gates
2. {Hadamard, Ry, Rz} gates

Show the equivalence.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000003
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c51"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Plots = "~1.38.0"
PlutoUI = "~0.7.51"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000004
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.1"
manifest_format = "2.0"
project_hash = "525dcfd80d74b547385aa255d2a38f1acddad3f3"
"""
