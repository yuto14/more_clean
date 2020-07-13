class ArticlesController < ApplicationController
    
    def top
        @user = current_user
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

    def show
        @article = Article.find(params[:id])
    end
    
    private

    def article_params
        params.require(:article).permit(:title, :article_image, :text)
    end

end
