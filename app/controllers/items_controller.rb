class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def show
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end



  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end


  def destroy
   @item.destroy
   if @item.destroy
    redirect_to root_path
   end
   
   unless user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
  end
  end





  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :condition_id,
    :shipping_charge_id, :prefectures_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
   end

end
