class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.string :image
      t.jsonb :package_type, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
