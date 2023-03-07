class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :kind
      t.string :designed_by

      t.timestamps
    end
  end
end
