/**
 * Cheatsheets Modal Popup Handler
 * Manages icon card selection and modal display
 */

class CheatsheetsModal {
    constructor() {
        this.modal = null
        this.init()
    }

    init() {
        // Initialize event listeners for all icon cards
        document.querySelectorAll(".icon-card").forEach((card) => {
            card.addEventListener("click", (e) => this.openModal(e, card))
        })

        // Close modal on outside click
        document.addEventListener("click", (e) => {
            if (this.modal && e.target === this.modal && e.target.classList.contains("modal-overlay")) {
                this.closeModal()
            }
        })

        // Close modal on Escape key
        document.addEventListener("keydown", (e) => {
            if (e.key === "Escape" && this.modal) {
                this.closeModal()
            }
        })
    }

    openModal(event, card) {
        event.preventDefault()

        // Get data from card
        const icon = card.querySelector("img")
        const label = card.querySelector(".icon-card-label")
        const link = card.querySelector("a")

        if (!icon || !label || !link) return

        const iconSrc = icon.src
        const iconAlt = icon.alt
        const title = link.textContent
        const href = link.href
        const description = link.title || label.textContent

        // Create modal HTML
        const modalHTML = `
      <div class="modal-overlay">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-header-icon">
              <img src="${iconSrc}" alt="${iconAlt}" />
            </div>
            <div class="modal-header-title">
              <h2>${this.escapeHtml(title)}</h2>
              <a href="${href}" target="_blank" rel="noopener noreferrer">${this.escapeHtml(href)}</a>
            </div>
            <button class="modal-close" aria-label="Close modal">&times;</button>
          </div>
          <div class="modal-body">
            <p>${this.escapeHtml(description)}</p>
          </div>
          <div class="modal-footer">
            <a href="${href}" target="_blank" rel="noopener noreferrer" class="modal-btn modal-btn-primary">
              Visit Resource
            </a>
            <button class="modal-btn" onclick="document.querySelector('.modal-overlay').remove(); window.cheatsheetsModal.modal = null;">
              Close
            </button>
          </div>
        </div>
      </div>
    `

        // Create and insert modal
        const tempDiv = document.createElement("div")
        tempDiv.innerHTML = modalHTML
        this.modal = tempDiv.querySelector(".modal-overlay")
        document.body.appendChild(this.modal)

        // Bind close button
        this.modal.querySelector(".modal-close").addEventListener("click", () => this.closeModal())

        // Prevent body scroll
        document.body.style.overflow = "hidden"
    }

    closeModal() {
        if (this.modal) {
            this.modal.remove()
            this.modal = null
            document.body.style.overflow = ""
        }
    }

    escapeHtml(text) {
        const map = {
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            '"': "&quot;",
            "'": "&#039;",
        }
        return text.replace(/[&<>"']/g, (m) => map[m])
    }
}

// Initialize when DOM is ready
if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", () => {
        window.cheatsheetsModal = new CheatsheetsModal()
    })
} else {
    window.cheatsheetsModal = new CheatsheetsModal()
}
