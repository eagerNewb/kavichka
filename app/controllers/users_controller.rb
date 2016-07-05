class UsersController < ApplicationController
  before_action :authenticate_user!  # Tell devise to use :user map
end
