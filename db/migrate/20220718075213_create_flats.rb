class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats, id: :uuid do |t|

      t.string :name
      t.decimal :longitude
      t.decimal :latitude
      t.timestamps
    end
  end
end
