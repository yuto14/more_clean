class ArticlesController < ApplicationController
    def top
        render layout: "layout_top"
    end

    def index
        @articles = Article.all.order(id: "DESC")
    end

    def show
        @article = Article.find(params[:id])
        @article_comment = ArticleComment.new
    end

    # 記事をいいね数順に表示するため、いいねテーブルのarticle_idをカウントし多い順に並びかえる
    def ranking
        @articles_rank = Article.find(Favorite.group(:article_id).order('count(article_id) desc').pluck(:article_id))
    end

    # タグ名で記事を絞り込み
    def tag
        @tag_articles = Article.tagged_with(params[:tag_name])
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
        params.require(:article).permit(:title, :article_image, :text, :tag_list)
    end

end
