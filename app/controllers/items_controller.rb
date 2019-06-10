class ItemsController < ApplicationController
  def index
    @items = Item.all
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
  end

  def destroy
  end

  private
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
