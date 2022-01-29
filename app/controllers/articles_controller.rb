class ArticlesController < ApplicationController
    before_action :set_article,only:[:show,:destroy,:edit,:update]

    def index
        @articles=Article.all
    end

    def show
    end

    def new
        @article=Article.new
    end

    def create
        @article=Article.new(article_params)
        @article.user_id=current_user.id
        if @article.save
            flash[:notice]="Article Created Successfully"
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice]="Article Updated Successfully"
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        flash[:notice]="Article Deleted Successfully"
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title,:description)
    end

    def set_article
        @article=Article.find(params[:id])
    end
end