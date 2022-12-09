class Api::V1::likesController < ApiController
    def index
      @post = Post.find(params[:post_id])
    end
  
    def create
      @post = Post.find(params[:post_id])
  
      return unless @post.likes.create(text: params[:like], author: @current_user)
  
      render json: { success: 'like added successfully' }
    end
end