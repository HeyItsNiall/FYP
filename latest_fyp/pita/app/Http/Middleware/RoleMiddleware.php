<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, ...$roles)
    {
        // Check if user is authenticated and has a role
        if ($request->user() && $request->user()->usertype) {
            // Check if user's role is in the allowed roles
            if (in_array($request->user()->usertype, $roles)) {
                return $next($request);
            }
        }

        // User does not have the required role, redirect or show an error
        return redirect('/')->with('error', 'Unauthorized access.');
    }
}
