<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductReview;
use Illuminate\Http\Request;

class ReviewApi extends Controller
{
    public function makeReview() {
        $user_id = request()->user_id;
        $product_slug = request()->product_slug;
        $rate_count = request()->ratecount;
        $review = request()->getreview;

        $product = Product::where('slug', $product_slug)->first();

        $review = ProductReview::create([
            'user_id' => $user_id,
            'product_id'=> $product->id,
            'review'=> $review,
            'rating'=> $rate_count,

        ]);

        if($review) {
            return response()->json([
                'message' => true,
                'data' =>  "Make Review Success",
            ]);
        } else {
            return response()->json([
                'message' => true,
                'data' =>  "Make Review Fail",
            ]);
        }
    }
}
