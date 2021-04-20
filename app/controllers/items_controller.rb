class ItemsController < ApplicationController

  def index
    @items = Item.all
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :cost, :image, :genre_id, :category_id, :status_id, :judgment_id, :area_id, :days_id).merge(user_id: current_user.id)
  end
end