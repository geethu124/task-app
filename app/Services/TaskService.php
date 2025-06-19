<?php

namespace App\Services;

use App\Models\Task;
use App\Models\User;
use Illuminate\Database\Eloquent\Collection;
use App\Jobs\SendTaskAssignmentNotification;
use Illuminate\Support\Facades\Log as FacadesLog;

class TaskService
{
    public function createTask(array $data): Task
    {
        $data['status'] = $data['status'] ?? 'pending';
        return Task::create($data);
    }

    public function assignTask(int $taskId, int $userId): ?Task
    {
        $task = Task::find($taskId);
        if (!$task) {
            return null;
        }
        $user = User::find($userId);
        if (!$user) {
            return null;
        }
        $task->assigned_to = $user->id;
        $task->save();
        FacadesLog::info('Dispatching SendTaskAssignmentNotification job for task ID: '.$task->id);
         SendTaskAssignmentNotification::dispatch($task, $user);
        return $task;
    }

     public function getTaskById($id)
    {
        return Task::find($id);
    }

    public function completeTask(int $taskId): ?Task
    {
        $task = Task::find($taskId);
        if (!$task) {
            return null;
        }
        $task->status = 'completed';
        $task->save();
        return $task;
    }

    public function listTasks(array $filters = []): Collection
    {
        $query = Task::query();
        if (isset($filters['status'])) {
            $query->where('status', $filters['status']);
        }
        if (isset($filters['assigned_to'])) {
            $query->where('assigned_to', $filters['assigned_to']);
        }
        return $query->get();
    }
}
