class CreatePointDistances < ActiveRecord::Migration[5.0]
  def change
    create_table :point_distances do |t|
      t.integer :distance
      t.references :origin
      t.references :destination
      t.timestamps
    end
  end
end
