# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :admin_only

  def index
    @users = User.all
    @users = User.search_by_email(params[:email]) if params[:email].present?
  end

  def change_admin_status
    @user = User.find(params[:id])
    @user.admin? ? @user.update(admin: false) : @user.update(admin: true)

    redirect_to users_path, notice: t('users.messages.admin_status_changed', user: @user.email)
  end

  private

  def admin_only
    return if current_user.admin?

    flash[:alert] = t('users.messages.not_admin')
    redirect_to root_path
  end
end
