class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order('created_at DESC')
  end

  def new
    @category = Category.new
    @options = [
      ['🍔'],
      ['🛒'],
      ['🚗'],
      ['🐶'],
      ['📚'],
      ['💻'],
      ['🎁'],
      ['🏠'],
      ['🏥'],
      ['🎬'],
      ['👔'],
      ['🎓']
    ]
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created'
    else
      redirect_to new_category_path, alert: 'Cannot create a new category'
    end
  end

  def splash; end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy!
    redirect_to categories_path, alert: 'Category Deleted Successfully '
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
