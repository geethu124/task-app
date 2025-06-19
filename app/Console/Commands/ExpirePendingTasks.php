<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Task;
use Carbon\Carbon;

class ExpirePendingTasks extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:expire-pending-tasks';

    /**
     * The console command description.
     *
     * @var string
     */
      // Command signature used to run this command

    // Command description
    protected $description = 'Expire tasks with past due_date and pending status';

    /**
     * Execute the console command.
     */
    public function handle()
{
    $now = Carbon::now();

    $tasks = Task::where('status', 'pending')
        ->where('due_date', '<', $now)
        ->get();

    if ($tasks->isEmpty()) {
        $this->info("No pending tasks found to expire.");
        return;
    }

    foreach ($tasks as $task) {
        $task->status = 'expired';
        $task->save();
        $this->info("Task ID {$task->id} titled '{$task->title}' has been marked as expired.");
    }

    $this->info("Total expired tasks: " . $tasks->count());
}

}
