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
    
    # References section with complementary resources - defined directly instead of loading from YAML
    "references" => [
        Dict("name" => "Azure Quantum Ignite",
             "url" => "https://learn.microsoft.com/en-us/azure/quantum/",
             "description" => "Microsoft's comprehensive guide to quantum computing on Azure. Learn about quantum hardware access, development tools, and cloud-based quantum simulation.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "D-Wave Documentation",
             "url" => "https://docs.dwavequantum.com/en/latest/",
             "description" => "Access D-Wave's quantum annealing resources and documentation. Explore an alternative approach to quantum computing using adiabatic quantum computation.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Core Quantum Platforms"
        ),
        Dict("name" => "Quantum Katas",
             "url" => "https://quantum.microsoft.com/en-us/tools/quantum-katas",
             "description" => "Interactive programming exercises designed to teach quantum computing concepts hands-on. Perfect for reinforcing your understanding through coding practice.",
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
        Dict("name" => "Materials Science Learning",
             "url" => "https://matsci.org/",
             "description" => "Explore materials science principles. Relevant for understanding quantum applications in material simulation and discovery.",
             "img" => "https://user-images.githubusercontent.com/6933510/168320384-9c8b1e5c-7a3d-4f2e-9b1c-8a0e5a7c6b9c.png",
             "category" => "Quantum Concepts & Visualization"
        )
    ]
)