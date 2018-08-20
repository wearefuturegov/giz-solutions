# frozen_string_literal: true

class PagesController < ApplicationController
  expose :winning_solutions, -> { Solution.winners }

  def home; end
  def legal; end
end
