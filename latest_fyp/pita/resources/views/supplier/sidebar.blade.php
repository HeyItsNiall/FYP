<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
        <a class="sidebar-brand brand-logo" href="{{ url('/redirect') }}"><img src="/images/drsofa.png"
                alt="logo" /></a>
        <a class="sidebar-brand brand-logo-mini" href="{{ url('/redirect') }}"><img src="/images/drsofa.png"
                alt="logo" /></a>
    </div>
    <ul class="nav">
        <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" href="{{ url('/redirect') }}">
                <span class="menu-icon">
                    <i class="mdi mdi-speedometer"></i>
                </span>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-icon">
                    <i class="mdi mdi-laptop"></i>
                </span>
                <span class="menu-title">Stock</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="{{ url('/supplier_stock') }}">Stock Requested</a>
                    <li class="nav-item"> <a class="nav-link" href="{{ url('/stocklist') }}">Stock</a></li>
                    <li class="nav-item"> <a class="nav-link" href="{{ url('/show_stock') }}">All Stock</a></li>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</nav>
