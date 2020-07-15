class ArticlesController < ApplicationController
    
    def top
        @user = current_user
    end

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @article_comment = ArticleComment.new
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        if @article.save
           redirect_to article_path(@article)
        else
           render "new"
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
           redirect_to article_path(@article)
        else
           render "edit"
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to user_path(@article.user)
    end

    private

    def article_params
        params.require(:article).permit(:title, :article_image, :text)
    end

end
