# frozen_string_literal: true

class PagesController < ApplicationController
  expose :winning_solutions, -> { Solution.winners }

  def home; end
  def legal; end

  def download_pdf
    send_file "#{Rails.root}/app/assets/docs/Call_for_Solutions_Toolkit.pdf", type: "application/pdf", x_sendfile: true
  end
end
