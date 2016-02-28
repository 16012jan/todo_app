class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item =Item.new
  end

  def create
    @item =Item.new(item_params)
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

  private

    def set_item
      @item =Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title)
    end
end
