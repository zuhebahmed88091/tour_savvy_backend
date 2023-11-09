# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.boolean :admin, null: false, default: false
      t.string :user_token, null: false, default: ''
      
      t.timestamps null: false
    end
  end
end
