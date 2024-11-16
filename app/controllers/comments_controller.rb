# Comments Controller
class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[destroy]

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

    def comment_params
      params.expect(comment: [ :commenter, :body, :status ])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = @article.comments.find(params[:id])
    end
end
