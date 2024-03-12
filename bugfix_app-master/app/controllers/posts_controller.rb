# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :set_current_user_post, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(8)
  end

  def show; end

  def new
    @post = current_user.posts.build
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, white: '投稿を行いました。'
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, white: '投稿を更新しました。'
    else
      flash.now[:danger] = '投稿の更新に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path, white: '投稿を削除しました。', status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_current_user_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
