@extends('admin\layout\master')


@section('content')
    <div>
        <a href="{{ route('outcome.create') }}" class="btn btn-dark">Create Outcome</a>
        <button class="btn btn-outline-warning">Today Income : {{ $todayOutcome }} Ks</button>
    </div>

    <hr>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Amount</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($outcome as $i)
                <tr>
                    <td>{{ $i->title }}</td>
                    <td>{{ $i->amount }}</td>
                    <td>{{ $i->description }} </td>
                </tr>
            @endforeach

        </tbody>
    </table>
@endsection
