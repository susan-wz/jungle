class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
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

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update(category_params)
      redirect_to [:admin, :categories], notice: 'Category updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find params[:id]
    if @category.products.count == 0
      @category.destroy
      redirect_to [:admin, :categories], notice: "Category deleted!"
    else
      redirect_to [:admin, :categories], notice: "Category can't be deleted when it contains products."
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
