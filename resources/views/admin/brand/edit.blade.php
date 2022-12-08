@extends('admin\layout\master')


@section('content')
    <div>
        <a href="{{ route('brand.index') }}" class="btn btn-dark">All Brands</a>
    </div>

    <hr>
    <form action="{{ route('brand.update', $color->slug) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="">Enter Category</label>
            <input type="text" name="name" class="form-control" id="" value="{{ $brand->name }}">
        </div>

        <input type="submit" class="btn btn-primary" value="Update">
    </form>
@endsection
