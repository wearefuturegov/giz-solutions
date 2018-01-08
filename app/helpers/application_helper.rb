# frozen_string_literal: true

module ApplicationHelper
  def solutions_title
    if ApplicationState.instance.collection?
      t('solution.so_far.title')
    elsif ApplicationState.instance.judging?
      t('solution.title.all')
    else
      t('solution.others.title')
    end
  end
end
