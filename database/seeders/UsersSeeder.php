<?php

namespace Database\Seeders;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        if(!User::count()){
            $now = Carbon::now();
            $users = [
                [
                    'name' => 'Abdullah',
                    'email' => 'abdullah@test.com',
                    'password' => Hash::make('123456'),
                    'created_at' => $now,
                    'updated_at' => $now,
                ],
                [
                    'name' => 'Test User',
                    'email' => 'test_user@test.com',
                    'password' => Hash::make('123456'),
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            ];

            User::insert($users);
        }
    }
}
