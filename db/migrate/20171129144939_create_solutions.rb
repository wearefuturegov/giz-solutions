# frozen_string_literal: true

class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.string :video_url
      t.string :website
      t.text :title
      t.text :description
      t.text :business_opportunities
      t.text :implementation_impact
      t.text :skills_experience
      t.references :user
      t.timestamps
    end
  end
end
