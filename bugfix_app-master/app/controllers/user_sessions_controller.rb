# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path, white: 'ログインしました。', status: :see_other
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, white: 'ログアウトしました。', status: :see_other
  end
end
