class CategoriesController < ApplicationController

    before_action :set_category, only:[:show,:update,:edit,:destroy]

    def new
        @category =Category.new
    end

    def create
        @category=Category.new(category_params)
        if @category.save
            flash[:notice]="Category Created Successfully"
            redirect_to @category
        else
            render :new,status: :unprocessable_entity
        end
    end

    def show
    end

    def index
        @categories= Category.all
    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:notice]="Category Updated Successfully"
            redirect_to @category
        else
            render :new,status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
        flash[:notice]="Category Deleted Successfully"
        redirect_to categories_path
    end

    private
    def set_category
        @category=Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end