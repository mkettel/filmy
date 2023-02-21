class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.all
    @user = current_user
  end

  def show
    @user = current_user
  end

  # the method to get to the users account to access settings and such
  def account
    @user = current_user
  end
end
