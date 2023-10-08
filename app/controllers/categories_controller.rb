class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
    @options = [
      ["🍔"],
    ["🛒"],
    ["🚗"],
    ["🐶"],
    ["📚"],
    ["💻"],
    ["🎁"],
    ["🏠"],
    ["🏥"],
    ["🎬"],
    ["👔"],
    ["🎓"],
    ]
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created'
    else
      redirect_to new_category_path, notice: 'Cannot create a new category'
    end
  end

  def splash
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
