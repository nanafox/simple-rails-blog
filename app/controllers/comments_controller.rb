# Comments Controller
class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private

    def comment_params
      params.expect(comment: [ :commenter, :body ])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end
