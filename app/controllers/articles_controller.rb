class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    find_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_strong_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    find_article
  end

  def update
    find_article
    @article.update(article_strong_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_strong_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find_by(id: params[:id])
  end
end
