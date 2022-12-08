<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function showLogin() {
        return view('auth.login');
    }
    public function showRegister() {
        return view('auth.register');
    }
    public function postLogin(Request $request) {

        $user = User::where('email',$request->email)->first();
        if(!$user) {
            return redirect()->back()->with('error','Email Not Found');
        }
        if(!Hash::check($request->password, $user->password)) {
            return redirect()->back()->with('error','Password not found');
        }
        auth()->login($user);
        return redirect('/')->with('success','Welcome'.$user->name);
    }
    public function postRegister(Request $request) {
        request()->validate([
            'name' =>"required",
            "email" => "required|email",
            "password" => "required",
            'image' => "required|mimes:png,jpg,webp",
            'phone' => "required",
            'address' => "required",
        ]);

        // check alreday email
        $findUser = User::where('email', request()->email)->first();
        if($findUser){
            return redirect()->back()->with('error','Email Already Exits');
        }
        $file = request()->file('image');
        $file_name = uniqid().$file->getClientOriginalName();
        $file->move(public_path('/images'),$file_name);

        $user = User::create([
            'image' => $file_name,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'password' => Hash::make($request->password),

        ]);

        auth()->login($user);

        return redirect('/')->with('success','Welcome'.$user->name);

    }
    public function logout(){
        auth()->logout();

        return redirect('/login');
    }
}
