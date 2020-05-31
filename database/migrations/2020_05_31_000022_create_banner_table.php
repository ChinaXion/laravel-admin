<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBannerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banner', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 50)->unique();
            $table->string('img', 100)->unique();
            $table->string('description', 150)->unique();
            $table->tinyInteger('sorts');
            $table->tinyInteger('status')->default('0');
            $table->string('jump_url', 100);
            $table->tinyInteger('jump_type')->default('1');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('banner');
    }
}
