# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :admin_only

  def change_admin_status
    @user = User.find(params[:id])
    @user.admin? ? @user.update(admin: false) : @user.update(admin: true)

    redirect_to root_path, notice: t('users.messages.admin_status_changed', user: @user.email)
  end

  private

  def admin_only
    return if current_user.admin?

    # :nocov:
    redirect_to destroy_user_session_path
    # :nocov:
  end
end
