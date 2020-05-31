<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\Release;
use App\Admin\Actions\Post\Restore;
use App\Models\Banner;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BannerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Banner';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Banner());

        $grid->filter(function($filter){
            $filter->disableIdFilter();
            $filter->scope('trashed', '回收站')->onlyTrashed();
        });

        //目前默认实现了批量删除操作的功能，如果要关掉批量删除操作：
        $grid->tools(function ($tools) {
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });

        $grid->actions(function ($actions) {
            // 去掉查看
            $actions->disableView();
            // 添加恢复
            if (\request('_scope_') == 'trashed') {
                $actions->add(new Restore());
            }
        });

        $grid->column('sorts', __('排序'))->sortable();
        $grid->column('title', __('标题'));
        $grid->column('img', __('图片地址'))->image();
        $grid->column('description', __('图片描述'));
        $grid->column('jump_url', __('跳转地址'));
        $grid->column('jump_type', '跳转方式')->display(function ($jump_type) {
            return $jump_type ? '新窗口' : '本页面';
        });

        $grid->column('release_at', __('发布时间'));
        $states = [
            'on'  => ['value' => 1, 'text' => '已发布', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => '未发布', 'color' => 'default'],
        ];
        $grid->column('status', '状态')->switch($states);

        $grid->model()->orderBy('status', 'desc');
        $grid->model()->orderBy('sorts', 'desc');

        $grid->paginate(5);

        return $grid;

    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Banner::findOrFail($id));

        $show->field('sorts', __('排序'));
        $show->field('title', __('标题'));
        $show->field('img', __('图片'))->image();
        $show->field('description', __('图片描述'));
        $show->field('jump_url', __('跳转地址'));
        $show->field('jump_type', __('跳转方式'))->as(function ($jumpType) {
            return $jumpType == 1 ? '新窗口':'本页面';
        });
        $show->field('status', __('状态'))->as(function ($status) {
            return $status == 1 ? '已发布':'未发布';
        });

        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('更新时间'));
        $show->field('deleted_at', __('软删除时间'));
        $show->field('release_at', __('发布时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Banner());

        $form->text('title', __('标题'))->required();
        $form->image('img', __('图片'))->uniqueName()->required();
        $form->text('description', __('描述'))->required();
        $form->number('sorts', __('排序'))->help('值越大越靠前')->required();

        $states = [
            'on'  => ['value' => 1, 'text' => '立即发布', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => '稍后发布', 'color' => 'default'],
        ];
        $form->switch('status',__('状态'))->states($states)->default('off')->required();

        $form->text('jump_url', __('跳转地址'));
        $form->radio('jump_type', __('跳转方式'))->options(['1' => '本页面', '0'=> '新窗口'])->default('0');

        $form->footer(function ($footer) {
            // 去掉`查看`checkbox
            $footer->disableViewCheck();
            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
            // 去掉`继续创建`checkbox
            $footer->disableCreatingCheck();
        });

        //添加“发布时间”隐藏域,并设置状态为发布是，添加数据;
        $form->hidden('release_at');
        $form->saving(function (Form $form) {
            if($form->status == 'on') {
                $form->release_at = date('Y-m-d H:i:s');
            }
        });

        // 去掉`查看`按钮
        $form->tools(function (Form\Tools $tools) {
            $tools->disableView();
        });

        return $form;
    }
}
