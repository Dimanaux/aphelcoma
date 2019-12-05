module Comments
  class Create
    include Interactor
    include Pundit

    before do
      @comment = Comment.new context.to_h
    end

    def call
      context.comment = @comment
      context.fail! unless @comment.save
    end

    def action_name
      :create
    end

    def current_user
      context.user
    end
  end
end
