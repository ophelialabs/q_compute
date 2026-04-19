# Navbar component for rendering the top navigation bar

@htl("""
<!-- TOP NAVBAR -->
<header id="pages-navbar">
    <div class="navbar-container">
        <!-- Navbar Left: Logo/Title -->
        <div class="navbar-left">
            <a href="$(root_url)" class="navbar-logo" title="Home">
                <span class="logo-text">Q</span>
            </a>
            <a href="$(root_url)" class="navbar-title" title="Home">
                <span>$(metadata["course_info"]["course_name"])</span>
            </a>
        </div>
        
        <!-- Navbar Center: Search -->
        <div class="navbar-center">
            <form action="$(root_url)/search" method="GET" class="navbar-search">
                <input type="search" name="q" placeholder="Search lessons..." aria-label="Search">
                <button type="submit" aria-label="Search" title="Search">
                    <span>🔎</span>
                </button>
            </form>
        </div>
        
        <!-- Navbar Right: Theme + Menu -->
        <div class="navbar-right">
            <button id="theme-toggle" title="Switch theme" aria-label="Switch theme" class="navbar-icon"></button>
            <button id="toggle-nav" class="navbar-menu-toggle" title="Open navigation" aria-label="Open navigation"></button>
        </div>
    </div>
</header>
""")
