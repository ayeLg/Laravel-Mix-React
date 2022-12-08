<div class="header">
    <div class="w-80">
        <!-- navigation -->
        <div class="nav d-flex justify-content-between pt-3">
            <div class="nav-first d-flex justify-content-between align-items-center">
                <a href="{{ url('/') }}">
                    <img src="{{ asset('web_assets/images/logo.png') }}" width="50" alt="">
                </a>

                <div class="nav-item-group ml-5">

                    <a href="{{ url('/') }}"
                        class="text-white btn btn btn-outline-warning">{{ __('site.home') }}</a>
                    <a href="{{ url('/product') }}"
                        class="text-white btn btn btn-outline-dark">{{ __('site.product') }}</a>

                    <a href="" class="text-white btn btn btn-outline-dark ">{{ __('site.about') }}</a>


                    <a href="{{ url('/profile#/') }}" class="btn btn-outline-dark cart-container">
                        <i class="fas text-danger  fa-shopping-basket fs-1"></i>
                        <span class="cart-no bg-danger text-white" id="cartCount">{{ $cart_count }}</span>
                    </a>

                </div>
            </div>
            <div class="d-flex jusity-content-center">
                <div class=" d-flex justify-content-center align-items-center">
                    <div class="dropdown">
                        @if (auth()->user())
                            <button class="btn btn-dark text-white dropdown-toggle" type="button"
                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                {{ auth()->user()->name }}
                            </button>
                        @else
                            <button class="btn btn-dark text-white dropdown-toggle" type="button"
                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                Account
                            </button>
                        @endif

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            @guest
                                <a class="dropdown-item" href="{{ url('/login') }}">Login</a>
                                <a class="dropdown-item" href="{{ url('/register') }}">Register</a>
                            @endguest
                            @auth
                                <a class="dropdown-item" href="{{ url('/profile') }}">Profile</a>
                                <a class="dropdown-item" href="{{ url('/logout') }}">logout</a>

                            @endauth


                        </div>
                    </div>
                </div>
                <div class=" d-flex justify-content-center align-items-center">
                    <div class="dropdown">
                        <button class="btn btn-dark text-white dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Language
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="{{ url('/locale/mm') }}">မြန်မာ</a>
                            <a class="dropdown-item" href="{{ url('/locale/en') }}">English</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt-5 text-center p-5">
        <h1 class="text-center text-white">Welcome From M-Commerce</h1>
        <small class="">M-Commerce is Develop by mmcoder.com and for educational purpose...</small>


        <div class="mt-5">
            @if (!auth()->user())
                <a href="{{ url('/login') }}" class="btn btn-dark">Login</a>
                <a href="{{ url('/register') }}" class="btn btn-outline-dark text-white">Register</a>
            @endif

        </div>
    </div>
</div>
