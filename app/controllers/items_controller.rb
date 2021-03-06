class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:update, :edit, :show, :destroy]
  before_action :sold_out_item, only: [:edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  

  def index
    @items = Item.all.order(created_at: 'desc')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      redirect_to root_path if @item.destroy
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :cost, :image, :genre_id, :category_id, :status_id, :judgment_id,
                                 :area_id, :days_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to items_path unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end
end
