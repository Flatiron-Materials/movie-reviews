class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rating
      t.string :release_date
      t.string :runtime
      t.string :genre
      t.text :plot
      t.string :awards
      t.string :poster_url

      t.timestamps
    end
  end
end
