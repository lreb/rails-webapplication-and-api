class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.integer :quantity
      t.boolean :deleted

      t.timestamps
    end
  end
end
