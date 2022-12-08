@extends('admin.layout.master')

@section('content')
    <h2>
        Add For
        <b class="text-danger">{{ $product->name }}</b>
    </h2>

    <div class="">
        <a href="{{ route('product.index') }}">All Product</a>
    </div>
    <hr>

    <form action="{{ url('admin/create-product-add/' . $product->slug) }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="">Choose Supplier</label>
            <select name="supplier_id" id="" class="form-control">
                @foreach ($supplier as $s)
                    <option value="{{ $s->id }}">{{ $s->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label for="">Enter Total Quantity</label>
            <input type="number" class="form-control" name="total_quantity" id="">
        </div>
        <div class="form-group">
            <label for="">Enter Description</label>
            <textarea name="description" id="" class="form-control" cols="30" rows="10"></textarea>
        </div>

        <input type="submit" value="Add" class="btn btn-primary">
    </form>
@endsection
