// Theme management with localStorage persistence
const THEME_KEY = "q_compute_theme"
const LIGHT_THEME = "light"
const DARK_THEME = "dark"

class ThemeManager {
    constructor() {
        this.init()
    }

    init() {
        // Get saved theme or use system preference
        const savedTheme = localStorage.getItem(THEME_KEY)
        const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches

        if (savedTheme) {
            this.setTheme(savedTheme)
        } else {
            this.setTheme(prefersDark ? DARK_THEME : LIGHT_THEME)
        }

        // Listen for system preference changes
        window.matchMedia("(prefers-color-scheme: dark)").addEventListener("change", (e) => {
            if (!localStorage.getItem(THEME_KEY)) {
                this.setTheme(e.matches ? DARK_THEME : LIGHT_THEME)
            }
        })

        // Setup toggle button
        this.setupToggleButton()
    }

    setTheme(theme) {
        const html = document.documentElement
        html.setAttribute("data-theme", theme)
        localStorage.setItem(THEME_KEY, theme)
        this.updateToggleButton()
    }

    toggleTheme() {
        const currentTheme = document.documentElement.getAttribute("data-theme") || DARK_THEME
        const newTheme = currentTheme === DARK_THEME ? LIGHT_THEME : DARK_THEME
        this.setTheme(newTheme)
    }

    setupToggleButton() {
        const button = document.querySelector("#theme-toggle")
        if (button) {
            button.addEventListener("click", () => this.toggleTheme())
            this.updateToggleButton()
        }
    }

    updateToggleButton() {
        const button = document.querySelector("#theme-toggle")
        if (button) {
            const currentTheme = document.documentElement.getAttribute("data-theme")
            button.setAttribute("aria-label", `Switch to ${currentTheme === DARK_THEME ? "light" : "dark"} mode`)
            button.setAttribute("title", `Switch to ${currentTheme === DARK_THEME ? "light" : "dark"} mode`)
        }
    }

    getCurrentTheme() {
        return document.documentElement.getAttribute("data-theme") || DARK_THEME
    }
}

// Initialize theme manager when DOM is ready
if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", () => {
        window.themeManager = new ThemeManager()
    })
} else {
    window.themeManager = new ThemeManager()
}
