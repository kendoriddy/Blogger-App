class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to user_post_url(@user, @post)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:author_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end


class CommentsController < ApplicationController
    before_action :set_user, only: [:create]
    before_action :set_post, only: [:create]
  
    def create
      @comment = Comment.new(comment_params)
      @comment.post = @post
      @comment.author = current_user
      if @comment.save
        redirect_to user_post_path(@user, @post)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def new
      @comment = Comment.new
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end