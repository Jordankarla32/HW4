class AddFieldsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :image, :string
  end
end
