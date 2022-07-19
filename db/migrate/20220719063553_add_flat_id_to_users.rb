class AddFlatIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :flat, index: true, type: :uuid
  end
end
