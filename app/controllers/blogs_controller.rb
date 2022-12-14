# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :find_blog, only: %i[show edit update destroy toggle_status]

  def index
    @blogs = Blog.ordered_by_updated_at.all
  end

  def show; end

  def edit; end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: "Blog has be created."
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Blog has be updated."
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy

    redirect_to blogs_path, notice: "Blog has be deleted."
  end

  def toggle_status
    case @blog.status
    when "draft"
      @blog.published!
    when "published"
      @blog.draft!
    end

    redirect_to blogs_path, notice: "Blog has be updated."
  end

  private

  def find_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
