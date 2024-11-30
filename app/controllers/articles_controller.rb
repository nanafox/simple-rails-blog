# Articles controller
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.where(deleted: false).by_query(params[:query])
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.update(deleted: true)
    PostDeletionJob.perform_later(@article.id)

    redirect_to root_path, status: :see_other
  end

  private

    def article_params
      params.expect(article: [ :title, :body, :status ])
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
