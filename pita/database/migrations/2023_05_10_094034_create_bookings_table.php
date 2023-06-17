<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->string('cust_name')->nullable();
            $table->string('cust_email')->nullable();
            $table->string('cust_phone')->nullable();
            $table->string('furniture_type')->nullable();
            $table->string('repair_details')->nullable();
            $table->date('date')->nullable();
            $table->time('time_slot')->nullable();
            $table->string('images')->nullable();
            $table->string('user_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bookings');
    }
};
