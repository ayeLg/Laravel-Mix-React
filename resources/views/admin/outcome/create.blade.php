@extends('admin\layout\master')


@section('content')
    <div>
        <a href="{{ route('outcome.index') }}" class="btn btn-dark">All Outcome List</a>
    </div>

    <hr>
    <form action="{{ route('outcome.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="">Enter Title</label>
            <input type="text" name="title" class="form-control" id="">
        </div>
        <div class="form-group">
            <label for="">Enter Amount</label>
            <input type="number" name="amount" class="form-control" id="">
        </div>
        <div class="form-group">
            <label for="">Choose Description</label>
            <textarea name="description" class="form-control" id="" cols="30" rows="10"></textarea>

        </div>
        <input type="submit" class="btn btn-primary" value="Create">
    </form>
@endsection
