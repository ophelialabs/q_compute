1. Choose your track should act like search, direct user to landing page
2. Create table to plan out cross-reference and for tag
3. SOC vs uni. => Combined search, mkdir humanities, science etc...
4. Add images/icons to landscapes for better vis, clarity, mem retention

# Quantum Computing Learning Course

An extensive, in-depth quantum computing curriculum built with **Julia** and **PlutoPages**, featuring interactive Pluto notebooks, hands-on exercises, and comprehensive coverage from fundamentals to advanced research topics.

<p align="center">
<a href="https://jlabclouds.github.io/q_compute"><b>→ View Course Website</b></a>
</p>

## 📚 Course Overview

This is a **8-module, 40-lesson interactive course** designed to take learners from quantum computing novices to practitioners capable of understanding and implementing complex quantum algorithms. All code examples are implemented in **Julia** leveraging the rich ecosystem of quantum computing libraries.

### 🎯 Learning Objectives

By completing this course, you will:
- Understand the fundamental principles of quantum mechanics relevant to computing
- Master quantum gates, circuits, and circuit design patterns
- Implement canonical quantum algorithms (Deutsch, Grover, Shor, VQE)
- Explore quantum machine learning techniques and applications
- Understand quantum error correction and fault tolerance
- Stay current with cutting-edge quantum computing research

## 📖 Course Modules

### **Module 1: Foundations** (Weeks 1-3)
- Classical vs. Quantum Computing
- Qubits, Superposition, and Entanglement
- Measurement and the Bloch Sphere
- Quantum State Representation

### **Module 2: Quantum Gates** (Weeks 3-5)
- Single-Qubit Gates (Pauli, Hadamard, Phase)
- Multi-Qubit Gates (CNOT, Toffoli)
- Universal Gate Sets and Completeness
- Gate Decomposition Techniques

### **Module 3: Quantum Circuits** (Weeks 5-7)
- Circuit Construction and Composition
- Circuit Optimization Strategies
- Practical Circuit Building with Julia/Yao.jl
- Real Hardware Considerations

### **Module 4: Quantum Algorithms - Part I** (Weeks 7-10)
- Deutsch & Deutsch-Jozsa Algorithms
- Simon's Algorithm
- Grover's Search Algorithm
- Algorithm Implementation and Analysis

### **Module 5: Quantum Algorithms - Part II** (Weeks 10-13)
- Phase Estimation and Quantum Fourier Transform
- Shor's Factoring Algorithm
- Variational Quantum Algorithms (VQA)
- QAOA and Ansatz Design

### **Module 6: Quantum Error Correction** (Weeks 13-15)
- Quantum Error Models and Detection
- Quantum Error Correction Codes
- Surface Codes and Stabilizer Codes
- Fault-Tolerant Quantum Computing

### **Module 7: Quantum Machine Learning** (Weeks 15-17)
- Quantum Feature Maps and Kernels
- Variational Quantum Classifiers
- Quantum Neural Networks
- QSVM and Real-World QML Applications

### **Module 8: Advanced Topics & Research** (Weeks 17-20)
- Quantum Simulation and Hamiltonian Dynamics
- Quantum Approximate Optimization
- Topological Quantum Computing
- Current Hardware Landscape
- Research Frontiers

## 🛠️ Technology Stack

- **Language**: Julia 1.10+
- **Course Delivery**: PlutoPages (static site generation)
- **Interactive Notebooks**: Pluto.jl
- **Quantum Computing**: 
  - Yao.jl (circuit simulation)
  - QuantumOptics.jl (quantum state operations)
  - Qiskit.jl (bridge to Qiskit ecosystem)
- **Visualization**: Plots.jl, Makie.jl, HypertextLiteral.jl
- **Linear Algebra**: LinearAlgebra.jl, StaticArrays.jl

## 🚀 Getting Started

### Prerequisites
- Julia 1.10 or later installed
- Basic linear algebra knowledge
- Familiarity with complex numbers

### Local Development

1. **Clone the repository**:
   ```bash
   git clone https://github.com/jlabclouds/q_compute.git
   cd q_compute
   ```

2. **Install Julia dependencies**:
   ```bash
   julia
   ] instantiate  # or: using Pkg; Pkg.instantiate()
   ```

3. **Run development server**:
   ```bash
   julia develop.jl
   ```
   The site will be available at `http://localhost:1234` (or specified port)

4. **View course**: Open your browser and navigate to the local URL

### File Structure

```
q_compute/
├── src/
│   ├── index.jlmd                    # Homepage
│   ├── cheatsheets.md                # Quick reference
│   ├── search.md                     # Search functionality
│   └── _data/
│   │   ├── course_info.jl            # Course metadata
│   │   ├── sidebar.jl                # Navigation structure
│   │   └── tracks.jl                 # Learning paths
│   ├── _includes/
│   │   ├── layout.jlhtml             # Page template
│   │   └── welcome.jlmd              # Welcome content
│   ├── assets/
│   │   ├── scripts/                  # JavaScript utilities
│   │   └── styles/                   # CSS styling
│   └── modules/                      # Course modules
│       ├── mod1_foundations/
│       ├── mod2_gates/
│       ├── mod3_circuits/
│       ├── mod4_algorithms_i/
│       ├── mod5_algorithms_ii/
│       ├── mod6_error_correction/
│       ├── mod7_qml/
│       └── mod8_advanced/
├── tools/
│   └── update_notebook_packages.jl  # Dependency management
├── pluto-deployment-environment/    # Deployment config
├── Project.toml                      # Dependencies
├── PlutoPages.jl                     # Page generator
└── develop.jl                        # Development server
```

## ✍️ Course Content

### Interactive Notebooks
Each lesson includes:
- **Theory**: Conceptual explanations with visualizations
- **Live Code**: Executable Julia examples with Pluto reactivity
- **Exercises**: Hands-on problems with starter code
- **Visualizations**: Circuit diagrams, state plots, measurement statistics

### Example Lesson Structure
```julia
# Lesson 1.2: Qubits and Superposition
# - Bloch sphere visualization
# - State preparation examples
# - Measurement probabilities
# - Interactive parameter exploration
```

### Code Examples

All code examples demonstrate:
- Quantum state representation (state vectors, density matrices)
- Circuit construction with Yao.jl
- Parameter sweeps and visualization
- GPU acceleration options (where applicable)
- Performance benchmarking

## 📝 Exercises & Assessments

### Exercise Types
1. **Conceptual Exercises**: Multiple choice and short answer
2. **Coding Exercises**: Write-the-code problems with test cases
3. **Projects**: Multi-week assignments combining multiple concepts
4. **Quizzes**: Module-based knowledge checks

### Problem Sets
- 30+ hands-on coding exercises
- Progressive difficulty from basic to research-level
- Full solutions and explanations provided
- Performance analysis and optimization challenges

## 🔬 Advanced Topics

Modules 7-8 include coverage of:
- **Variational Quantum Algorithms**: VQE, QAOA implementations
- **Quantum Machine Learning**: Feature maps, kernels, classifiers
- **Error Correction**: Surface codes, error syndrome extraction
- **Quantum Simulation**: Hamiltonian evolution, trotterization
- **Research Frontiers**: Topological QC, hybrid algorithms

## 🤖 Agent-Assisted Learning

This course is generated and maintained by a specialized **Quantum Computing Learning Agent** that:
- Generates and updates course content automatically
- Maintains consistency across all modules
- Ensures Julia code quality and best practices
- Updates dependencies and packages
- Adapts content based on latest QDK/Yao.jl versions

See [AGENTS.md](./AGENTS.md) for details on agent capabilities and customization.

## 📊 Course Statistics

- **Total Modules**: 8
- **Total Lessons**: 40+
- **Code Examples**: 100+
- **Exercises**: 30+
- **Estimated Duration**: 20 weeks (self-paced)
- **Lines of Julia Code**: 2000+
- **Visualizations**: 50+

## 🤝 Contributing

We welcome contributions! Please see [AGENTS.md](./AGENTS.md) for:
- Extending course modules
- Adding new quantum algorithms
- Improving visualizations
- Fixing errors or outdated content

## 📚 References & Resources

### Core Textbooks
- Nielsen & Chuang, "Quantum Computation and Quantum Information" (2010)
- Preskill, "Quantum Computing in the NISQ era and beyond" (2018)

### Julia Quantum Libraries
- [Yao.jl Documentation](https://yaoquantum.org/)
- [QuantumOptics.jl](https://qojulia.org/)
- [Qiskit.jl](https://www.qiskit.org/)

### Interactive Learning
- IBM Quantum Learning
- Qiskit Tutorials
- AWS Braket Academy

## ⚖️ License

This course material is licensed under [Creative Commons Attribution 4.0 International License](LICENSE.md).

## 👥 Authors & Maintainers

Course developed and maintained by the quantum computing education team.

---

**Start learning**: Visit the [course website](https://jlabclouds.github.io/q_compute) or run locally with `julia develop.jl`
