# frozen_string_literal: true

class AddSolutionWinner < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :winner, :boolean, default: false
  end
end
