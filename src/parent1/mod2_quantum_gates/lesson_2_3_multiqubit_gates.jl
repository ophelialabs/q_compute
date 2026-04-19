### A Pluto.jl notebook ###
# v0.19.25

#> [frontmatter]
#> chapter = 2
#> section = 3
#> order = 3
#> image = "https://raw.githubusercontent.com/JuliaQuantumComputing/QuantumTutorials.jl/main/assets/cnot_gates.png"
#> title = "Multi-Qubit Gates: CNOT & Toffoli"
#> tags = ["parent1_mod2", "quantum_gates", "multi_qubit", "entanglement"]
#> layout = "layout.jlhtml"
#> description = "Learn about controlled gates and entanglement"

using Markdown
using InteractiveUtils

# ╔═╡ 055ef0df-8ab8-4e54-a476-89d521f29ee0
using PlutoUI, LinearAlgebra, Plots

# ╔═╡ 4f643fd4-1e8d-4304-961b-a30a37a58de3
TableOfContents()

# ╔═╡ acdd466e-14f5-11ee-1921-93e6c67d7ec4
md"""
# Multi-Qubit Gates: CNOT & Toffoli

## Overview

Multi-qubit gates operate on multiple qubits and can create entanglement. The **CNOT (controlled-NOT) gate** and **Toffoli gate** are the most important controlled gates in quantum computing.

### Learning Objectives
- Understand controlled quantum gates
- Master CNOT gate behavior and applications
- Learn the Toffoli gate (CCX)
- Create Bell states and entangled pairs
"""

# ╔═╡ 832a1b2f-42dc-4a5d-9389-9f8f35a1759b
md"""
## The CNOT Gate

The **CNOT (Controlled-NOT)** gate operates on 2 qubits:
- **Control qubit**: determines if operation happens
- **Target qubit**: the operation applied to it

The matrix representation (control=0, target=1):

$$\text{CNOT} = \begin{pmatrix} 
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0
\end{pmatrix}$$

**Action:** If control=1, flip target. Otherwise, do nothing.

| Control | Target | Control' | Target' |
|---------|--------|----------|---------|
| 0       | 0      | 0        | 0       |
| 0       | 1      | 0        | 1       |
| 1       | 0      | 1        | 1       |
| 1       | 1      | 1        | 0       |
"""

# ╔═╡ 8656f15c-a603-45f6-8ac6-4941580830e8
begin
	# Define CNOT gate
	CNOT = [
		1 0 0 0;
		0 1 0 0;
		0 0 0 1;
		0 0 1 0
	]
	
	# Verify properties
	I2 = Matrix(1.0I, 2, 2)
	I4 = Matrix(1.0I, 4, 4)
	
	properties = Dict(
		"CNOT² = I" => CNOT^2 ≈ I4,
		"CNOT is unitary" => CNOT' * CNOT ≈ I4,
		"CNOT determinant = 1" => det(CNOT) ≈ 1.0
	)
	
	for (prop, result) in properties
		println("$prop: $result")
	end
	
	md"CNOT gate verified ✓"
end

# ╔═╡ 177b8901-68ad-4319-b4fa-28fb30f3a731
md"""
## Creating Entanglement with CNOT

A famous use of CNOT is creating **Bell states** (maximally entangled states):

Starting with |00⟩:
1. Apply H to first qubit: → (|0⟩ + |1⟩)/√2 ⊗ |0⟩
2. Apply CNOT: → (|00⟩ + |11⟩)/√2

This is the Bell state Φ⁺!
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0c1ab
begin
	# Define basis states
	ket_00 = [1, 0, 0, 0]  # |00⟩
	ket_11 = [0, 0, 0, 1]  # |11⟩
	
	# Hadamard on first qubit: H₁ ⊗ I₂
	H1_I2 = kron([1 1; 1 -1] ./ sqrt(2), I2)
	
	# Apply transformations
	intermediate = H1_I2 * ket_00
	bell_state = CNOT * intermediate
	
	md"""
	**Creating Bell state Φ⁺:**
	
	Initial state: |00⟩ = $ket_00'
	
	After H⊗I: $(round.(intermediate, digits=4))'
	
	After CNOT: $(round.(bell_state, digits=4))'
	
	This is maximally entangled!
	"""
end

# ╔═╡ ba9f13cc-bf18-4589-9e89-3d5c869e158f
md"""
## Other Bell States

The four Bell states form a complete orthonormal basis:

$$|\Phi^+⟩ = \frac{1}{\sqrt{2}}(|00⟩ + |11⟩)$$

$$|\Phi^-⟩ = \frac{1}{\sqrt{2}}(|00⟩ - |11⟩)$$

$$|\Psi^+⟩ = \frac{1}{\sqrt{2}}(|01⟩ + |10⟩)$$

$$|\Psi^-⟩ = \frac{1}{\sqrt{2}}(|01⟩ - |10⟩)$$

Bell states are fundamental to quantum teleportation and cryptography.
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8b
md"""
## The Toffoli Gate (CCX)

The **Toffoli gate** is a 3-qubit gate with two controls and one target:

**Action:** If BOTH controls are 1, flip the target.

The 8×8 matrix:

$$\text{Toffoli} = \begin{pmatrix} 
1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 \\
0 & 0 & 0 & 0 & 0 & 0 & 1 & 0
\end{pmatrix}$$

The Toffoli gate is **reversible** and **universal for classical computing**!
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8c
begin
	# Define Toffoli (CCX) gate
	Toffoli = [
		1 0 0 0 0 0 0 0;
		0 1 0 0 0 0 0 0;
		0 0 1 0 0 0 0 0;
		0 0 0 1 0 0 0 0;
		0 0 0 0 1 0 0 0;
		0 0 0 0 0 1 0 0;
		0 0 0 0 0 0 0 1;
		0 0 0 0 0 0 1 0
	]
	
	I8 = Matrix(1.0I, 8, 8)
	
	# Verify properties
	toffoli_props = Dict(
		"Toffoli² = I" => Toffoli^2 ≈ I8,
		"Toffoli is unitary" => Toffoli' * Toffoli ≈ I8,
		"Toffoli determinant = 1" => det(Toffoli) ≈ 1.0
	)
	
	for (prop, result) in toffoli_props
		println("$prop: $result")
	end
	
	md"Toffoli gate verified ✓"
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8d
md"""
## Controlled-U Gates

Any single-qubit gate U can be "controlled":

$$\text{C-U} = \begin{pmatrix} 
I & 0 \\
0 & U
\end{pmatrix}$$

This applies U to the target only if control is |1⟩.

Common examples:
- **CNOT**: C-X (controlled-X)
- **CZ**: Controlled-Z gate
- **CS**: Controlled-S gate
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
begin
	# Define Controlled-Z gate
	Z = [1 0; 0 -1]
	CZ = [
		1 0 0 0;
		0 1 0 0;
		0 0 1 0;
		0 0 0 -1
	]
	
	# CZ flips the amplitude of |11⟩ state
	ket_11_2 = [0, 0, 0, 1]
	result = CZ * ket_11_2
	
	md"""
	**Controlled-Z example:**
	
	CZ|11⟩ = $(result)'
	
	The sign is flipped!
	"""
end

# ╔═╡ 00000000-0000-0000-0000-000000000002
md"""
## Exercises

### Exercise 2.3.1: CNOT Truth Table
Verify the CNOT action on all 4 basis states:
- CNOT|00⟩ = |00⟩
- CNOT|01⟩ = |01⟩
- CNOT|10⟩ = |11⟩
- CNOT|11⟩ = |10⟩

### Exercise 2.3.2: Create Other Bell States
Create the Bell state |Ψ⁺⟩ = (|01⟩ + |10⟩)/√2 using:
- H gate on appropriate qubit
- CNOT gate

**Hint:** You may need to apply gates in a different order.

### Exercise 2.3.3: Toffoli AND Gate
Show that the Toffoli gate implements an AND operation:
- |00⟩ → |00⟩
- |01⟩ → |01⟩
- |10⟩ → |10⟩
- |11⟩ → |11⟩ (target flipped if both controls are 1)

### Exercise 2.3.4: Compose Gates
Create a circuit that applies CNOT twice to a 2-qubit state.
What is CNOT² equal to?
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
