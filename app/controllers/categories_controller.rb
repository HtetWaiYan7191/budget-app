class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:splash]
  def index
    @categories = if params[:search]
                    Category.where(user_id: current_user.id).search_by_name(params[:search]).page(params[:page]).per(4)
                  else
                    Category.where(user_id: current_user.id).includes(:purchases).page(params[:page]).per(4)
                  end
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
