@extends('admin.layout.master')

@section('content')
    <style>
        .dashboard-i {
            font-size: 50px !important;
        }
    </style>
    <div class="row">
        <div class="col-3">
            <div class="card bg-primary p-3">
                <div class="d-flex">
                    <div class="p-3 d-flex align-items-center justify-content-center">
                        <i class="fa fa-money text-white dashboard-i"></i>
                    </div>
                    <div class="p-3 d-flex align-items-center flex-column justify-content-center">
                        <h5 class="text-whi">Today Income</h5>
                        <h2 class="text-whi"> {{ $todayIncomeCount }} KS</h2>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card bg-primary p-3">
                <div class="d-flex">
                    <div class="p-3 d-flex align-items-center justify-content-center">
                        <i class="fa fa-money text-white dashboard-i"></i>
                    </div>
                    <div class="p-3 d-flex align-items-center flex-column justify-content-center">
                        <h5 class="text-whi">Today Out</h5>
                        <h2 class="text-whi"> {{ $todayOutcomeCount }} KS</h2>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card bg-primary p-3">
                <div class="d-flex">
                    <div class="p-3 d-flex align-items-center justify-content-center">
                        <i class="fa fa-user text-white dashboard-i"></i>
                    </div>
                    <div class="p-3 d-flex align-items-center flex-column justify-content-center">
                        <h5 class="text-whi">Users</h5>
                        <h2 class="text-whi"> {{ $userCount }}</h2>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card bg-primary p-3">
                <div class="d-flex">
                    <div class="p-3 d-flex align-items-center justify-content-center">
                        <i class="fa fa-heart text-white dashboard-i"></i>
                    </div>
                    <div class="p-3 d-flex align-items-center flex-column justify-content-center">
                        <h5 class="text-whi">Total Products</h5>
                        <h2 class="text-whi">{{ $productCount }}</h2>
                    </div>

                </div>
            </div>
        </div>
    </div>

    {{-- chart --}}
    <div class="row">
        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <h4>အရောင်းအချက်အလက်</h4>
                    <canvas id="saleChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <h4>ဝင်ငွေထွက်ငွေ</h4>
                    <canvas id="inoutChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-4">
            <div class="card">

                <div class="card-body">
                    <h4>Latest User List</h4>
                    <ul class="list-group">
                        @foreach ($latestUser as $u)
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <img src="{{ $u->image_url }}" width="50" alt="" class="rounded-circle">
                                <small>{{ $u->email }}</small>
                                <span class="badge badge-warning">{{ $u->name }}</span>
                            </li>
                        @endforeach

                    </ul>
                </div>
            </div>

        </div>
        <div class="col-8">
            <div class="card">

                <div class="card-body">
                    <h4>3 ခုအောက် ပစည်းများ</h4>
                    <table class="table border">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($products as $p)
                                <tr>
                                    <td>
                                        <img src="{{ $p->image_url }}" width="50" class="rounded-circle" alt="">
                                    </td>
                                    <td>{{ $p->name }}</td>
                                    <td>{{ $p->total_quantity }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
@endsection

@section('script')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('saleChart');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: @json($months),
                datasets: [{
                    label: 'အရောင်းအချက်အလက်',
                    data: @json($saleData),
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // income outcome chart
        const chart = document.getElementById('inoutChart');

        new Chart(chart, {
            type: 'line',
            data: {
                labels: @json($dayMonths),
                datasets: [{
                        label: 'ဝင်ငွေ',
                        data: @json($incomeCount),
                        borderWidth: 1,
                        boderColor: 'green'
                    },
                    {
                        label: 'ထွက်ငွေ',
                        data: @json($outcomeCount),
                        borderWidth: 1,
                        boderColor: 'red'
                    }
                ],


            },

            // options: {
            //     scales: {
            //         y: {
            //             beginAtZero: true
            //         }
            //     }
            // }
        });
    </script>
@endsection
