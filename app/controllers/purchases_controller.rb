class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_ids])
  end
end
