# frozen_string_literal: true

class CreateRsvpGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvp_guests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.boolean :attending, default: false, null: false
      t.integer :total_adults, default: 1, null: false
      t.integer :total_children, default: 0, null: false
      t.timestamps
    end
  end
end
