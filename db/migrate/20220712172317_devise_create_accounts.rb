# frozen_string_literal: true

class DeviseCreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string  :name
      t.integer :number
      t.integer :nominee_to_id
      t.integer :nominee_weightage
      t.integer :balance
      t.timestamps null: false
    end

    add_index :accounts, :email, unique: true
  end
end
