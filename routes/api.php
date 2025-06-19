<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\TaskController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum', 'is_admin')->group(function () {
    Route::post('/tasks', [TaskController::class, 'store']);
     Route::post('/tasks/{id}/assign', [TaskController::class, 'assign']);
    Route::post('/tasks/{id}/complete', [TaskController::class, 'complete']);
    Route::get('/tasks', [TaskController::class, 'index']);
});


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
