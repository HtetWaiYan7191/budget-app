class PurchasesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @purchases = @category.purchases
    @purchases = @purchases.sort { |a, b| b.created_at <=> a.created_at }
    @total  = @purchases.map(&:amount).sum
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchases_params)
    @category = Category.find(params[:category_id])

  
    if @purchase.save
      CategoryPurchase.create(category_id: @category.id, purchase_id: @purchase.id)
      redirect_to category_purchases_path(category_id: @category.id), notice: 'Purchase was successfully created.'
    else
      redirect_to new_category_purchase_path(category_id: @category.id), notice: 'Purchase cannot create '
     
      
    end

  end
  

  def destroy
    @purchase = Purchase.find(params[:id])
    @category = Category.find(params[:category_id])
    @category_purchases = CategoryPurchase.where(purchase_id: @purchase.id)
    @category_purchases.destroy_all
    @purchase.destroy!
    redirect_to category_purchase_path(category_id: @category.id), notice: 'Purchas deleted successfully'
  end

  private 
  
  def purchases_params
    params.require(:purchase).permit(:name, :amount).merge(author_id: current_user.id)
  end
end
