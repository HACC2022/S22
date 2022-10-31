class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.text :original_url, index: true
      t.string :short_code, index: { unique: true}

      t.timestamps
    end
  end
end
