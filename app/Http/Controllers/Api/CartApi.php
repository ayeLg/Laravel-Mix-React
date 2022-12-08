<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ProductCart;
use App\Models\ProductOrder;

class CartApi extends Controller
{
    public function addToCart(Request $request,$slug){


        $product = Product::where('slug',$slug)->first();

        if(!$product){
            return response()->json([
                'message' => false,
                'data' => 'product_not_found'
            ]);
        }

        $findInCart = ProductCart::where('user_id',$request->user_id)->where('product_id', $product->id)->first();
        //   return response()->json([
        //     'message' => false,
        //     'data' => $findInCart
        // ]);
        if($findInCart) {
            $total_quantity = $findInCart->total_quantity + 1;
            $findInCart->update([
                'total_quantity' => $total_quantity,
            ]);

        } else {
            ProductCart::create([
                'product_id' => $product->id,
                'user_id' => request()->user_id,
                'total_quantity' => 1,
            ]);
        }

        $cart_count = ProductCart::where('user_id', request()->user_id)->count();
        return response()->json([
            'message' => true,
            'data' => $cart_count,
        ]);
    }


    public function getCart() {
        $user_id = request()->user_id;
        $cart = ProductCart::where('user_id',$user_id)->with('product')->get();

        return response()->json([
            'message' => true,
            'data' => $cart,
        ]);
    }

    public function updateQty(){
        $cart_id = request()->cart_id;
        $qty = request()->total_qty;

        ProductCart::where('id',$cart_id)->update([
            'total_quantity' => $qty
        ]);

        return response()->json([
            'message' => true,
            'data' => null,
        ]);

    }
    public function removeCart(){
        $cart_id = request()->cart_id;


        ProductCart::where('id',$cart_id)->delete();

        return response()->json([
            'message' => true,
            'data' => null,
        ]);

    }

    public function checkout(){
        $user_id = request()->user_id;

        $carts = ProductCart::where('user_id',$user_id)->get();

        foreach($carts as $cart) {
            ProductOrder::create([
                'user_id' => $cart->user_id,
                'product_id' => $cart->product_id,
                'total_quantity' => $cart->total_quantity,
            ]);
        }

        ProductCart::where('user_id', $user_id)->delete();
        return response()->json([
            'message' => true,
            'data' => null,
        ]);

    }

    public function order() {
        $user_id = request()->user_id;
        $order = ProductOrder::where('user_id',$user_id)->with('product')->paginate(2);
        return response()->json([
            'message' => true,
            'data' => $order,
        ]);
    }
}
