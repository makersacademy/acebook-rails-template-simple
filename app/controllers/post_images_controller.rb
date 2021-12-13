class PostImagesController < ApplicationController
  before_action :set_post_image, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @post_images = PostImage.all
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post_image = PostImage.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post_image = PostImage.new(post_image_params)

      if @post_image.save
          redirect_to @post_image, notice: 'Post was successfully created.'
      else
          flash.now[:alert] = 'Post creation failed.'
      end
    end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post_image.update(post_image_params)
        format.html do
          redirect_to @post_image, notice: 'Post was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @post_image.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post_image.destroy
    redirect_to post_images_url, alert: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post_image
    @post_image = PostImage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_image_params
    params.require(:post_image).permit(:title, :content, :image)
  end
end
