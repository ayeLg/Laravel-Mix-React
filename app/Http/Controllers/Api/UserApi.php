<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserApi extends Controller
{
    public function getProfile() {
        $user_id = request()->user_id;
        $user_info = User::where('id', $user_id)->first();

        return response()->json([
            'message' => true,
            'data' => $user_info,
        ]);
    }

    public function updateProfile() {
        $user_id = request()->user_id;
        $username = request()->username;
        $email = request()->email;
        $phone = request()->phone;
        $address = request()->address;

        if(!request()->file("image")) {
            return response()->json([
                'message' => true,
                'data' =>   "Pleas must choose Photo",
            ]);

        } else {
            $image = request()->file("image");

            $image_name = uniqid().$image->getClientOriginalName();


            $image->move(public_path('/images'), $image_name);

            $userUpadate = User::where('id',$user_id)->update([
                'name' => $username,
                'email' => $email,
                'phone' => $phone,
                'address' => $address,
                'image' => $image_name
            ]);

            if($userUpadate) {
                return response()->json([
                    'message' => true,
                    'data' =>  "Update Success",
                ]);
            } else {
                return response()->json([
                    'message' => true,
                    'data' =>  "F​ail Update",
                ]);
            }


        }
    }
}
