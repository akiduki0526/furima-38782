class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order(id: "DESC")

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

  def show
  end


  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :condition_id,
    :shipping_charge_id, :prefectures_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end


end
