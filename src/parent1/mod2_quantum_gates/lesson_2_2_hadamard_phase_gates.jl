### A Pluto.jl notebook ###
# v0.19.25

#> [frontmatter]
#> chapter = 2
#> section = 2
#> order = 2
#> image = "https://raw.githubusercontent.com/JuliaQuantumComputing/QuantumTutorials.jl/main/assets/hadamard_gates.png"
#> title = "Hadamard and Phase Gates"
#> tags = ["parent1_mod2", "quantum_gates", "single_qubit", "hadamard", "phase"]
#> layout = "layout.jlhtml"
#> description = "Master the Hadamard gate and phase gates"

using Markdown
using InteractiveUtils

# ╔═╡ 055ef0df-8ab8-4e54-a476-89d521f29ee0
using PlutoUI, LinearAlgebra, Plots

# ╔═╡ 4f643fd4-1e8d-4304-961b-a30a37a58de3
TableOfContents()

# ╔═╡ acdd466e-14f5-11ee-1921-93e6c67d7ec4
md"""
# Hadamard and Phase Gates

## Overview

The **Hadamard gate** and **phase gates** are essential for creating superposition and arbitrary rotations. Together with the Pauli gates, they form the basis for quantum programming.

### Learning Objectives
- Understand the Hadamard gate and superposition
- Learn phase gates (S, T gates)
- Apply gates to create quantum states
- Visualize operations on the Bloch sphere
"""

# ╔═╡ 832a1b2f-42dc-4a5d-9389-9f8f35a1759b
md"""
## The Hadamard Gate

The Hadamard gate creates equal superposition from basis states:

$$H = \frac{1}{\sqrt{2}} \begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}$$

**Key Properties:**
- H² = I (applying twice returns to original)
- H†H = I (unitary)
- Hermitian: H† = H
"""

# ╔═╡ 8656f15c-a603-45f6-8ac6-4941580830e8
begin
	# Define Hadamard gate
	H = (1/sqrt(2)) * [1 1; 1 -1]
	
	# Verify properties
	properties = Dict(
		"H² = I" => H^2 ≈ I,
		"H is Hermitian" => H ≈ H',
		"H is unitary" => H' * H ≈ I
	)
	
	for (prop, result) in properties
		println("$prop: $result")
	end
	
	md"Hadamard gate verified ✓"
end

# ╔═╡ 177b8901-68ad-4319-b4fa-28fb30f3a731
md"""
## Creating Superposition

Applying the Hadamard gate to basis states creates equal superposition:

$$H|0⟩ = |+⟩ = \frac{1}{\sqrt{2}}(|0⟩ + |1⟩)$$

$$H|1⟩ = |-⟩ = \frac{1}{\sqrt{2}}(|0⟩ - |1⟩)$$

These are eigenstates of the X gate!
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0c1ab
begin
	ket_0 = [1; 0]
	ket_1 = [0; 1]
	
	# Apply Hadamard
	plus_state = H * ket_0    # |+⟩
	minus_state = H * ket_1   # |-⟩
	
	md"""
	**Superposition states:**
	- H|0⟩ = $plus_state
	- H|1⟩ = $minus_state
	
	Both states have equal probability amplitudes: 1/√2 ≈ $(1/sqrt(2))
	"""
end

# ╔═╡ ba9f13cc-bf18-4589-9e89-3d5c869e158f
md"""
## Phase Gates

### Phase Gate (S)
$$S = \begin{pmatrix} 1 & 0 \\ 0 & i \end{pmatrix}$$

- Applies phase of π/2 to |1⟩ state
- S⁴ = I (period 4)

### T Gate
$$T = \begin{pmatrix} 1 & 0 \\ 0 & e^{i\pi/4} \end{pmatrix}$$

- Applies phase of π/4 to |1⟩ state
- T⁸ = I (period 8)

### General Phase Gate
$$P(\theta) = \begin{pmatrix} 1 & 0 \\ 0 & e^{i\theta} \end{pmatrix}$$

Applies arbitrary phase θ to the |1⟩ state.
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8b
begin
	# Define phase gates
	S_gate = [1 0; 0 im]  # Phase of π/2
	T_gate = [1 0; 0 exp(im * π/4)]  # Phase of π/4
	
	# Define general phase gate
	function phase_gate(θ)
		return [1 0; 0 exp(im * θ)]
	end
	
	# Verify S⁴ = I and T⁸ = I
	verify_S = S_gate^4 ≈ I
	verify_T = T_gate^8 ≈ I
	
	md"""
	**Phase Gate Verification:**
	- S⁴ = I: $verify_S
	- T⁸ = I: $verify_T
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8c
md"""
## Important Gate Combinations

### Z = S²
The Z gate can be expressed as two S gates:
$$Z = S^2 = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}$$
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8d
begin
	Z_gate = [1 0; 0 -1]
	Z_from_S = S_gate^2
	
	md"""
	**Verification:**
	- Z from definition: $Z_gate
	- S²: $(Z_from_S)
	- Are they equal? $(Z_gate ≈ Z_from_S)
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8e
md"""
## Rotation Gates

Any single-qubit gate can be expressed as a rotation on the Bloch sphere:

$$R_x(\theta) = e^{-i\theta X/2} = \begin{pmatrix} \cos(\theta/2) & -i\sin(\theta/2) \\ -i\sin(\theta/2) & \cos(\theta/2) \end{pmatrix}$$

$$R_y(\theta) = e^{-i\theta Y/2} = \begin{pmatrix} \cos(\theta/2) & -\sin(\theta/2) \\ \sin(\theta/2) & \cos(\theta/2) \end{pmatrix}$$

$$R_z(\theta) = e^{-i\theta Z/2} = \begin{pmatrix} e^{-i\theta/2} & 0 \\ 0 & e^{i\theta/2} \end{pmatrix}$$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
begin
	function Rx(θ)
		return [cos(θ/2) -im*sin(θ/2); -im*sin(θ/2) cos(θ/2)]
	end
	
	function Ry(θ)
		return [cos(θ/2) -sin(θ/2); sin(θ/2) cos(θ/2)]
	end
	
	function Rz(θ)
		return [exp(-im*θ/2) 0; 0 exp(im*θ/2)]
	end
	
	# Example: Rx(π/2) is similar to Hadamard
	Rx_π2 = Rx(π/2)
	
	md"Rotation gates defined and ready to use"
end

# ╔═╡ 00000000-0000-0000-0000-000000000002
md"""
## Exercises

### Exercise 2.2.1: Superposition Chains
Apply Hadamard twice to |0⟩. What do you get?

$$H(H|0⟩) = ?$$

**Hint:** H² = I

### Exercise 2.2.2: Phase Accumulation
Apply the S gate 4 times to |1⟩. Track the accumulated phase:

$$S^4|1⟩ = ?$$

### Exercise 2.2.3: Rotation Equivalences
Show that certain rotation gates can produce known gate operations:
- Is Rz(π) equivalent to the Z gate?
- Is Rx(π) equivalent to the X gate?

### Exercise 2.2.4: Create a Specific State
Use H, S, and T gates to create the state: $(|0⟩ + e^{i\pi/4}|1⟩)/\sqrt{2}$

**Hint:** Start with |0⟩, apply H, then apply appropriate phase gates.
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
