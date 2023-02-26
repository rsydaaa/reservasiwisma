@extends('admin.layout.app')

@section('heading', 'Add Feature')

@section('right_top_button')
<a href="{{ route('admin_customer') }}" class="btn btn-primary"><i class="fa fa-eye"></i> Back</a>
@endsection

@section('main_content')
<div class="section-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin_customer_store') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-4">
                                <label for="" class="form-label">Full Name</label>
                                <input type="text" class="form-control" name="name">
                                @if($errors->has('name'))
                                <span class="text-danger">{{ $errors->first('name') }}</span>
                            @endif
                        </div>
                                
                                <div class="mb-4">
                                <label for="" class="form-label">Email Address</label>
                                <input type="text" class="form-control" name="email">
                                @if($errors->has('email'))
                                <span class="text-danger">{{ $errors->first('email') }}</span>
                            @endif
                        </div>
                                <div class="mb-4">
                                <label for="" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password">
                                @if($errors->has('password'))
                                <span class="text-danger">{{ $errors->first('password') }}</span>
                            @endif
                        </div>
                        <div class="mb-4">
                                <label for="" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" name="retype_password">
                                @if($errors->has('retype_password'))
                                <span class="text-danger">{{ $errors->first('retype_password') }}</span>
                            @endif
                        </div>
                                <div class="mb-4">
                                    <label class="form-label"></label>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection