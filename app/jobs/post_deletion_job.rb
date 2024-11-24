# Article post deletion job.
class PostDeletionJob < ApplicationJob
  queue_as :default

  def perform(article_id)
    article = Article.find_by(id: article_id)
    return unless article

    article.comments.delete_all

    # now delete the article itself.
    article.delete
  end
end
