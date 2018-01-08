# frozen_string_literal: true

class AddApplicationState < ActiveRecord::Migration[5.1]
  def change
    create_table :application_states do |t|
      t.integer :state, default: 0
    end
    ApplicationState.create
  end
end
