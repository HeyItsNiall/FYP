<header class="header_section">
    <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container">
            <a class="navbar-brand" href="{{ url('/') }}"><img width="250" src="/images/drsofa.png" alt="#" /></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""> </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item{{ Request::url() === url('/') ? ' active' : '' }}">
                        <a class="nav-link" href="{{ url('/') }}">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                            aria-haspopup="true" aria-expanded="true">
                            <span class="nav-label">Pages <span class="caret"></span></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="about.html">About</a></li>
                            <li><a href="testimonial.html">Testimonial</a></li>
                        </ul>
                    </li>
                    <li class="nav-item{{ Request::url() === url('products') ? ' active' : '' }}">
                        <a class="nav-link" href="{{ url('products') }}">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ url('reservations') }}">Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ url('show_cart') }}">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ url('show_order') }}">Order</a>
                    </li>
                    @auth
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <span class="nav-label">{{ Auth::user()->name }}</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="{{ url('user/profile') }}">Profile</a>
                                </li>
                                <li>
                                    <a href="{{ url('manage_booking') }}">Manage Reservations</a>
                                </li>
                                <li>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST">
                                        @csrf
                                        <button type="submit" class="dropdown-item">Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                    @else
                        <li class="nav-item">
                            <a class="btn btn-primary" id="logincss" href="{{ route('login') }}">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-success" href="{{ route('register') }}">Register</a>
                        </li>
                    @endauth
                </ul>
            </div>
        </nav>
    </div>
</header>
