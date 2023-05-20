class PurchasesController < ApplicationController
  before_action :find_item, only:[:index, :create]
  before_action :authenticate_user!, only:[:index, :create]
  def index
    if current_user.id != @item.user.id && !@item.purchase
      @purchase_shipping = PurchaseShipping.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end