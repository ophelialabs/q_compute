// Navbar menu toggle functionality
const sidebar = document.querySelector("#pages-sidebar")
const layout = document.querySelector("#pages-layout")
const navtoggle = document.querySelector(".navbar-menu-toggle")

if (navtoggle) {
    navtoggle.addEventListener("click", function (e) {
        layout.classList.toggle("pages_show_sidebar")
        e.stopPropagation()
    })
}

// Close sidebar when clicking outside
window.addEventListener("click", function (e) {
    if (sidebar && navtoggle && !sidebar.contains(e.target) && !navtoggle.contains(e.target)) {
        layout.classList.remove("pages_show_sidebar")
    }
})
