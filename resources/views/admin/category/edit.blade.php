@extends('admin\layout\master')


@section('content')
    <div>
        <a href="{{ route('category.index') }}" class="btn btn-dark">All Category</a>
    </div>

    <hr>
    <form action="{{ route('category.update', $cat->slug) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="">Enter Category</label>
            <input type="text" name="name" class="form-control" id="" value="{{ $cat->name }}">
        </div>
        <div class="form-group">
            <label for="">Enter Category Name (MM)</label>
            <input type="text" name="mm_name" class="form-control" value="{{ $cat->mm_name }}" id="">
        </div>
        <div class="form-group">
            <label for="">Choose Image</label>
            <input type="file" name="image" class="form-control" id="">
            <img src="{{ asset('images/' . $cat->image) }}" width="100" class="img-thumbnail" alt="">
        </div>
        <input type="submit" class="btn btn-primary" value="Update">
    </form>
@endsection
