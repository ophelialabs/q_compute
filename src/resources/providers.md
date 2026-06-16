---
title: "Quantum Providers"
layout: "md.jlmd"
---

# Quantum Computing Providers

<div style="margin: 20px 0;">
    <label for="provider-select" style="font-weight: 600; margin-right: 10px;">Select a Provider:</label>
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

document.getElementById('provider-select').addEventListener('change', function(e) {
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
</script> 
    "providers" => [
        Dict("name" => "Microsoft: Azure Quantum",
             "url" => "https://azure.microsoft.com/en-us/services/quantum/",
             "description" => "Microsoft's Azure Quantum platform offers access to quantum hardware, software tools, and resources for quantum computing development. Explore quantum algorithms, simulators, and cloud-based quantum services to accelerate your quantum computing journey.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Honeywell: Quantinuum Nexus",
             "url" => "https://docs.quantinuum.com/nexus/index.html",
             "description" => "Quantinuum's Nexus platform documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Guppy",
            "url" => "https://docs.quantinuum.com/guppy/getting_started.html",
            "description" => "Guppy is a quantum programming language developed by Quantinuum. It offers a high-level syntax for expressing quantum algorithms and is designed to be user-friendly for both beginners and experienced quantum programmers.",
            "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.pn",
            "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "IBM Quantum: Qiskit",
             "url" => "https://www.ibm.com/quantum/",
             "description" => "Access IBM's quantum processors and simulators through the cloud. Learn quantum computing with real quantum hardware on enterprise infrastructure using RHEL and HashiCorp tools (Terraform, Vault, Consul) for scalable deployment and management.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Google Quantum AI: Cirq & Sycamore",
             "url" => "https://quantumai.google/",
             "description" => "Explore Google's quantum computing initiatives and resources. Access quantum hardware, software tools, and research insights from one of the leading companies in quantum technology.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Amazon: Braket",
             "url" => "https://aws.amazon.com/braket/",
             "description" => "Amazon Braket is a fully managed quantum computing service that helps you get started with quantum computing. It provides access to quantum hardware from multiple providers, as well as a development environment for building and testing quantum algorithms.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Rigetti: Forest",
             "url" => "https://www.rigetti.com/forest",
             "description" => "Rigetti's Forest platform documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "IonQ: Quantum Cloud",
             "url" => "https://ionq.com/quantum-cloud",
             "description" => "IonQ's Quantum Cloud documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "D-Wave: Quantum Annealing",
             "url" => "https://www.dwavesys.com/quantum-computing/quantum-annealing",
             "description" => "D-Wave's quantum annealing platform documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"         
        ),
        Dict("name" => "D-Wave Documentation",
             "url" => "https://docs.dwavequantum.com/en/latest/",
             "description" => "Access D-Wave's quantum annealing resources and documentation. Explore an alternative approach to quantum computing using adiabatic quantum computation.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Xanadu: Strawberry Fields",
             "url" => "https://www.xanadu.ai/strawberryfields",
             "description" => "Xanadu's Strawberry Fields documentation. Access quantum hardware, software  tools, and resources from one of the leading companies in quantum technology.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Quantum Inspire",
             "url" => "https://www.quantum-inspire.com/",
             "description" => "Quantum Inspire is a quantum computing platform developed by QuTech. It provides access to quantum hardware and simulators, as well as a development environment for building and testing quantum algorithms. Quantum Inspire is designed to be user-friendly and accessible to researchers, educators, and students interested in quantum computing.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
    ],
    
    # Learning resources section
    "learning_resources" => [
        Dict("name" => "Q#",
             "url" => "https://learn.microsoft.com/en-us/azure/quantum/qsharp-overview#structure-of-a-q-program",
             "description" => "Microsoft's Q# programming language documentation. Access resources for learning and developing quantum applications using Q# on the Azure Quantum platform.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Azure Quantum: Ignite",
             "url" => "https://learn.microsoft.com/en-us/azure/quantum/",
             "description" => "Microsoft's comprehensive guide to quantum computing on Azure. Learn about quantum hardware access, development tools, and cloud-based quantum simulation.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Quantum Katas",
             "url" => "https://quantum.microsoft.com/en-us/tools/quantum-katas",
             "description" => "Interactive programming exercises designed to teach quantum computing concepts hands-on. Perfect for reinforcing your understanding through coding practice. Added this before Azure Quantum Ignite to utilize Azure's trial period after completing the katas.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Interactive Learning & Tools"
        ),
        Dict("name" => "Qiskit Textbook",
             "url" => "https://qiskit.org/textbook/preface.html",
             "description" => "The Qiskit Textbook is an open-source resource for learning quantum computing. It provides a comprehensive introduction to quantum computing concepts, algorithms, and programming using the Qiskit framework. The textbook is designed for learners of all levels, from beginners to experienced programmers, and includes interactive examples, exercises, and real-world applications of quantum computing.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Interactive Learning & Tools"
        ),
        Dict("name" => "Microsoft Quantum Development Kit",
             "url" => "https://learn.microsoft.com/en-us/azure/quantum/development-kit-overview",
             "description" => "Microsoft's Quantum Development Kit documentation. Access resources for learning and developing quantum applications using the Quantum Development Kit on the Azure Quantum platform.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Q# Jupyter Notebooks",
             "url" => "https://github.com/microsoft/Quantum/blob/main/samples/getting-started/README.md",
             "description" => "A collection of Jupyter Notebooks for learning and developing quantum applications using the Q# programming language.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Interactive Learning & Tools"
        ),
        Dict("name" => "Quantum Programming Studio",
             "url" => "https://quantumprogrammingstudio.com/",
             "description" => "Quantum Programming Studio is an online platform for learning and developing quantum algorithms. It provides a user-friendly interface for writing and testing quantum code, as well as access to quantum hardware and simulators. Quantum Programming Studio is designed to be accessible to learners of all levels, making it an excellent resource for anyone interested in exploring quantum computing concepts and programming.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
    ]
