class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :show, :edit, :destroy]

  def index
    if params[:category_id].present?
       @items = Item.where(category_id: params[:category_id]).page(params[:page]).reverse_order
     else
       @items = Item.page(params[:page]).reverse_order
     end
    @counts = Item.group(:category_id).count
    @categories = Category.all

    if params[:item_key]
      @items = Item.where('brand LIKE ?', "%#{params[:item_key]}%").page(params[:page]).reverse_order
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    # binding.pry
    if @item.save
      redirect_to items_path
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
       redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end


  private

  def set_item
     @item = Item.find(params[:id])
  end

  def item_params
     params.require(:item).permit(:category_id,
                                  :brand,
                                  :image,
                                  :size,
                                  :price,
                                  :purchase_day,
                                  :memo,
                                  :user_id)
  end
end
