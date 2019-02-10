@section('menu')
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <!-- Left Side Of Navbar -->
    	<ul class="navbar-nav mr-auto">
        <!-- Authentication Links -->
        	@auth
        		<li class="nav-item">
        	       	<a class="nav-link" href="{{ url('/menu1') }}">{{ __('Menu1') }}</a>
        	    </li>
        	    <li class="nav-item dropdown">
        	    	<a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
        	        	{{ __('Menu2') }} <span class="caret"></span>
        	        </a>
        	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">	
        	        	<a class="dropdown-item" href="{{ url('/submenu1') }}">{{ __('Submenu1') }}</a>
        	        	<a class="dropdown-item" href="{{ url('/submenu2') }}">{{ __('Submenu2') }}</a>
        	     	</div>
        	    </li>
        	@endauth
        </ul>
        <!-- Right Side Of Navbar -->
        <ul class="navbar-nav ml-auto">
        <!-- Authentication Links -->
            @guest
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                </li>
                <li class="nav-item">
                	@if (Route::has('register'))
   				        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                    @endif
                </li>
            @else
                <li class="nav-item dropdown">
            	    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                	    {{ Auth::user()->name }} <span class="caret"></span>
                    </a>
	                <div class="dropdown-menu" aria-labelledby="navbarDropdown">             
    	               	<a class="dropdown-item" href="{{ route('profile.index') }}">{{ __('Perfil') }}
    	               	</a>
                        @if (Auth::user()->id_perfil==1)
                            <a class="dropdown-item" href="{{ route('profile.index') }}">{{ __('Configuración') }}</a>
                        @endif
                        <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">{{ __('Logout') }}
          				</a>
            			<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display:none;">
                            @csrf
                        </form>
                    </div>
                </li>
            @endguest
        </ul>
    </div>
@endsection