class TasksController < ApplicationController
    before_action :get_category
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = @category.tasks
    end
    
    def show

    end
    
    def new
        @task = @category.tasks.build
    end
    
    def create
        @task = @category.tasks.build(task_params)
        if @task.save
          redirect_to category_tasks_path(@category), notice: 'Task was successfully created.'
        else
          render :new
        end
    end
    
    def edit
    end
    
    def update
      debugger
        if @task.update(task_params)
          redirect_to category_task_path(@category, @task), notice: 'Task was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
      @task.destroy
      redirect_to category_tasks_path(@category), notice: 'Task was successfully destroyed.'
    end
    
    private
    
    def get_category
        @category = Category.find(params[:category_id])
    end

    def set_task
      @task = @category.tasks.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:name)
    end
end
