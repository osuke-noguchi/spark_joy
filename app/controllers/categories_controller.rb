class CategoriesController < ApplicationController

  def index
    @items = Item.where(category_id: 20)
    @counts = Item.group(:category_id).count
    @categories = Category.all
  end

  def show
    @category = Category.find_by(category_name: item.category_id)
  end
end

