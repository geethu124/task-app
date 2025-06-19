<?php

namespace App\Jobs;

use App\Models\User;
use App\Models\Task;
use App\Notifications\TaskAssigned;
use Illuminate\Bus\Queueable;
use Illuminate\Foundation\Bus\Dispatchable;

use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendTaskAssignmentNotification implements ShouldQueue
{
   use Dispatchable, Queueable, InteractsWithQueue, SerializesModels;


    public function __construct(public Task $task, public User $user) {}


    public function handle(): void
    {
        //
        $this->user->notify(new TaskAssigned($this->task));
    }
}
