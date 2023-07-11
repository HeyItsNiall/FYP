<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'title' => fake()->sentence(),
            'description' => fake()->paragraph,
            'image' => fake()->imageUrl(),
            'category' => fake()->word,
            'quantity' => fake()->randomNumber(),
            'price' => fake()->randomFloat(2, 10, 100),
            'discount_price' => fake()->randomFloat(2, 5, 50),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}