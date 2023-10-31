class JoinPackagesReservations < ActiveRecord::Migration[7.0]
  def change
    create_join_table :packages, :reservations do |t|
      t.index [:package_id, :reservation_id]
      t.index [:reservation_id, :package_id]
    end
  end
end
