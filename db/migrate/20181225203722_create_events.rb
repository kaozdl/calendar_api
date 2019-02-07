# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :date
      t.date :reminder
      t.references :calendar, foreign_key: true

      t.timestamps
    end
  end
end
