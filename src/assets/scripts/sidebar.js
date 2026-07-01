// Dropdown toggle functionality
const sidebar = document.querySelector("#pages-sidebar")

document.querySelectorAll("h3.dropdown-toggle").forEach((toggle) => {
    toggle.addEventListener("click", function (e) {
        e.preventDefault()
        const section = this.closest("li.dropdown-section")
        section.classList.toggle("collapsed")

        // Save dropdown state to localStorage
        const sectionId = this.textContent.trim()
        const isCollapsed = section.classList.contains("collapsed")
        const dropdownStates = JSON.parse(localStorage.getItem("dropdown_states") || "{}")
        dropdownStates[sectionId] = isCollapsed
        localStorage.setItem("dropdown_states", JSON.stringify(dropdownStates))
    })
})

// Initialize dropdowns after DOM is ready
function initializeDropdowns() {
    const dropdownStates = JSON.parse(localStorage.getItem("dropdown_states") || "{}")
    document.querySelectorAll("h3.dropdown-toggle").forEach((toggle) => {
        const section = toggle.closest("li.dropdown-section")
        const sectionId = toggle.textContent.trim()

        const savedState = dropdownStates[sectionId]
        if (savedState === false) {
            section.classList.remove("collapsed")
        } else {
            section.classList.add("collapsed")
        }
    })
}

// Run initialization when DOM is ready
if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initializeDropdowns)
} else {
    initializeDropdowns()
}

document.querySelectorAll(".track-chooser select").forEach((trackSelect) => {
    const ontrack = () => {
        let track = trackSelect.value

        localStorage.setItem("chosen track", track)

        let lectures_homeworks = Array.from(sidebar.querySelectorAll(".lecture,.homework"))

        lectures_homeworks.forEach((el) => {
            let intrack = track === "" || el.classList.contains(`tag_track_${track}`) || el.classList.contains(`tag_welcome`)
            el.classList.toggle("not_in_track", !intrack)
        })
    }

    trackSelect.value = localStorage.getItem("chosen track")
    ontrack()
    trackSelect.addEventListener("change", ontrack)
})
