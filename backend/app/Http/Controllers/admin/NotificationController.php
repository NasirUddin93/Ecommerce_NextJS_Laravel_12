<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NotificationController extends Controller
{
    /**
     * List notifications (optionally filter by user_id or status).
     * GET /api/notifications?user_id=&status=
     */
    public function index(Request $request)
    {
        $query = Notification::query()->orderByDesc('id');

        if ($request->filled('user_id')) {
            $query->where('user_id', $request->user_id);
        }
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $notifications = $query->get();

        return response()->json([
            'status' => 200,
            'data'   => $notifications,
        ]);
    }

    /**
     * Create a new notification
     * POST /api/notifications
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'message' => 'required|string',
            'status'  => 'nullable|in:unread,read', // default unread
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = $validator->validated();
        $data['status'] = $data['status'] ?? 'unread';

        $notification = Notification::create($data);

        return response()->json([
            'status'  => 201,
            'message' => 'Notification created successfully',
            'data'    => $notification,
        ], 201);
    }

    /**
     * Show a single notification
     * GET /api/notifications/{id}
     */
    public function show($id)
    {
        $notification = Notification::find($id);

        if (!$notification) {
            return response()->json([
                'status'  => 404,
                'message' => 'Notification not found',
            ], 404);
        }

        return response()->json([
            'status' => 200,
            'data'   => $notification,
        ]);
    }

    /**
     * Update a notification (e.g., mark read/unread or edit message)
     * PUT /api/notifications/{id}
     */
    public function update(Request $request, $id)
    {
        $notification = Notification::find($id);

        if (!$notification) {
            return response()->json([
                'status'  => 404,
                'message' => 'Notification not found',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'user_id' => 'sometimes|required|exists:users,id',
            'message' => 'sometimes|required|string',
            'status'  => 'sometimes|required|in:unread,read',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $notification->update($validator->validated());

        return response()->json([
            'status'  => 200,
            'message' => 'Notification updated successfully',
            'data'    => $notification,
        ]);
    }

    /**
     * (Optional) Delete a notification
     * DELETE /api/notifications/{id}
     */
    public function destroy($id)
    {
        $notification = Notification::find($id);

        if (!$notification) {
            return response()->json([
                'status'  => 404,
                'message' => 'Notification not found',
            ], 404);
        }

        $notification->delete();

        return response()->json([
            'status'  => 200,
            'message' => 'Notification deleted successfully',
        ]);
    }
}
