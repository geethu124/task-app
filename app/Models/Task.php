<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    //
    protected $fillable = [
        'title',
        'description',
        'assigned_to',
        'status',
        'due_date',
    ];

    protected $casts = [
    'due_date' => 'datetime',
    'created_at' => 'datetime',
    'updated_at' => 'datetime',
];
    public function assignedUser()
    {
        return $this->belongsTo(User::class, 'assigned_to');
    }

}
