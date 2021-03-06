class Admin::CategoriesController < ApplicationController

  def index
    # @products = Product.order(id: :desc).all
    @categories = Category.order(id: :desc).all
    p @categories
    puts @categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end

  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end
  
  # def new
  #   @product = Product.new
  # end

  # def create
  #   @product = Product.new(product_params)

  #   if @product.save
  #     redirect_to [:admin, :products], notice: 'Product created!'
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @product = Product.find params[:id]
  #   @product.destroy
  #   redirect_to [:admin, :products], notice: 'Product deleted!'
  # end

  # private

  # def product_params
  #   params.require(:product).permit(
  #     :name,
  #     :description,
  #     :category_id,
  #     :quantity,
  #     :image,
  #     :price
  #   )
  # end

end
