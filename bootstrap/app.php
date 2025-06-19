<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\IsAdmin;
use App\Http\Middleware\LogExecutionTime;
use App\Console\Kernel as ConsoleKernel;
use Illuminate\Contracts\Console\Kernel as ConsoleKernelContract;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            'is_admin' => IsAdmin::class,
            'log.execution' => LogExecutionTime::class,
        ]);

        $middleware->group('api', [
            'log.execution',
        ]);
        //
    })
    ->withCommands([
    \App\Console\Commands\ExpirePendingTasks::class,
])
    ->withExceptions(function (Exceptions $exceptions) {
        //

    })

    ->create();

    $app->singleton(ConsoleKernelContract::class, ConsoleKernel::class);

return $app;
