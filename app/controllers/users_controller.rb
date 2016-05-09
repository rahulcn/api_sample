class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  respond_to :json, :html

  # GET /users.json
  def index
    @users = User.all
    respond_with @user
  end

  # GET /users/1.json
  def show
    respond_with @user
  end

  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.save
    respond_with @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end
