<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class AuthApi extends Controller
{
    public function changePassword(){
        $user_id = request()->user_id;
        $current_password = request()->currentPassowrd;
        $new_password = request()->newPassowrd;

        $user = User::where('id',$user_id)->first();

        if(Hash::check($current_password, $user->password)) {
            User::where('id',$user_id)->update([
                'password' => Hash::make($new_password),
            ]);

            return response()->json([
                'message' => true,
                'data' => null,
            ]);
        }


        return response()->json([
            'message' => false,
            'data' => 'wrong_password',
        ]);
    }
}
