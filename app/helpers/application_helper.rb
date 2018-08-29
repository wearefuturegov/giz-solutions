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

  def page_title
    return 'GIZ Call for Solutions' unless solution_show_page
    solution.title
  end

  def page_description
    return "What's your solution? Contribute your solutions to improve the lives of refugees. #solutionschallenge" unless solution_show_page
    solution.description
  end

  def page_og_image
    return "#{root_url}share_image.jpg" unless solution_show_page
    solution.hero_image.url(:medium)
  end

  def page_og_url
    return root_url unless solution_show_page
    request.url
  end

  private

  def solution_show_page
    request.url =~ /solutions\/[\d]*/
  end
end
