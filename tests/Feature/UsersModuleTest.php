<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class UsersModuleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @test
     */
    public function testExample()
    {
        $this->withoutExceptionHandling();
        $this->get('/login')
        ->assertStatus(200)
        ->assertSee('login');

    }
}
