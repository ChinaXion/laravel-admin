<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Release extends RowAction
{
    public $name = '发布';

    public function handle(Model $model)
    {
        $model->replicate()->save();

        return $this->response()->success('发布成功')->refresh();
    }
}
