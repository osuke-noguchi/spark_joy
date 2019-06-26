class Admins::CategoriesController < ApplicationController
 before_action :set_category, only: [:update, :edit, :destroy]
 before_action :authenticate_admin!
 def index
     @categories = Category.all
     @category = Category.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admins_categories_path
  end

  def edit
  end

  def show
  end

  def update
    @category.update(category_params)
    redirect_to admins_categories_path
  end

  def destroy
    @category.destroy
    redirect_to admins_categories_path
  end

  private

  def category_params
      params.require(:category).permit(:category_name)
  end

  def set_category
     @category = Category.find(params[:id])
  end
end
