class CreateAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :analytics do |t|
      t.references :url, null: false, foreign_key: true
      t.string :country
      t.integer :hits, :default => 0
      #Ex:- :default =>''

      t.timestamps
    end
  end
end
