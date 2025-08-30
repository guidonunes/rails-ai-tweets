class CreateTweets < ActiveRecord::Migration[8.0]
  def change
    create_table :tweets do |t|
      t.text :long
      t.text :shortened

      t.timestamps
    end
  end
end
