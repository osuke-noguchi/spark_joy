class ItemsController < ApplicationController
  def index
    @items = Item.all
     # item =Item.find_by(item_params[:category_id])
     # item.increment(:category_id, item_params[:category_id].to_i)
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
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
