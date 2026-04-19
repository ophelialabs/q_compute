### A Pluto.jl notebook ###
# v0.19.25

#> [frontmatter]
#> chapter = 2
#> section = 5
#> order = 5
#> image = "https://raw.githubusercontent.com/JuliaQuantumComputing/QuantumTutorials.jl/main/assets/gate_decomposition.png"
#> title = "Gate Decomposition & Practice"
#> tags = ["parent1_mod2", "quantum_gates", "decomposition", "exercises", "projects"]
#> layout = "layout.jlhtml"
#> description = "Exercises and projects on gate decomposition"

using Markdown
using InteractiveUtils

# ╔═╡ 055ef0df-8ab8-4e54-a476-89d521f29ee0
using PlutoUI, LinearAlgebra, Plots

# ╔═╡ 4f643fd4-1e8d-4304-961b-a30a37a58de3
TableOfContents()

# ╔═╡ acdd466e-14f5-11ee-1921-93e6c67d7ec4
md"""
# Gate Decomposition & Practice Exercises

## Overview

This lesson consolidates knowledge about quantum gates through decomposition and practical exercises. You'll learn how to break down complex gates into simpler components.

### Learning Objectives
- Decompose complex gates into fundamental gates
- Compute equivalent gate representations
- Optimize circuit depth
- Solve real-world gate problems
"""

# ╔═╡ 832a1b2f-42dc-4a5d-9389-9f8f35a1759b
md"""
## Gate Decomposition Fundamentals

### What is Gate Decomposition?

Express a complex gate U as a product of simpler gates:

$$U = G_1 G_2 \cdots G_n$$

**Goals:**
1. Use only gates native to hardware
2. Minimize circuit depth (number of gates)
3. Reduce two-qubit gate count (most expensive)
4. Preserve numerical accuracy
"""

# ╔═╡ 8656f15c-a603-45f6-8ac6-4941580830e8
md"""
## Single-Qubit Decompositions

### Euler Angle Decomposition

Any single-qubit unitary U can be written as:

$$U = e^{i\alpha} R_z(\beta) R_y(\gamma) R_z(\delta)$$

This is the **ZYZ decomposition**.

**Algorithm to find angles:**
1. Compute U = [[a, b], [c, d]]
2. α = arg(a) - arg(d)
3. β = 2 arccos(|a|)
4. γ = arg(c) - arg(a) + π/2
5. δ = arg(d) - arg(a)
"""

# ╔═╡ 177b8901-68ad-4319-b4fa-28fb30f3a731
begin
	# Function to extract Euler angles from a single-qubit unitary
	function euler_angles_zyz(U)
		# Extract angles from ZYZ decomposition
		a = U[1,1]
		b = U[1,2]
		c = U[2,1]
		d = U[2,2]
		
		alpha = atan(imag(a), real(a)) - atan(imag(d), real(d))
		beta = 2 * acos(abs(a))
		gamma = atan(imag(c), real(c)) - atan(imag(a), real(a)) + π/2
		delta = atan(imag(d), real(d)) - atan(imag(a), real(a))
		
		return alpha, beta, gamma, delta
	end
	
	# Example: decompose Hadamard gate
	H = (1/sqrt(2)) * [1 1; 1 -1]
	alpha, beta, gamma, delta = euler_angles_zyz(H)
	
	md"""
	**Example: Hadamard Decomposition**
	
	Parameters (radians, π multiples):
	- α = $(round(alpha/π, digits=3))π
	- β = $(round(beta/π, digits=3))π
	- γ = $(round(gamma/π, digits=3))π
	- δ = $(round(delta/π, digits=3))π
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0c1ab
md"""
### Verify Decomposition

Let's verify we can reconstruct the original gate from angles:

$$R_z(\delta) R_y(\gamma) R_z(\beta) R_y(\alpha)$$

This should equal the original matrix (up to global phase).
"""

# ╔═╡ ba9f13cc-bf18-4589-9e89-3d5c869e158f
begin
	# Define rotation matrices
	function Rz(θ)
		return [exp(-im*θ/2) 0; 0 exp(im*θ/2)]
	end
	
	function Ry(θ)
		return [cos(θ/2) -sin(θ/2); sin(θ/2) cos(θ/2)]
	end
	
	# Reconstruct Hadamard from angles
	H_reconstructed = exp(im * alpha) * Rz(delta) * Ry(gamma) * Rz(beta)
	
	md"""
	**Original Hadamard:**
	$(H)
	
	**Reconstructed:**
	$(round.(H_reconstructed, digits=6))
	
	**Match?** $(H ≈ H_reconstructed)
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8b
md"""
## Multi-Qubit Decompositions

### CX Decomposition

The CNOT gate can be decomposed as:

$$\text{CX} = (I \otimes H) \text{CZ} (I \otimes H)$$

where CZ is Controlled-Z.

This shows how to convert between different controlled gates.
"""

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8c
begin
	# Define 2-qubit identity and Hadamard
	I2 = [1 0; 0 1]
	H = (1/sqrt(2)) * [1 1; 1 -1]
	
	# I ⊗ H
	I_H = kron(I2, H)
	
	# CZ gate
	CZ = [
		1 0 0 0;
		0 1 0 0;
		0 0 1 0;
		0 0 0 -1
	]
	
	# CNOT gate
	CNOT_original = [
		1 0 0 0;
		0 1 0 0;
		0 0 0 1;
		0 0 1 0
	]
	
	# Verify: CNOT = (I⊗H) CZ (I⊗H)
	CNOT_from_CZ = I_H * CZ * I_H
	
	md"""
	**CNOT from CZ Decomposition:**
	
	Original CNOT:
	$(CNOT_original)
	
	Reconstructed (I⊗H)CZ(I⊗H):
	$(round.(CNOT_from_CZ, digits=6))
	
	**Verified?** $(CNOT_original ≈ CNOT_from_CZ)
	"""
end

# ╔═╡ d97ae81e-fd53-4b0a-a990-abf173b0ce8d
md"""
## Practice Problems

### Problem 1: Pauli Decompositions

Decompose the following gates using Pauli matrices:

1. **X gate**: Express X as a product of other gates
2. **Y gate**: Y = iXZ (verify this)
3. **Z gate**: Z = S² (verify this)

### Problem 2: Superposition Circuits

Create the state |+⟩ = (|0⟩ + |1⟩)/√2 using:
- Only H gate: H|0⟩
- Using X and H: (H X H) |0⟩
- Find other equivalent sequences

### Problem 3: Bell State Creation

Create each of the four Bell states and show their decompositions:
- |Φ⁺⟩ = (|00⟩ + |11⟩)/√2
- |Φ⁻⟩ = (|00⟩ - |11⟩)/√2
- |Ψ⁺⟩ = (|01⟩ + |10⟩)/√2
- |Ψ⁻⟩ = (|01⟩ - |10⟩)/√2

Find the gate sequences for each.

### Problem 4: Minimize Depth

For the following gate sequence, find an equivalent shorter sequence:
$$H S H S H$$

**Hint:** Remember that S² = Z and HZH = X
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
md"""
## Comprehensive Exercise: Three-Qubit Circuit

**Objective:** Build a quantum circuit to:
1. Prepare |000⟩
2. Apply H to qubit 0
3. Apply CNOT(0→1)
4. Apply CNOT(1→2)
5. Measure all qubits

**What state should you get?**

**Tasks:**
- Write the matrix for the entire circuit
- Predict the output probabilities
- Verify your prediction with simulation
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
md"""
## Key Insights

### Why Decompose?

1. **Hardware Constraints:** Different devices support different native gates
2. **Optimization:** Minimize circuit depth and two-qubit gate count
3. **Error Reduction:** Fewer gates = fewer errors (gates are noisy)
4. **Performance:** Shorter circuits run faster on real hardware

### Common Strategies

1. **Substitute non-native gates** with universal set equivalents
2. **Cancel gates:** XX = I, HH = I, etc.
3. **Commute gates:** Rearrange for parallelization
4. **Merge single-qubit gates:** Combine consecutive rotations
5. **Use CX instead of CZ:** Convert between controlled gates
"""

# ╔═╡ 00000000-0000-0000-0000-000000000003
md"""
## Module 2 Summary

### What You've Learned

✓ **Lesson 2.1:** Single-qubit Pauli gates (X, Y, Z)
✓ **Lesson 2.2:** Hadamard and phase gates
✓ **Lesson 2.3:** Multi-qubit gates (CNOT, Toffoli)
✓ **Lesson 2.4:** Universal gate sets and universality
✓ **Lesson 2.5:** Gate decomposition and optimization

### Next Steps

→ **Module 3:** Build quantum circuits using these gates
→ **Module 4:** Implement quantum algorithms

### Additional Resources

- IBM Quantum Composer: Interactive circuit builder
- MIT OpenCourseware: Quantum computing course
- Qiskit Documentation: Gate library and tutorials
"""

# ╔═╡ 00000000-0000-0000-0000-000000000004
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c51"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Plots = "~1.38.0"
PlutoUI = "~0.7.51"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000005
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.1"
manifest_format = "2.0"
project_hash = "525dcfd80d74b547385aa255d2a38f1acddad3f3"
"""
