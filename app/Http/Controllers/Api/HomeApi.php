<?php

namespace App\Http\Controllers\Api;

use Exception;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeApi extends Controller
{
    public function home() {
        $category = Category::withCount('product')->get();

        try {
            $featureProduct = Product::all()->random(2);
        } catch(Exception $e) {
            $featureProduct = [];
        }



        $productByCategory = Category::has('product')->take(3)->get();

        foreach($productByCategory as $k => $v ) {
            $productByCategory[$k]->product = Product::where('category_id', $v->id)->take(6)->get();
        }

        return response()->json([
            'success' => true,
            'data' => [
                'category' => $category,
                'featureProduct' => $featureProduct,
                'productByCategory' => $productByCategory
            ]
        ]);
    }
}
