class Comment::Create
  include Interactor
  include Pundit

  before do
    @comment = Comment.new context.to_h
  end

  before do
    authorize @comment
  end

  def call
    @comment.save
    context.comment = @comment
  end

  def action_name
    :create
  end

  def current_user
    context.user
  end
end
