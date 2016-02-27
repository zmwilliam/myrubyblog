class CommentsController < InheritedResources::Base

  def create
    @comment = Comment.new(params[ comment_params ])
    if @comment.save
      flash[:notice] = 'Comment was successfully created'
      redirect_to(@comment.post)
    else
      flash[:notice] = @comment.errors#'Error creating comment: #{@comment.errors}'
      redirect_to posts_path
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:name, :email, :body, :post_id)
    end
end

