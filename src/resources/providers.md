---
title: "Quantum Providers"
layout: "md.jlmd"
---

# Resources
<section id="applications" class="section">
        <h2>Applications</h2>
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 24px; margin: 30px 0; padding: 0 20px;">
<!-- Provider Card -->
            <div style="padding: 24px; background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); border: 1px solid #e0e6ed; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08); transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;" onmouseover="this.style.transform='translateY(-4px)'; this.style.boxShadow='0 8px 20px rgba(0, 0, 0, 0.15)'" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 12px rgba(0, 0, 0, 0.08)'">
                <h3 style="margin-top: 0; color: #2c3e50; font-size: 1.4em;">🏥 Provider</h3>
                <p style="color: #555; line-height: 1.6; margin: 12px 0 0 0;">Advanced quantum algorithms for enhanced diagnostic imaging, pattern recognition in medical data, and predictive health analytics using quantum-classical hybrid approaches.</p>
                    <div style="align: center">
                        <select id="provider-select" style="padding: 8px 12px; border-radius: 4px; border: 1px solid #ddd; font-size: 14px;">
                            <option value="">-- Choose a Provider --</option>
                            <option value="azure">Microsoft: Azure Quantum</option>
                            <option value="quantinuum">Honeywell: Quantinuum Nexus</option>
                            <option value="guppy">Guppy</option>
                            <option value="ibm">IBM Quantum: Qiskit</option>
                            <option value="google">Google Quantum AI: Cirq & Sycamore</option>
                            <option value="braket">Amazon: Braket</option>
                            <option value="rigetti">Rigetti: Forest</option>
                            <option value="ionq">IonQ: Quantum Cloud</option>
                            <option value="dwave">D-Wave: Quantum Annealing</option>
                            <option value="dwave-docs">D-Wave Documentation</option>
                            <option value="xanadu">Xanadu: Strawberry Fields</option>
                            <option value="quantum-inspire">Quantum Inspire</option>
                        </select>
                    </div>
            </div>
<!-- Tools Card -->
            <div style="padding: 24px; background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%); border: 1px solid #e0e6ed; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08); transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;" onmouseover="this.style.transform='translateY(-4px)'; this.style.boxShadow='0 8px 20px rgba(0, 0, 0, 0.15)'" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 12px rgba(0, 0, 0, 0.08)'">
                <h3 style="margin-top: 0; color: #2c3e50; font-size: 1.4em;">🤖 Robotics Control</h3>
                <p style="color: #555; line-height: 1.6; margin: 12px 0 0 0;">Quantum-optimized control systems for complex robotic tasks, trajectory optimization, and real-time decision making using quantum advantage.</p>
                <div>
                <select id="tool-select" style="padding: 8px 12px; border-radius: 4px; border: 1px solid #ddd; font-size: 14px;">
                    <option value="">-- Choose a Tool --</option>
                    <option value="circuitdiagrams">Circuit Diagrams</option>
                </select>
                </div>
            </div>
<!-- Optimization Problems -->
            <div style="padding: 24px; background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); border: 1px solid #e0e6ed; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08); transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;" onmouseover="this.style.transform='translateY(-4px)'; this.style.boxShadow='0 8px 20px rgba(0, 0, 0, 0.15)'" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 12px rgba(0, 0, 0, 0.08)'">
                <h3 style="margin-top: 0; color: #2c3e50; font-size: 1.4em;">⚙️ Optimization Problems</h3>
                <p style="color: #555; line-height: 1.6; margin: 12px 0 0 0;">Solving complex optimization challenges in logistics, finance, and resource allocation using QAOA and other quantum optimization algorithms.</p>
                <div>
                <select id="tool-select" style="padding: 8px 12px; border-radius: 4px; border: 1px solid #ddd; font-size: 14px;">
                    <option value="">-- Choose a Tool --</option>
                    <option value="circuitdiagrams">Circuit Diagrams</option>
                </select>
                </div>
            </div>
<!-- Machine Learning -->
            <div style="padding: 24px; background: linear-gradient(135deg, #ffeaa7 0%, #fdcb6e 100%); border: 1px solid #e0e6ed; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08); transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;" onmouseover="this.style.transform='translateY(-4px)'; this.style.boxShadow='0 8px 20px rgba(0, 0, 0, 0.15)'" onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 12px rgba(0, 0, 0, 0.08)'">
                <h3 style="margin-top: 0; color: #2c3e50; font-size: 1.4em;">🤖 Machine Learning</h3>
                <p style="color: #555; line-height: 1.6; margin: 12px 0 0 0;">Accelerated machine learning pipelines leveraging quantum machine learning techniques for classification, clustering, and pattern recognition.</p>
                <div>
                <select id="tool-select" style="padding: 8px 12px; border-radius: 4px; border: 1px solid #ddd; font-size: 14px;">
                    <option value="">-- Choose a Tool --</option>
                    <option value="circuitdiagrams">Circuit Diagrams</option>
                </select>
                </div>
            </div>
        </div>
</section>

<div id="provider-content" style="margin-top: 30px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background: var(--pluto-background, #f8f9fa); display: none;">
    <div style="display: flex; gap: 20px;">
        <img id="provider-img" src="" alt="Provider Logo" style="width: 150px; height: 150px; object-fit: cover; border-radius: 4px;">
        <div style="flex: 1;">
            <h2 id="provider-title" style="margin-top: 0;"></h2>
            <p id="provider-category" style="font-size: 12px; color: #667eea; font-weight: 600; text-transform: uppercase; margin: 8px 0;"></p>
            <p id="provider-description" style="line-height: 1.6; margin: 12px 0;"></p>
            <a id="provider-link" href="" target="_blank" style="display: inline-block; padding: 10px 16px; background: #667eea; color: white; text-decoration: none; border-radius: 4px; font-weight: 500;">Visit Website →</a>
        </div>
    </div>
</div>

<script>
const providers = {
    azure: {
        name: "Microsoft: Azure Quantum",
        url: "https://azure.microsoft.com/en-us/services/quantum/",
        description: "Microsoft's Azure Quantum platform offers access to quantum hardware, software tools, and resources for quantum computing development. Explore quantum algorithms, simulators, and cloud-based quantum services to accelerate your quantum computing journey.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    quantinuum: {
        name: "Honeywell: Quantinuum Nexus",
        url: "https://docs.quantinuum.com/nexus/index.html",
        description: "Quantinuum's Nexus platform documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    guppy: {
        name: "Guppy",
        url: "https://docs.quantinuum.com/guppy/getting_started.html",
        description: "Guppy is a quantum programming language developed by Quantinuum. It offers a high-level syntax for expressing quantum algorithms and is designed to be user-friendly for both beginners and experienced quantum programmers.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    ibm: {
        name: "IBM Quantum: Qiskit",
        url: "https://www.ibm.com/quantum/",
        description: "Access IBM's quantum processors and simulators through the cloud. Learn quantum computing with real quantum hardware on enterprise infrastructure using RHEL and HashiCorp tools (Terraform, Vault, Consul) for scalable deployment and management.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    google: {
        name: "Google Quantum AI: Cirq & Sycamore",
        url: "https://quantumai.google/",
        description: "Explore Google's quantum computing initiatives and resources. Access quantum hardware, software tools, and research insights from one of the leading companies in quantum technology.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    braket: {
        name: "Amazon: Braket",
        url: "https://aws.amazon.com/braket/",
        description: "Amazon Braket is a fully managed quantum computing service that helps you get started with quantum computing. It provides access to quantum hardware from multiple providers, as well as a development environment for building and testing quantum algorithms.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    rigetti: {
        name: "Rigetti: Forest",
        url: "https://www.rigetti.com/forest",
        description: "Rigetti's Forest platform documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    ionq: {
        name: "IonQ: Quantum Cloud",
        url: "https://ionq.com/quantum-cloud",
        description: "IonQ's Quantum Cloud documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    dwave: {
        name: "D-Wave: Quantum Annealing",
        url: "https://www.dwavesys.com/quantum-computing/quantum-annealing",
        description: "D-Wave's quantum annealing platform documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    "dwave-docs": {
        name: "D-Wave Documentation",
        url: "https://docs.dwavequantum.com/en/latest/",
        description: "Access D-Wave's quantum annealing resources and documentation. Explore an alternative approach to quantum computing using adiabatic quantum computation.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    xanadu: {
        name: "Xanadu: Strawberry Fields",
        url: "https://www.xanadu.ai/strawberryfields",
        description: "Xanadu's Strawberry Fields documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    },
    "quantum-inspire": {
        name: "Quantum Inspire",
        url: "https://www.quantum-inspire.com/",
        description: "Quantum Inspire is a quantum computing platform developed by QuTech. It provides access to quantum hardware and simulators, as well as a development environment for building and testing quantum algorithms. Quantum Inspire is designed to be user-friendly and accessible to researchers, educators, and students interested in quantum computing.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Core Quantum Platforms"
    }
};

function initProviderSelector() {
    const select = document.getElementById('provider-select');
    if (!select) {
        console.error('provider-select element not found');
        return;
    }
    
    select.addEventListener('change', function(e) {
        const selectedKey = e.target.value;
        if (selectedKey && providers[selectedKey]) {
            const provider = providers[selectedKey];
            document.getElementById('provider-title').textContent = provider.name;
            document.getElementById('provider-description').textContent = provider.description;
            document.getElementById('provider-img').src = provider.img;
            document.getElementById('provider-category').textContent = provider.category;
            document.getElementById('provider-link').href = provider.url;
            document.getElementById('provider-content').style.display = 'flex';
        } else {
            document.getElementById('provider-content').style.display = 'none';
        }
    });
}

const tools = {
    : {
        name: "Circuit Diagrams",
        url: "https://github.com/microsoft/qdk/wiki/Circuit-Diagrams-from-Q%23-Code/",
        description: "Learn how to visualize quantum circuits from Q# code. Essential for understanding circuit representation and gate operations.",
        img: "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
        category: "Quantum Concepts & Visualization"
    },
};

function initToolSelector() {
    const select = document.getElementById('tool-select');
    if (!select) {
        console.error('provider-select element not found');
        return;
    }
    
    select.addEventListener('change', function(e) {
        const selectedKey = e.target.value;
        if (selectedKey && providers[selectedKey]) {
            const provider = providers[selectedKey];
            document.getElementById('provider-title').textContent = provider.name;
            document.getElementById('provider-description').textContent = provider.description;
            document.getElementById('provider-img').src = provider.img;
            document.getElementById('provider-category').textContent = provider.category;
            document.getElementById('provider-link').href = provider.url;
            document.getElementById('provider-content').style.display = 'flex';
        } else {
            document.getElementById('provider-content').style.display = 'none';
        }
    });
}

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initProviderSelector);
} else {
    initProviderSelector();
}
</script> 
    
