<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TaskResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
         return [
        'id' => $this->id,
        'title' => $this->title,
        'description' => $this->description,
        'assigned_to' => $this->assigned_to,
        'status' => $this->status,
        'due_date' => $this->due_date ? $this->due_date->toDateTimeString() : null,
        'created_at' => $this->created_at->toDateTimeString(),
        'updated_at' => $this->updated_at->toDateTimeString(),
    ];
    }
}
