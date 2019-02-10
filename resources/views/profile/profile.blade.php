@extends('layouts.app')
@extends('layouts.menu')
@section('content')
<div class="container-fluid">
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="{{ url('/home') }}">Home</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Profile</li>
	  </ol>
	</nav>
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Perfil</div>
                    <div class="card-body">
                    <form method="POST" action="{{route('profile.update', Auth::user()->id)}}" enctype="multipart/form-data">
                        @method('PUT')
                        @csrf
                        <div class="row">
							<div class="col-md-2">
								<div class="form-group">
									<input type="text" name="nombre" class="form-control input-sm" maxlength="20" aria-describedby="HelpBlock" placeholder="{{ Auth::user()->name }}" />
									<small id="HelpBlock" class="form-text text-muted">{{ __('Name') }}</small>	
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<input type="text" name="email" class="form-control input-sm" maxlength="20" aria-describedby="HelpBlock" placeholder="{{ Auth::user()->email }}" disabled />
									<small id="HelpBlock" class="form-text text-muted">{{ __('E-Mail Address') }}</small>	
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<input type="password" name="password" class="form-control input-sm" maxlength="20" aria-describedby="HelpBlock" placeholder=""/>
									<small id="HelpBlock" class="form-text text-muted">{{ __('Contraseña Actual') }}</small>	
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<input type="password" name="passwordn" class="form-control input-sm" maxlength="20" aria-describedby="HelpBlock" placeholder="" />
									<small id="HelpBlock" class="form-text text-muted">{{ __('Contraseña Nueva') }}</small>	
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<input type="password" name="passwordc" class="form-control input-sm" maxlength="20" aria-describedby="HelpBlock" placeholder="" />
									<small id="HelpBlock" class="form-text text-muted">{{ __('Validar Contraseña Nueva') }}</small>	
								</div>
							</div>
							<div class="col-md-2 offset-md-5">
								<div class="form-group">
									<input type="text" name="perfil" class="form-control input-sm" maxlength="20" aria-describedby="HelpBlock" placeholder="{{ Auth::user()->id_perfil }}" disabled />
									<small id="HelpBlock" class="form-text text-muted">{{ __('Perfil') }}</small>	
								</div>
							</div>																							
                        </div>
                        <div class="form-group row mb-0">
                            <div class="col-md-12 offset-md-5">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Actualizar') }}
                                </button>
                            </div>
                        </div> 	
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection