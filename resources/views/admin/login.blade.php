<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Login</title>
    <link rel="stylesheet" href="{{ asset('assets/css/argon.css') }}">
    {{-- toastify --}}
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-4 offset-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Admin Login
                    </div>
                    <div class="card-body">
                        @if ($errors->any())
                            @foreach ($errors->all() as $e)
                                <div class="alert alert-danger">{{ $e }}</div>
                            @endforeach

                        @endif
                        <form action="{{ url('/admin/login') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="">Enter Email</label>
                                <input class="form-control" type="email" name="email" id="">
                            </div>
                            <div class="form-group">
                                <label for="">Enter Pasword</label>
                                <input class="form-control" type="password" name="password" id="">
                            </div>
                            <input type="submit" class="btn btn-danger" name="" id="" value="Login">
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>



    {{-- toastify --}}
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <style>
        .toastify {
            background-image: unset;
        }
    </style>
    @if (session()->has('error'))
        <script>
            Toastify({
                text: "{{ session('error') }}",
                className: "bg-danger",
                position: 'center',
            }).showToast();
        </script>
    @endif

</body>

</html>
