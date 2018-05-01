class Admin::ExportSolutionsController < ApplicationController
  before_action :authenticate_admin!
  def show

    @solutions = Solution.all

    respond_to do |format|
      format.any do
        render :pdf          => 'solutions',
               :disposition  => 'attachment',
               :template     => 'admin/pdf/solutions',
               :type         => 'application/pdf',
               :layout       => 'layouts/pdf',
               :formats      => [:html],
               :footer       => { :right => '[page] of [topage]' }
          end
      end
    end
  end
