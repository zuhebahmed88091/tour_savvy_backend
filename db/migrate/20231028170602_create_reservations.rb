class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.string :city_name
      t.string :package_type
      t.references :user, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true
      t.timestamps
    end
  end
end
