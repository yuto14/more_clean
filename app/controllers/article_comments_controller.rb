class ArticleCommentsController < ApplicationController

    def create
        @article = Article.find(params[:article_id])
        @article_comment = ArticleComment.new(article_comment_params)
        @article_comment.user_id = current_user.id
        @article_comment.article_id = @article.id
        if @article_comment.save
           redirect_to article_path(@article)
        else
            render "articles/show"
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @article_comment = ArticleComment.find(params[:id])
        @article_comment.destroy
        redirect_to article_path(@article)
    end

    private

    def article_comment_params
        params.require(:article_comment).permit(:comment)
    end
end
