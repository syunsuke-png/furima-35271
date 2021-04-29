class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @purchase_address= PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.cost,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end

  def move_to_index
    redirect_to root_path if @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
