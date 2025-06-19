<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Services\TaskService;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    protected $taskService;

    public function __construct(TaskService $taskService)
    {
        $this->taskService = $taskService;
        $this->middleware('auth:sanctum');
        $this->middleware('is_admin');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'due_date' => 'nullable|date',
        ]);
        $task = $this->taskService->createTask($validated);
        return response()->json($task, 201);
    }

    public function assign(Request $request, $id)
    {
        $validated = $request->validate([
            'user_id' => 'required|integer|exists:users,id',
        ]);
        $task = $this->taskService->getTaskById($id);
        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }
        if ($task->assigned_to) {
            return response()->json(['message' => 'Task is already assigned to user ID: ' . $task->assigned_to], 400);
        }
            $task = $this->taskService->assignTask($id, $validated['user_id']);
            return response()->json($task);
    }

    public function complete($id)
    {
        $task = $this->taskService->getTaskById($id);
        if (!$task) {
            return response()->json(['message' => 'Task not found'], 404);
        }
        $task = $this->taskService->completeTask($id);
        return response()->json($task);
    }

    public function index(Request $request)
    {
        $filters = $request->only(['status', 'assigned_to']);
        $tasks = $this->taskService->listTasks($filters);
        return response()->json($tasks);
    }
}

