<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\PageController;
use App\Models\User;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware'=> ['RedirectIfAuth']], function(){
    ###### Auth #########
    Route::get('/login','AuthController@showLogin');
    Route::post('/login','AuthController@postLogin');

    Route::get('/register','AuthController@showRegister');
    Route::post('/register','AuthController@postRegister');

});
Route::group(['middleware'=> ['RedirectIfNotAuth']], function(){
    Route::get('/logout','AuthController@logout');
    Route::get('/profile','PageController@showProfile');

});


Route::get('/','PageController@home');
Route::get('/product','PageController@allProduct');
Route::get('/product/{slug}','ProductController@detail' );

Route::get('/authuser', function() {
    $user = User::find(1);
    auth()->login($user);

    return auth()->user();
});

// Admin middleware
Route::get('/admin/login',[PageController::class, 'showLogin']);
Route::post('/admin/login',[PageController::class, 'login']);


// Admin Route
Route::group(['prefix'=> "admin", 'namespace'=>"Admin",'middleware' =>['Admin']],function(){
    Route::post('/logout',[PageController::class, 'logout']);

    Route::get('/',[PageController::class, 'showDashboard']);
    Route::resource('/category','CategoryController');
    Route::resource('/color','ColorController');
    Route::resource('/brand','BrandController');
    Route::resource('/income','IncomeController');
    Route::resource('/outcome','OutcomeController');

    // Product route
    Route::resource('/product','ProductController');
    Route::get('/create-product-add/{slug}', 'ProductController@createProductAdd');
    Route::post('/create-product-add/{slug}', 'ProductController@storeProductAdd');
    Route::get('/product-add-transaction', 'ProductController@productAddTransaction');
    Route::post('product-upload','ProductController@imageUpload');

    Route::get('/order', 'OrderController@all');
    Route::get('/change-order', 'OrderController@changeOrderStatus');
});


Route::get('/locale/{locale}', function ($locale) {
    session()->put('locale',$locale);
    return redirect()->back()->with('success', 'Language Swithced');
});
