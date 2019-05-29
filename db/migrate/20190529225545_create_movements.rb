class CreateMovement < ActiveRecord::Migration[5.0]
  def change
    create_table :movement do |t|
      t.integer :type
      t.datetime :performed_in
      t.float :value
      t.string :cpf
      t.string :card_number
      add_reference :movements, :store, foreign_key: true

      t.timestamps
    end
  end
end
