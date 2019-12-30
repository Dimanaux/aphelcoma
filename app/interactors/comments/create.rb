module Comments
  class Create
    include Interactor

    before do
      context.comment = Comment.new(context.to_h)
    end

    def call
      context.fail!(error: I18n.t("errors.messages.text.blank")) unless context.comment.save
    end
  end
end
