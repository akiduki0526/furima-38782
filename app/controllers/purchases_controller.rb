class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end

  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  def purchase_params
    params.require(:purchase_address).
    permit(:post_code, :prefectures_id, :district, :address, :building, :phone_number).
    merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token], 
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


end
