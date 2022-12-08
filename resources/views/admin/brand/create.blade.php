@extends('admin\layout\master')


@section('content')
    <div>
        <a href="{{ route('brand.index') }}" class="btn btn-dark">All Brands</a>
    </div>

    <hr>
    <form action="{{ route('brand.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="">Enter Color Name</label>
            <input type="text" name="name" class="form-control" id="">
        </div>

        <input type="submit" class="btn btn-primary" value="Create">
    </form>
@endsection
