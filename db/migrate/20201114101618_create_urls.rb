class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :full_url, :de
      t.string :short_url
      t.integer :hits, :default => 0
      #Ex:- :default =>''

      t.timestamps
    end
  end
end
