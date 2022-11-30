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
end
