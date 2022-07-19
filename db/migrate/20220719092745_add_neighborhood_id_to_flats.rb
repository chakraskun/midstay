class AddNeighborhoodIdToFlats < ActiveRecord::Migration[7.0]
  def change
    add_reference :flats, :neighborhood, index: true, type: :uuid
  end
end
