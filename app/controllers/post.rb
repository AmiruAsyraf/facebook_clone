get '/post/:username' do
 @user = User.find_by_id(session[:id])
 @post = Post.order('created_at DESC')

 erb :posts
end

get '/post/vote/:post_id' do
 @user = User.find_by_id(session[:id])
 @post = Post.order('created_at DESC')
 @postvote = Post.find_by_id(params[:post_id])
 @vote = @postvote.postvotes.first
 @count = @postvote.postvotes.first.votecount
 @count += 1
 @vote.update_attributes(votecount: @count)
 erb :posts
end

get '/comment/:post_id' do
 @comment = Comment.where(post_id: params[:post_id])
 @post = Post.find_by_id(params[:post_id])
 erb :comments
end

get '/post/:post_id/comment/vote/:comment_id' do
 @comment = Comment.where(post_id: params[:post_id])
 @post = Post.find_by_id(params[:post_id])
 @commentvote = Comment.find_by_id(params[:comment_id])
 @vote = @commentvote.commentvotes.first
 @count = @commentvote.commentvotes.first.votecount
 @count += 1
 @vote.update_attributes(votecount: @count)
 erb :comments
end

get '/page/:user_name' do
 @user = User.find_by_id(session[:id])
 @post =  Post.where(user_id: @user.id)
 @comment = Comment.where(user_id: @user.id)
 @commentvote = @user.commentvotes.create(comment_id: @comment.id)
 erb :user
end

post '/post/new' do
  @user = User.find_by_id(session[:id])
  @post = @user.posts.create(params[:post])
  @postvote = @user.postvotes.create(post_id: @post.id)
  redirect to ("/post/#{@user.name}")
end

post '/newcomment/:post_id' do
  @user = User.find_by_id(session[:id])
  @content = params[:post]
  @comment = @user.comments.create(content: params[:content], post_id: params[:post_id])
  @commentvote = @user.commentvotes.create(comment_id: @comment.id)

  redirect to ("/comment/#{params[:post_id]}")

end

