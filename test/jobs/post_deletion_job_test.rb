require "test_helper"

class PostDeletionJobTest < ActiveJob::TestCase
  test "deleting an article uses a background job for faster user response" do
    article = Article.create(
      title: "Dummy article",
      body: "My new dummy article",
      status: "public",
    )

    10.times do |x|
      article.comments.create(
        commenter: "Commenter #{x + 1}",
        body: "This comment no. #{x + 1}",
        status: "public",
      )
    end

    assert_enqueued_with(job: PostDeletionJob) do
      PostDeletionJob.perform_later(article.id)
    end

    perform_enqueued_jobs do
      PostDeletionJob.perform_later(article.id)
    end

    assert Comment
      .where(article_id: article.id).empty?,
           "Comments should be deleted"
    assert_nil Article.find_by(id: article.id), "Article should be deleted"
  end
end
