@extends('layout.master')
@section('header-text', 'All Product')

@section('content')

    <div class="w-80 mt-5">

        <div class="row">

            <div class="col-12 col-sm-12 col-md-3 col-lg-3 ">
                <div class="card">
                    <div class="card-header bg-dark text-white">All Category</div>
                    @foreach ($category as $c)
                        <a href="{{ url('/product?category=' . $c->slug) }}">
                            <li class="list-group-item">
                                <img src="{{ $c->image_url }}" width="30" alt="">
                                {{ app()->getLocale() === 'mm' ? $c->mm_name : $c->name }}
                                <small class="float-right badge badge-dark">{{ $c->product_count }}</small>
                            </li>
                        </a>
                    @endforeach

                </div>
                <div class="card">
                    <div class="card-header bg-dark text-white">All Brand</div>
                    @foreach ($brand as $c)
                        <a href="{{ url('/product?brand=' . $c->slug) }}">
                            <li class="list-group-item">

                                {{ $c->name }}

                            </li>
                        </a>
                    @endforeach

                </div>
            </div>

            <div class="col-12 col-sm-12 col-md-9 col-lg-9">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="card w-100 p-4">
                            <form action="">
                                <select name="category" class="btn btn-dark" id="">
                                    <option value="">Category</option>
                                    @foreach ($category as $c)
                                        <option value="{{ $c->slug }}">{{ $c->name }}</option>
                                    @endforeach
                                </select>
                                <select name="color" class="btn  btn-dark" id="">
                                    <option value="">Color</option>
                                    @foreach ($color as $c)
                                        <option value="{{ $c->slug }}">{{ $c->name }}</option>
                                    @endforeach
                                </select>
                                <select name="brand" class="btn  btn-dark" id="">
                                    <option value="">Brand</option>
                                    @foreach ($brand as $c)
                                        <option value="{{ $c->slug }}">{{ $c->name }}</option>
                                    @endforeach
                                </select>
                                <input type="text" class="btn  btn-white" placeholder="enter search" name="search"
                                    id="">
                                <input type="submit" class="btn  bg-primary" value="search" name="" id="">
                                <a href="{{ url('product') }}" class="btn  btn-danger">Clear</a>
                            </form>
                        </div>
                    </div>


                    <!-- products -->
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-3 product">
                        <div class="row">
                            <!-- loop product -->
                            @foreach ($product as $p)
                                <div class="col-12 col-md-4 text-center mt-2">
                                    <a href="{{ url('/product/' . $p->slug) }}">
                                        <div class="card p-2">
                                            <img src="{{ $p->image_url }}" alt="" class="w-100">
                                            <b>{{ $p->name }}</b>
                                            <div>
                                                <small class=" badge badge-danger"> <strike>{{ $p->discount_price }}
                                                        ks</strike> </small>
                                                <small class="badge bg-primary">{{ $p->sale_price }}ks</small>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            @endforeach



                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-3 product">
                        {{ $product->links() }}
                    </div>




                </div>

            </div>
        </div>
    </div>
@endsection
