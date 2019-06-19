class CategoriesController < ApplicationController

def index
  @user = current_user
  @items = current_user.items
  if params[:category_id].present?
       @items = Item.where(user_id: @user.id, category_id: params[:category_id]).page(params[:page]).reverse_order
     else
       @items = @user.items.page(params[:page]).reverse_order
     end
end

def show
  @user = current_user
  @items = current_user.items
  if params[:category_id].present?
       @items = Item.where(user_id: @user.id, category_id: params[:category_id]).page(params[:page]).reverse_order
     else
       @items = @user.items.page(params[:page]).reverse_order
     end

end

end

