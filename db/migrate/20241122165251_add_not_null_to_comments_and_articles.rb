class AddNotNullToCommentsAndArticles < ActiveRecord::Migration[8.0]
  def change
    tables = {
      articles: [ :title, :body ],
      comments: [ :commenter, :body, :status ]
    }

    tables.each do |table, columns|
      columns.each do |column|
        change_column_null table, column, false
      end
    end
  end
end
