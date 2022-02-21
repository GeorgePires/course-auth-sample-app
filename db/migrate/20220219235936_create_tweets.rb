class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :body
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
