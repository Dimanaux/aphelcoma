module CommentsHelper
  def comment_path(comment)
    problem_comment_path(comment.problem, comment)
  end

  def edit_comment_path(comment)
    edit_problem_comment_path(comment.problem, comment)
  end

  def comments_path(problem)
    problem_comments_path(problem)
  end
end
