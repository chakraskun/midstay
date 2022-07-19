class CreateNeighborhoods < ActiveRecord::Migration[7.0]
  def change
    create_table :neighborhoods, id: :uuid do |t|

      t.string :name
      t.decimal :north_boundary
      t.decimal :south_boundary
      t.decimal :east_boundary
      t.decimal :west_boundary
      t.timestamps
    end
  end
end
