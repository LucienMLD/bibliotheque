class AddcolumnsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :avalaible, :boolean
    add_column :books, :unvailable, :boolean
  end
end
