# Restructured Site - Setup & Usage Guide

## Quick Start

1. Open `index.html` in a web browser
2. Navigate using the sidebar or navbar
3. Click on any link to load the corresponding page

## Troubleshooting

### Pages Not Loading
If pages don't load when you click links:

1. **Check the browser console** (F12 → Console tab)
2. **Verify file paths** - All content files should be in `content/` subdirectories
3. **Check CORS** - If running locally, some browsers may block file:// requests. Use a local server:
   ```bash
   # Python 3
   python -m http.server 8000
   
   # Or Node.js
   npx http-server
   ```
   Then open `http://localhost:8000/restructured/index.html`

### Mermaid Diagrams Not Displaying
If diagrams show as code instead of visual diagrams:

1. **Check Mermaid initialization** - The CDN script loads at page load
2. **Verify diagram syntax** - Mermaid diagrams use specific syntax (see examples below)
3. **Check console for errors** - Look for mermaid syntax errors

**Example Mermaid Diagram:**
```html
<pre class="mermaid">
graph LR
    A["Step 1"] --> B["Step 2"]
    B --> C["Step 3"]
</pre>
```

## File Structure

```
restructured/
├── index.html                          # Main entry point
├── assets/
│   ├── css/
│   │   └── styles.css                  # All styling (unified dark theme)
│   ├── js/
│   │   └── app.js                      # Navigation and interaction logic
│   └── layout/
│       ├── navbar.html                 # Top navigation bar
│       └── sidebar.html                # Left sidebar navigation
├── content/
│   ├── research/                       # Research & Quantum Computing
│   │   ├── quantum-computing.html
│   │   ├── data-resources.html
│   │   └── tools-catalog.html
│   ├── infrastructure/                 # Infrastructure & Deployment
│   │   ├── deployment-pipeline.html
│   │   ├── cloud-platforms.html
│   │   └── architecture-docs.html
│   ├── resources/                      # Research Resources
│   │   ├── universities.html
│   │   ├── journals.html
│   │   └── publications.html
│   └── admin/                          # Administration
│       ├── dashboard.html
│       ├── users-management.html
│       └── settings.html
└── README.md                           # This file
```

## Navigation

### Via Navbar (Top)
- **Research** dropdown - Quantum computing, data, tools
- **Infrastructure** dropdown - Deployment, cloud, architecture
- **Resources** dropdown - Universities, journals, publications

### Via Sidebar (Left)
- Expandable sections for all main categories
- Sub-sections with links to specific pages
- Responsive - collapses on mobile

## Key Features

✅ **Single-Page Application** - Fast page transitions without reloads
✅ **Dark Theme** - Professional dark interface with cyan accents (#00bfff)
✅ **Responsive Design** - Works on desktop, tablet, and mobile
✅ **Mermaid Diagrams** - Visual flowcharts and system diagrams
✅ **Content Organization** - Logical grouping by category
✅ **Unified Styling** - Consistent look across all pages

## Removed Redundancies

- ❌ Duplicate universities pages (consolidated into single source)
- ❌ Old site-old/ and wiki-old/ directories (archived content)
- ❌ Disorganized folder structure (reorganized into categories)
- ❌ Multiple style files (unified into single styles.css)

## Adding New Content

To add a new page:

1. **Create the HTML file** in the appropriate `content/` subdirectory
2. **Add the page ID** to the PAGES object in `index.html`:
   ```javascript
   'new-page-id': 'content/category/new-page.html'
   ```
3. **Add navigation link** in `navbar.html` and/or `sidebar.html`
4. **Use consistent styling** with content-box, section, card classes

## Browser Support

- Chrome/Chromium (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Performance Tips

1. **Use a local server** for best performance and CORS handling
2. **Check Network tab** in DevTools if pages load slowly
3. **Clear browser cache** if you see outdated content
4. **Disable browser extensions** that might interfere with JavaScript

## Contact & Support

For issues or improvements, refer to the main project documentation.
