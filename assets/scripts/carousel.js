// Carousel functionality for highlights
document.addEventListener("DOMContentLoaded", () => {
    const carousel = document.querySelector(".carousel-track")
    const dots = document.querySelectorAll(".carousel-dots .dot")
    const prevBtn = document.querySelector(".carousel-btn.prev")
    const nextBtn = document.querySelector(".carousel-btn.next")

    if (!carousel) return // Exit if carousel doesn't exist

    let currentSlide = 0
    const slides = document.querySelectorAll(".carousel-slide")
    const totalSlides = slides.length

    if (totalSlides === 0) return

    function updateCarousel() {
        const offset = -currentSlide * 100
        carousel.style.transform = `translateX(${offset}%)`

        // Update dots
        dots.forEach((dot, index) => {
            if (index === currentSlide) {
                dot.classList.add("active")
            } else {
                dot.classList.remove("active")
            }
        })
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides
        updateCarousel()
    }

    function prevSlide() {
        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides
        updateCarousel()
    }

    function goToSlide(index) {
        currentSlide = index
        updateCarousel()
    }

    // Event listeners for buttons
    if (prevBtn) prevBtn.addEventListener("click", prevSlide)
    if (nextBtn) nextBtn.addEventListener("click", nextSlide)

    // Event listeners for dots
    dots.forEach((dot, index) => {
        dot.addEventListener("click", () => goToSlide(index))
    })

    // Keyboard navigation
    document.addEventListener("keydown", (e) => {
        if (e.key === "ArrowLeft") prevSlide()
        if (e.key === "ArrowRight") nextSlide()
    })

    // Auto-advance carousel every 8 seconds
    setInterval(nextSlide, 8000)
})
