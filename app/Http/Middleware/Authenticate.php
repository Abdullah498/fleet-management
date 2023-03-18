<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;

class Authenticate
{
    /**
     * Handle an incoming request.
     *
     * @param  Request  $request
     * @param  Closure  $next
     * @param  string|null  $guard
     * @return mixed
     *
     * @throws AuthenticationException
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (auth()->guest()) {
            throw new AuthenticationException();
        }

        return $next($request);
    }
}
