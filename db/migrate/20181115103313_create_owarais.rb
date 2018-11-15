class CreateOwarais < ActiveRecord::Migration[5.0]
  def change
    create_table :owarais do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
