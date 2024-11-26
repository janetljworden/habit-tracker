class CategoriesController < ApplicationController
    before_action :ensure_logged_in
    before_action :load_category, except: [:new, :index, :create]
 
    def index
        @categories = current_user.categories
    end

    def new
        @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      @category.user = current_user
      if @category.save
        redirect_to categories_path, notice: "Category Created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      if @category.update category_params
        redirect_to categories_path, notice: "Category Updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @category.destroy
      redirect_to categories_path, alert: "Category Deleted."
    end

    private

    # allow specific attributes for mass assignment
    def category_params
      params.require(:category).permit(:title)
    end

    # loads a specific habit based on its ID
    def load_category
      @category = current_user.categories.find params[:id]
    end

end
