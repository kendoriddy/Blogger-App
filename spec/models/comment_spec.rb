require 'rails_helper'

describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Musa', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Software dev from Nigeria')
    @post = Post.new(author: @author, title: 'Very first post', text: 'This is the test post')

    @comment1 = Comment.create(author: @author, post: @post, text: 'First test comment')
    @comment2 = Comment.create(author: @author, post: @post, text: 'Second test comment')
  end

  it "can not update comments_counter since it's a private method" do
    expect(@comment1).to_not respond_to(:update_comments_counter)
    expect(@comment2).to_not respond_to(:update_comments_counter)
  end

  it "will have the Post's comments_counter through update_comments_counter " do
    expect(@post.comments_counter).to eq 2
  end
end
