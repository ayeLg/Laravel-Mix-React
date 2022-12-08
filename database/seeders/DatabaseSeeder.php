<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Admin;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Color;
use App\Models\Supplier;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        User::create([
            'name' => "userone",
            'email' => "userone@a.com",
            'password' => Hash::make('password'),
            'image' => "user.jpg",
            'phone' => '099999999',
            'address' => 'Address'
        ]);
        Admin::create([
            'name' => "Admin",
            'email' => "admin@a.com",
            'password' => Hash::make('password'),
        ]);
        $category = ['T-Shirt', 'Hat', 'Electornic','Mobile','EarPhone'];

        foreach($category as $c) {
            Category::create([
                'slug' => Str::slug($c),
                'name' => $c,
                'mm_name' => "မြန်မာ",
                'image' => 'category.jpg'
            ]);
        }

        $brand = ['Samsung', 'Huawei', 'Apple'];

        foreach($brand as $c) {
            Brand::create([
                'slug' => Str::slug($c),
                'name' => $c,
            ]);
        }
        $color = ['red', 'green', 'blue','black'];

        foreach($color as $c) {
            Color::create([
                'slug' => Str::slug($c),
                'name' => $c,
            ]);
        }

        Supplier::create([
            'name' => "Mg Mg",
            'image' => "supplier.png",
        ]);
    }
}
