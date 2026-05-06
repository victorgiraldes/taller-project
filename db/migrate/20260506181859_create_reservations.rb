class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :status, default: 0, null: false
      t.string :email

      t.timestamps
    end
  end
end
