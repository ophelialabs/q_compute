Dict(
    # Page title and optional disclaimer for the homepage
    "title" => "Quantum Computing",
    "disclaimer" => "",
    
    # Jumbotron Carousel - Featured highlights displayed separately
    "carousel" => [
        Dict("name" => "Easy to customise", 
             "text" => md"Let the template automate all of the website development and infrastructure, so that you can focus on the most important thing:
             **easily develop your lesson materials!**",
             "img" => "https://user-images.githubusercontent.com/6933510/168320383-a401459b-97f5-41df-bc7b-ebe76e4886cc.png"
        ),
        Dict("name" => "Revolutionary interactivity with Pluto.jl",
             "text" => md"""
             Thanks to Pluto.jl, the website is built using real code, and instead of a book, we have a series of interactive notebooks.
             **On the website, students can play with sliders, buttons and images to interact with our simulations.**
             You can even go further, and modify and run any code on our website!
             """,
             "img" => "https://user-images.githubusercontent.com/6933510/136196607-16207911-53be-4abb-b90e-d46c946e6aaf.gif"
             ),
        Dict("name" => "Learn Julia",
             "text" => md"""
             In literature it's not enough to just know the technicalities of grammar.
             In music it's not enough to learn the scales. The goal is to communicate experiences and emotions.
             For a computer scientist, it's not enough to write a working program,
             the program should be written with beautiful high level abstractions that speak to your audience.
             **Julia is designed with this purpose in mind, use it in your teaching to harness its power.**
             """,
             "img" => "https://user-images.githubusercontent.com/6933510/136203632-29ce0a96-5a34-46ad-a996-de55b3bcd380.png"
             )    
    ],
    
    # References section with complementary resources
    "references" => [
        Dict("name" => "JupyterHub",
             "url" => "https://jupyterhub.readthedocs.io/",
             "description" => "Multi-user Jupyter notebook server for collaborative computing. Deploy and manage Jupyter environments for educational use and shared development.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Interactive Learning & Tools"
        ),
        Dict("name" => "QT",
            "url" => "https://www.qt.io/development/tools",
            "description" => "QT is a powerful cross-platform application development framework. It provides tools for building interactive applications with rich graphical interfaces, making it ideal for creating engaging educational content and simulations in quantum computing.",
            "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.pn",
            "category" => "Interactive Learning & Tools"
        ),
        Dict("name" => "Q# IOT Project",
             "url" => "https://github.com/jlabclouds/qsharpIoT",
             "description" => "A practical project that integrates Q# with IoT devices. Learn how to connect quantum computing concepts with real-world applications in the Internet of Things (IoT) domain.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ), 
        Dict("name" => "Nuget F#",
             "url" => "https://www.nuget.org/packages/FSharp.Azure.Quantum#c-fluent-api",
             "description" => "NuGet package for F# Azure Quantum development. Provides tools and libraries for building quantum applications using F# on the Azure Quantum platform.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Quantum Katas",
             "url" => "https://quantum.microsoft.com/en-us/tools/quantum-katas",
             "description" => "Interactive programming exercises designed to teach quantum computing concepts hands-on. Perfect for reinforcing your understanding through coding practice. Added this before Azure Quantum Ignite to utilize Azure's trial period after completing the katas.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Interactive Learning & Tools"
        ),
        Dict("name" => "Algorithm Visualizer",
             "url" => "https://algorithm-visualizer.org/",
             "description" => "Visualize classic algorithms step-by-step. Useful for understanding algorithmic foundations that underpin quantum algorithms.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Interactive Learning & Tools"
        ),
        Dict("name" => "Circuit Diagrams",
             "url" => "https://github.com/microsoft/qdk/wiki/Circuit-Diagrams-from-Q%23-Code",
             "description" => "Learn how to visualize quantum circuits from Q# code. Essential for understanding circuit representation and gate operations.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Quantum Concepts & Visualization"
        ),
        Dict("name" => "Azure Quantum: Ignite",
             "url" => "https://learn.microsoft.com/en-us/azure/quantum/",
             "description" => "Microsoft's comprehensive guide to quantum computing on Azure. Learn about quantum hardware access, development tools, and cloud-based quantum simulation.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Guppy",
            "url" => "https://docs.quantinuum.com/guppy/getting_started.html",
            "description" => "Guppy is a quantum programming language developed by Quantinuum. It offers a high-level syntax for expressing quantum algorithms and is designed to be user-friendly for both beginners and experienced quantum programmers.",
            "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.pn",
            "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Honeywell: Quantinuum Nexus",
             "url" => "https://docs.quantinuum.com/nexus/index.html",
             "description" => "Quantinuum's Nexus platform documentation. Access quantum hardware, software tools, and resources from one of the leading companies in quantum technology.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
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
        Dict("name" => "D-Wave Documentation",
             "url" => "https://docs.dwavequantum.com/en/latest/",
             "description" => "Access D-Wave's quantum annealing resources and documentation. Explore an alternative approach to quantum computing using adiabatic quantum computation.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
         Dict("name" => "Quantum Algorithm Zoo",
             "url" => "https://quantumalgorithmzoo.org/",
             "description" => "A comprehensive collection of quantum algorithms categorized by their applications. A valuable resource for exploring the breadth of quantum algorithmic techniques.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Quantum Algorithms"
        )
    ]
)
