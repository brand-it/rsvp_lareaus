# frozen_string_literal: true

class CreateSlackMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :slack_messages do |t|
      t.string   :channel
      t.text     :text
      t.boolean  :ok
      t.string   :error_message
      t.timestamps
    end
  end
end
