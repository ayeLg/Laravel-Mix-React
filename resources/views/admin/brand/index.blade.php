@extends('admin.layout.master')

@section('content')
    <div class="">
        <a href="{{ route('brand.create') }}" class="btn btn-success">Create Brand</a>
    </div>
    <hr>
    <table class="table table-striped">
        <thead>

            <th>Name</th>
            <th>Option</th>
        </thead>
        <tbody>
            @foreach ($brands as $c)
                <tr>

                    <td>{{ $c->name }}</td>

                    <td>
                        <a href="{{ route('color.edit', $c->slug) }}" class="btn btn-primary">Edit</a>
                        <form action="{{ route('color.destroy', $c->slug) }}" class="d-inline" method="POST"
                            onsubmit="return confirm('Sure For Delete?')">
                            @csrf
                            @method('DELETE')
                            <input type="submit" value="Delete" class="btn btn-danger">
                        </form>
                    </td>

                </tr>
            @endforeach

        </tbody>
    </table>
    {{ $brands->links() }}
@endsection
