class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  #Descending order of posts reffering to time.
  def index
    @posts = Post.all.order("created_at DESC")
  end

  #Views>posts>new.html.erb for information
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	#If able to save>
  	if @post.save
  		redirect_to @post
  	else
  		#Refresh
  		render 'new'
  	end
  end

  #Every post has it's own id starting from 1
  #So here it finds the specefic post reffering to its id
  #show.html.erb
  def show
  end

  #Edit
  def edit
  end

  #Def update
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def donew
    @post.update(post params)
  end
  

  private

  #Find_post method

  def find_post
    @post = Post.find(params[:id])
  end

  #Private because it wont be needed outside this file
  def post_params
  	#You need to permit for security ;)
  	params.require(:post).permit(:title,:body)
  end

end
