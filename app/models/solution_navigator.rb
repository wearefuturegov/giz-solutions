class SolutionNavigator

  def initialize(solution_ids, current_id)
    @solution_ids = solution_ids
    @current_id = current_id
    @current_index = @solution_ids.index(current_id)
  end

  def next_solution_id
    @solution_ids[@current_index + 1]
  end

  def previous_solution_id
    return if (prev_index = @current_index - 1) < 0
    @solution_ids[prev_index]
  end
end
