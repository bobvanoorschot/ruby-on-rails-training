# frozen_string_literal: true

class BlogsController < CrudController
  before_action :set_blog, only: %i[show edit update destroy test_member]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show; end

  # GET /blogs/1/edit
  def edit; end

  def test_member
    if @blog.concept?
      @blog.published!
    else
      @blog.concept!
    end

    redirect_to blog_url(@blog), notice: 'Blog was successfully updated.'
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def model_name
    "blog"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
    def set_resource
        instance_variable_set("@#{model_name}", model.friendly.find(params[:id]))
    end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :body, :background_image)
  end
end
