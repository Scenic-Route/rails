class CommentsController < ApplicationController
  before_action :authenticate_user_from_token!


    # POST /comments
  def create
    @comment = Comment.new(comment_params)
    if !@comment.is_profane?
      @comment.user_name = User.find(@comment.user_id).username
      if @comment.save
        Route.find(@comment.route_id).add_to_popularity
        render json: {:comment => @comment}, status: :created
      else
        render json: {:error => @comment.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't have profanity in your comment!"}, status: :forbidden
    end
  end

    # PATCH /comments/:id
  def edit
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      if @comment.update!(comment_params)
        render json: {:comment => @comment}, status: :ok
      else
        render json: {:error => @comment.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't edit a comment that isn't yours!"}, status: :forbidden
    end
  end

    # DELETE /comments/:id
  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      if @comment.destroy
        render json: {:comment => nil}, status: :ok
      else
        render json: {:error => @comment.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "You can't delete a comment that isn't yours!"}, status: :forbidden
    end
  end

    # GET /comments
  def my_comments
    @comments = current_user.comments
    if @comments
      render json: {:comments => @comments}, status: :ok
    else
      render json: {:error => @comments.errors.full_messages}, status: :unprocessable_entity
    end
  end

    # GET /routes/:id/comments
  def route_comments
    @route = Route.find(params[:id])
    @comments = @route.comments
    if @comments
      render json: {:comments => @comments}, status: :ok
    else
      render json: {:error => @comments.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private


    def comment_params
      params.require(:comment).permit(:user_id, :route_id, :content)
    end

    def as_json(opts={})
      super(:only => [:id, :user_id, :route_id, :content, :user_name])
    end

end
