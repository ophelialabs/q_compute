### A Pluto.jl notebook ###
# v0.19.25

#> [frontmatter]
#> chapter = 2
#> section = 1
#> order = 1
#> image = "https://raw.githubusercontent.com/JuliaQuantumComputing/QuantumTutorials.jl/main/assets/pauli_gates.png"
#> title = "Single-Qubit Gates: Pauli Gates"
#> tags = ["parent1_mod2", "quantum_gates", "single_qubit", "pauli"]
#> layout = "layout.jlhtml"
#> description = "Learn about Pauli X, Y, Z gates and their properties"

using Markdown
using InteractiveUtils

# ╔═╡ 05ef0df-8ab8-4e54-a476-89d521f29ee0
using PlutoUI, LinearAlgebra, Plots

# ╔═╡ 4f643fd4-1e8d-4304-961b-a30a37a58de3
TableOfContents()

# ╔═╡ acdd466e-14f5-11ee-1921-93e6c67d7ec4
md"""
# Single-Qubit Gates: Pauli Gates

## Overview

Single-qubit gates are fundamental building blocks of quantum circuits. The **Pauli gates** (X, Y, Z) are among the most important and frequently used gates in quantum computing.

### Learning Objectives
- Understand the Pauli matrices and their properties
- Learn how Pauli gates act on quantum states
- Visualize gate operations on the Bloch sphere
- Implement Pauli gates and verify their properties
"""

# ╔═╡ 832a1b2f-42dc-4a5d-9389-9f8f35a1759b
md"""
## The Pauli Matrices

The four Pauli matrices form a basis for all 2×2 Hermitian matrices:

### Identity Gate (I)
$$I = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix}$$

### Pauli X Gate (NOT gate)
$$X = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$$

### Pauli Y Gate
$$Y = \begin{pmatrix} 0 & -i \\ i & 0 \end{pmatrix}$$

### Pauli Z Gate
$$Z = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}$$
"""

# ╔═╡ 8656f15c-a603-45f6-8ac6-4941580830e8
md"""
## Properties of Pauli Gates

All Pauli matrices share important properties:

1. **Hermitian**: σ† = σ (self-adjoint)
2. **Unitary**: σ†σ = I (invertible)
3. **Involutory**: σ² = I (applying twice returns to original state)
4. **Eigenvalues**: +1 and -1
5. **Anticommutation**: {σᵢ, σⱼ} = 2δᵢⱼI for i ≠ j
"""

# ╔═╡ 177b8901-68ad-4319-b4fa-28fb30f3a731
md"""
## Julia Implementation

Let's define and verify the Pauli matrices:
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0c1ab
begin
	# Define Pauli matrices
	I_gate = [1 0; 0 1]
	X_gate = [0 1; 1 0]
	Y_gate = [0 -im; im 0]
	Z_gate = [1 0; 0 -1]
	
	# Verify Hermitian property
	"Pauli matrices are Hermitian (σ† = σ):"
end

# ╔═╡ ba9f13cc-bf18-4589-9e89-3d5c869e158f
begin
	hermitian_check = Dict(
		"X is Hermitian" => X_gate ≈ X_gate',
		"Y is Hermitian" => Y_gate ≈ Y_gate',
		"Z is Hermitian" => Z_gate ≈ Z_gate'
	)
	
	md"""
	$(hermitian_check)
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8b
begin
	# Verify Unitary property: σ†σ = I
	unitary_check = Dict(
		"X is Unitary" => X_gate' * X_gate ≈ I_gate,
		"Y is Unitary" => Y_gate' * Y_gate ≈ I_gate,
		"Z is Unitary" => Z_gate' * Z_gate ≈ I_gate
	)
	
	md"""
	**Unitary property (σ†σ = I):**
	$(unitary_check)
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8c
begin
	# Verify Involutory property: σ² = I
	involutory_check = Dict(
		"X² = I" => X_gate^2 ≈ I_gate,
		"Y² = I" => Y_gate^2 ≈ I_gate,
		"Z² = I" => Z_gate^2 ≈ I_gate
	)
	
	md"""
	**Involutory property (σ² = I):**
	$(involutory_check)
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8d
md"""
## Action on Computational Basis States

Let's see how Pauli gates act on the computational basis states |0⟩ and |1⟩:
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8e
begin
	# Basis states
	ket_0 = [1; 0]
	ket_1 = [0; 1]
	
	# Apply gates
	actions = Dict(
		"X|0⟩" => X_gate * ket_0,
		"X|1⟩" => X_gate * ket_1,
		"Z|0⟩" => Z_gate * ket_0,
		"Z|1⟩" => Z_gate * ket_1,
		"Y|0⟩" => Y_gate * ket_0,
		"Y|1⟩" => Y_gate * ket_1
	)
	
	# Display results
	for (gate_action, result) in actions
		println("$gate_action = $result")
	end
	
	md"✓ Pauli gates flip/transform basis states"
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
md"""
## Eigenvalues and Eigenvectors

Each Pauli matrix has eigenvalues ±1. This is important for measurement:
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
begin
	for (gate_name, gate) in [("X", X_gate), ("Y", Y_gate), ("Z", Z_gate)]
		eigen_decomp = eigen(gate)
		md_str = "**$gate_name eigenvalues:** $(eigen_decomp.values)\n"
		println(md_str)
	end
	
	md"All Pauli matrices have eigenvalues ±1"
end

# ╔═╡ 00000000-0000-0000-0000-000000000003
md"""
## Commutation Relations

The Pauli matrices satisfy important commutation relations:

$$[X, Y] = 2iZ, \quad [Y, Z] = 2iX, \quad [Z, X] = 2iY$$

And anticommutation relations:

$$\{X, Y\} = 0, \quad \{Y, Z\} = 0, \quad \{Z, X\} = 0$$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000004
begin
	# Verify commutation relations: [A, B] = AB - BA
	comm_XY = X_gate * Y_gate - Y_gate * X_gate
	comm_YZ = Y_gate * Z_gate - Z_gate * Y_gate
	comm_ZX = Z_gate * X_gate - X_gate * Z_gate
	
	md"""
	**Computed commutation relations:**
	- [X, Y] = 2iZ? $(comm_XY ≈ 2im * Z_gate)
	- [Y, Z] = 2iX? $(comm_YZ ≈ 2im * X_gate)
	- [Z, X] = 2iY? $(comm_ZX ≈ 2im * Y_gate)
	"""
end

# ╔═╡ 00000000-0000-0000-0000-000000000005
md"""
## Exercises

### Exercise 2.1.1: Verify Anticommutation
Verify that the Pauli matrices anticommute: {X, Y} = XY + YX = 0

**Solution approach:**
```julia
anticomm_XY = X_gate * Y_gate + Y_gate * X_gate
# Check if result ≈ zero matrix
```

### Exercise 2.1.2: Compute Eigendecomposition
Compute the eigendecomposition for the Y gate and verify that its eigenvectors are:
- λ₁ = +1: v₁ = (1, i)/√2
- λ₂ = -1: v₂ = (1, -i)/√2

**Hint:** Use Julia's `eigen()` function.

### Exercise 2.1.3: Superposition and Pauli Gates
Starting with the superposition state |+⟩ = (|0⟩ + |1⟩)/√2, apply the Z gate.
What is the resulting state?
"""

# ╔═╡ 00000000-0000-0000-0000-000000000006
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c51"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Plots = "~1.38.0"
PlutoUI = "~0.7.51"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000007
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.1"
manifest_format = "2.0"
project_hash = "525dcfd80d74b547385aa255d2a38f1acddad3f3"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"
"""
