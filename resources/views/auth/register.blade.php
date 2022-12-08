@extends('layout.master')
@section('header-text', 'Register')
@section('content')
    <div class="container mt-4 mb-4">
        <div class="row">
            <div class="col-6 offset-3">
                <div class="card-header bg-warning text-center text-white">Register</div>
                <div class="card-body">
                    <form action="{{ url('/register') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="form-">
                            <label for="">Enter Name</label>
                            <input type="text" name="name" class="form-control">
                        </div>
                        <div class="form-">
                            <label for="">Enter Email</label>
                            <input type="email" name="email" class="form-control">
                        </div>
                        <div class="form-">
                            <label for="">Enter Password</label>
                            <input type="password" name="password" class="form-control">
                        </div>
                        <div class="form-">
                            <label for="">Enter Image</label>
                            <input type="file" name="image" class="form-control">
                        </div>
                        <div class="form-">
                            <label for="">Enter Phone Number</label>
                            <input type="number" name="phone" class="form-control">
                        </div>
                        <div class="form-">
                            <label for="">Enter Address</label>
                            <textarea name="address" id="" class="form-control" cols="30" rows="10"></textarea>
                        </div>
                        <input type="submit" value="Register" class="btn btn-warning">
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
