# Troubleshooting Guide - Restructured Site Issues

## Issue #1: Mermaid Diagrams Don't Display

### Symptoms
- Diagrams show as raw code in `<pre class="mermaid">` blocks
- No visual flowcharts or graphs appear

### Root Causes & Solutions

#### A. Mermaid Library Not Loading
**Check:** Browser Console (F12 → Console tab)
```javascript
// Run this in console to check:
console.log(window.mermaid);
// Should output: {initialize: ƒ, run: ƒ, ...}
```

**Fix:** Ensure the CDN is accessible:
```html
<!-- Should be in <head> -->
<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
```

#### B. Mermaid Not Initialized
**Check:** The initialization happens BEFORE any diagrams render:
```javascript
// This must run before mermaid.run()
mermaid.initialize({ 
    startOnLoad: false,
    theme: 'dark',
    securityLevel: 'loose'
});
```

**Fix:** This is already in index.html `<head>`. If not rendering:
- Clear browser cache (Ctrl+Shift+Delete)
- Hard refresh (Ctrl+Shift+R)

#### C. Mermaid.run() Not Called After Content Load
**Check:** The page loading code must call `mermaid.run()` AFTER content loads:
```javascript
// CORRECT - run mermaid AFTER innerHTML is set
pageElement.innerHTML = html;
loadedPages.add(pageId);
setTimeout(() => {
    mermaid.run();  // ← This must happen AFTER content loads
}, 100);
```

**Fix:** Increase timeout if diagrams still don't render:
```javascript
// Try increasing delay
setTimeout(() => {
    mermaid.run();
}, 200);  // Increase from 100ms to 200ms
```

#### D. Diagram Syntax Errors
**Check:** Mermaid diagrams have specific syntax. Invalid syntax breaks rendering.

**Valid Example:**
```html
<pre class="mermaid">
graph LR
    A["Step 1"] -->|label| B["Step 2"]
    B --> C["Step 3"]
</pre>
```

**Invalid Example:**
```html
<pre class="mermaid">
graph LR
    A[Step 1]  <!-- Missing quotes -->
    B --> C
    <!-- Missing connections -->
</pre>
```

**Fix:** Validate diagram syntax at: https://mermaid.live/

### Testing Mermaid Rendering

Add this test diagram to any page to verify Mermaid works:

```html
<h3>Test Diagram</h3>
<pre class="mermaid">
graph TD
    A["Test Diagram"] -->|working| B["Mermaid Renders"]
    B --> C["Success!"]
</pre>
```

---

## Issue #2: Sidebar Links Don't Load Pages

### Symptoms
- Clicking sidebar links changes URL but doesn't load page content
- Page shows blank or doesn't switch sections

### Root Causes & Solutions

#### A. App.js Not Loaded or Initialized
**Check:** Browser Console → Look for initialization errors
```javascript
// These should exist:
window.initNavbar
window.initSidebar
```

**Fix:** Ensure app.js loads BEFORE page initialization script:
```html
<!-- Correct order -->
<script src="assets/js/app.js"></script>
<script>
    // Page loading logic here - runs AFTER app.js is loaded
</script>
```

#### B. Hash-Based Navigation Not Wired
**Check:** URL changes when you click links (should see `#page-name`)
```javascript
// Should log when hash changes
window.addEventListener('hashchange', () => {
    console.log('Hash changed to:', window.location.hash);
});
```

**Fix:** The index.html script handles hash changes. Verify it's running:
```javascript
window.addEventListener('hashchange', () => {
    navigateToPage(window.location.hash);
});
```

#### C. Page Element IDs Don't Match Page ID Map
**Check:** All these must match:
1. HTML element ID: `<div id="quantum-computing" class="page"></div>`
2. PAGES object key: `'quantum-computing': 'content/research/quantum-computing.html'`
3. Link href: `<a href="#quantum-computing">Quantum Computing</a>`

**Fix:** Verify mapping in index.html:
```javascript
const PAGES = {
    'quantum-computing': 'content/research/quantum-computing.html',
    'data-resources': 'content/research/data-resources.html',
    // ... all page IDs must match element IDs
};
```

#### D. Content Files Not Found (404)
**Check:** Browser Console → Network tab
- Look for failed requests to `content/research/quantum-computing.html`
- Status code 404 = file not found

**Fix:**
1. Verify file paths are correct and relative to `restructured/` directory
2. Ensure all content files exist:
   ```
   restructured/content/
   ├── research/
   │   ├── quantum-computing.html  ✓
   │   ├── data-resources.html     ✓
   │   └── tools-catalog.html      ✓
   ├── infrastructure/
   │   ├── deployment-pipeline.html ✓
   │   ├── cloud-platforms.html    ✓
   │   └── architecture-docs.html  ✓
   ├── resources/
   │   ├── universities.html       ✓
   │   ├── journals.html           ✓
   │   └── publications.html       ✓
   └── admin/
       ├── dashboard.html          ✓
       ├── users-management.html   ✓
       └── settings.html           ✓
   ```

#### E. Sidebar Toggle Not Working (Dropdown Won't Expand)
**Check:** Click on sidebar section title - dropdown should expand
```javascript
// Should toggle 'active' class
document.querySelectorAll('.sidebar-toggle')
```

**Fix:** Ensure `initSidebar()` is called:
```javascript
// In app.js, this creates the click handlers:
function initSidebar() {
    const sidebarToggles = document.querySelectorAll('.sidebar-toggle');
    sidebarToggles.forEach(toggle => {
        toggle.addEventListener('click', function(e) {
            e.preventDefault();
            const parent = this.parentElement;
            if (parent) {
                parent.classList.toggle('active');
            }
        });
    });
}
```

### Testing Page Navigation

1. **Check URL updates:** Click a link, URL should change to `index.html#page-name`
2. **Check page visibility:** Active page should have `class="page active"`
3. **Check content loads:** Inspect element to see if content HTML is inserted
4. **Check console:** Should see no errors, maybe see "Loading page..."

Test with this browser console command:
```javascript
// Manually trigger navigation
window.location.hash = '#quantum-computing';
```

---

## General Debugging Steps

### 1. Browser Console Checks
```javascript
// Check all required functions exist
console.log('Navbar init:', typeof initNavbar);  // function
console.log('Sidebar init:', typeof initSidebar);  // function
console.log('Mermaid:', typeof window.mermaid);  // object
console.log('Pages map:', PAGES);  // Should show all page IDs
```

### 2. Network Tab (F12 → Network)
Check that these files load successfully:
- ✓ `assets/layout/navbar.html` (status 200)
- ✓ `assets/layout/sidebar.html` (status 200)
- ✓ `assets/js/app.js` (status 200)
- ✓ `assets/css/styles.css` (status 200)
- ✓ `content/research/quantum-computing.html` (status 200)

If any show 404, file path is wrong.

### 3. Local Server vs. File Protocol
**Issue:** Chrome/Firefox may block file:// protocol

**Solution:** Run a local server:
```bash
# Python 3.x
cd /path/to/restructured
python -m http.server 8000

# Node.js
npx http-server

# Then visit: http://localhost:8000
```

### 4. Cache Busting
Clear browser cache between testing:
- **Windows/Linux:** Ctrl + Shift + Delete
- **Mac:** Cmd + Shift + Delete
- **Or:** Hard refresh Ctrl + Shift + R (Windows) or Cmd + Shift + R (Mac)

### 5. Check for JavaScript Errors
Most issues show in console. Look for:
- ❌ Uncaught ReferenceError: X is not defined
- ❌ Cannot read property 'innerHTML' of null
- ❌ Failed to fetch
- ❌ CORS errors (if not using local server)

---

## If All Else Fails

1. **Verify file structure:**
   ```bash
   # From restructured/ directory:
   ls -R
   ```

2. **Check file contents:**
   ```bash
   # Should show HTML content, not empty
   head -20 content/research/quantum-computing.html
   ```

3. **Use minimal test page:**
   Create `test.html` in `restructured/`:
   ```html
   <!DOCTYPE html>
   <html>
   <head>
       <title>Test</title>
       <link rel="stylesheet" href="assets/css/styles.css">
   </head>
   <body>
       <h1>Test Page</h1>
       <p>If you see this, styles load correctly</p>
       <script src="assets/js/app.js"></script>
       <script>
           console.log('App.js loaded');
           console.log('initNavbar:', typeof initNavbar);
       </script>
   </body>
   </html>
   ```

4. **Contact support** with console output and network tab screenshot

---

## Performance Tips

1. **Lazy loading works** - Pages only load when clicked
2. **Mermaid diagrams** render on demand (after page loads)
3. **Use local server** for 10x faster file loading
4. **Disable extensions** that might interfere (ad blockers, etc.)

---

## Additional Resources

- **Mermaid Docs:** https://mermaid.js.org/
- **MDN Web Docs:** https://developer.mozilla.org/
- **Browser DevTools Guide:** https://developer.chrome.com/docs/devtools/

**Last Updated:** January 13, 2026
