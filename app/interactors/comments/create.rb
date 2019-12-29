module Comments
  class Create
    include Interactor

    before do
      @comment = Comment.new context.to_h
    end

    def call
      context.comment = @comment
      context.fail! unless @comment.save
    end
  end
end
