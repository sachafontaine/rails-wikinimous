class ArticlesController < ApplicationController
  before_action :require_id, only: [:show, :edit, :destroy, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def require_id
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :details)
  end
end
