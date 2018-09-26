class PostsController < ApplicationController
	def create
	  @post = Post.create(post_params)
	 
	  respond_to do |format|
	    if @post.save
	      format.html  { redirect_to(@post,
	                    :notice => 'Post was successfully created.') }
	      format.json  { render :json => @post,
	                    :status => :created, :location => @post }
	    else
	      format.html  { render :action => "new" }
	      format.json  { render :json => @post.errors,
	                    :status => :unprocessable_entity }
	    end
	  end
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])

		respond_to do |format|
		format.html  # show.html.erb
		format.json  { render :json => @post }
  		end
  	end

	def new
		@post = Post.new
	end

	private
	def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end

