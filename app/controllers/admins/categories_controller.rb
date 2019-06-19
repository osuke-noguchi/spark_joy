class Admins::CategoriesController < ApplicationController
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
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_path
  end

  private

  def category_params
      params.require(:category).permit(:category_name)
    end
end
