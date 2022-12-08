<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Income;
use App\Models\Outcome;
use App\Models\Product;
use App\Models\ProductOrder;
use App\Models\User;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function showLogin() {
        return view('admin.login');
    }

    public function login() {
        request()->validate([
            'email' => "required|email",
            'password' => "required"
        ]);
        $cre = request()->only('email','password');

        if(auth()->guard('admin')->attempt($cre)) {
            return redirect('/admin')->with('success', 'Welcome Admin');
        };
        // return $cre;
        return redirect()->back()->with('error','Email And Password Dont Match');
    }

    public function logout() {
        auth()->guard('admin')->logout();
        return redirect('/');
    }

    public function showDashboard() {

        $todayIncomeCount = Income::whereDay('created_at',date('d'))->sum('amount');
        $todayOutcomeCount = Outcome::whereDay('created_at',date('d'))->sum('amount');

        $userCount = User::count();
        $productCount = Product::count();

        $months = [date('F')];
        $yearMonth = [
            ['year' => date('Y'),'month' => date('m')]
        ];

        // income outcome
        $dayMonths = [date('F d')];
        $dayMonthsData = [
            [
                'day' => date('d'),
                'month' => date('m')
            ]
            ];

        for($i=1;$i<=5;$i++) {
            $months[] = date('F',strtotime("-$i month"));

            $yearMonth[] = [
                'year' => date('Y',strtotime("-$i month")),
                'month' => date('m',strtotime("-$i month"))
            ];

            // income outcome
            $dayMonths [] =date('F d',strtotime("-$i day"));
            $dayMonthsData[] = [
                'day' => date('d',strtotime("-$i day")),
                'month' => date('m',strtotime("-$i day"))
            ];
        }
        //for imcome out
        $incomeCount = [];
        $outcomeCount = [];
        foreach($dayMonthsData as $dm) {
            $incomeCount[] = Income::whereDay('created_at', $dm['day'])->whereMonth('created_at',$dm['month'])->sum('amount');
            $outcomeCount[] = Outcome::whereDay('created_at', $dm['day'])->whereMonth('created_at',$dm['month'])->sum('amount');

        }

        $saleData = [];

        foreach($yearMonth as $ym ) {
            $saleData[] =  ProductOrder::whereYear('created_at', $ym['year'])->whereMonth('created_at',$ym['month'])->count();
        }


        $latestUser = User::latest()->take(5)->get();
        $products = Product::latest()->take(5)->where('total_quantity', '<', 3)->get();



        return view('admin.dashboard', compact('todayIncomeCount','todayOutcomeCount','userCount','productCount','months','saleData','dayMonths','incomeCount','outcomeCount','latestUser','products'));
    }



}
