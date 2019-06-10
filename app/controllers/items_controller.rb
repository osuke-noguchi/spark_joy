class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
