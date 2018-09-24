class PostsController < ApplicationController
	def index
		@posts = Post.all
	end


	def show
	end

	def new
		@post = Post.new

		respond_to do |format|
			format.html  # new.html.erb
			format.json  { render :json => @post }
		end
	end

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

  private
	def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

end
