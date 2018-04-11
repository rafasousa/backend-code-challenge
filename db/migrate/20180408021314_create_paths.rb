class CreatePaths < ActiveRecord::Migration[5.1]
  def change
    create_table :paths do |t|
      t.string :source
      t.string :destination
      t.integer :distance

      t.timestamps
    end
  end
end
