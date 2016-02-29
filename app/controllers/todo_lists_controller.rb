class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end

  def show
  end

  def new
    todo = TodoList.create
    render partial: "todo_header" , :locals => { todo: todo }
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @todo_list.delete

    respond_to do |format|
       format.html { redirect_to root_path }
       format.js
    end
  end

  def add_item
    todo_list = TodoList.find(params[:id])
    item = todo_list.items.create(title: params[:text])
    # render json: item
    render partial: "todo_items" , :locals => { todo: todo_list, item: item }
  end

  private

    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title)
    end
end
