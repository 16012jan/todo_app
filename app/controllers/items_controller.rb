class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @todo_list = TodoList.find(params[:todo_list_id])
    @item = @todo_list.items.create(item_params)
    redirect_to todo_lists_path
  end

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @item = @todo_list.items.create(item_params)
    redirect_to todo_lists_path
  end

  def edit
  end

  def update
    if @item.update
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.delete
    redirect_to root_path
  end

  def complete
    @item = Item.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    redirect_to root_path
  end

  private

    def set_item
      @item =Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title)
    end
end
