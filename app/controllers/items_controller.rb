class ItemsController < ApplicationController

  private

  def items_params
    params.require(:item).permit(:item_name, :image).merge(user_id: current_user.id)
  end
end
