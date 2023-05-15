class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only:[:show, :edit, :update]

  def index
    @item = Item.all.order("created_at DESC")
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
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :item_name, :introduce, :category_id,
      :condition_id, :charge_bearer_id, :prefecture_id,
      :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
