@extends('admin.layout.master')

@section('content')
    <div class="">
        <a href="{{ url('/admin/order') }}" class="btn btn-dark">All Order</a>
        <a href="{{ url('/admin/order?status=success') }}" class="btn btn-success">Success</a>
        <a href="{{ url('/admin/order?status=pending') }}" class="btn btn-warning">Pending</a>
        <a href="{{ url('/admin/order?status=cancel') }}" class="btn btn-danger">Cancel</a>
    </div>
    <hr>
    <table class="table table-striped">
        <thead>
            <th>Image</th>
            <th>Name</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Status</th>
            <th>User Info</th>
            <th>Option</th>
        </thead>
        <tbody>
            @foreach ($order as $o)
                <tr>
                    <td>
                        <img src="{{ $o->product->image_url }}" width="40" alt="">
                    </td>
                    <td>{{ $o->product->name }}</td>
                    <td>{{ $o->total_quantity }}</td>
                    <td>{{ $o->product->sale_price }}</td>
                    <td>
                        @if ($o->status === 'success')
                            <span class="badge badge-success">Success</span>
                        @endif
                        @if ($o->status === 'pending')
                            <span class="badge badge-warning">Pending</span>
                        @endif
                        @if ($o->status === 'cancel')
                            <span class="badge badge-danger">Cancel</span>
                        @endif
                    </td>
                    <td>
                        <table class="table border">
                            <tr>
                                <td>Image</td>
                                <td>Name</td>
                                <td>Phone</td>
                                <td>Address</td>

                            </tr>
                            <tr>
                                <td>
                                    <img src="{{ $o->user->image_url }}" width="40" alt="">
                                </td>
                                <td>{{ $o->user->name }}</td>
                                <td>{{ $o->user->phone }}</td>
                                <td>{{ $o->user->address }}</td>
                            </tr>


                        </table>
                    </td>
                    <td>
                        <a href="{{ url('/admin/change-order?id=' . $o->id . '&status=success') }}"
                            class="btn btn-success">Success</a>
                        @if ($o->status !== 'success')
                            <a href="{{ url('/admin/change-order?id=' . $o->id . '&status=cancel') }}"
                                class="btn btn-danger">Cancel</a>
                        @endif

                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    {{ $order->links() }}
@endsection
