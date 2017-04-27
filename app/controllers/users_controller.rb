class UsersController < Clearance::UsersController


  private
  def user_params
    params.require(:user).permit(:fullname, :email, :password, :gender, :birthdate)
  end

end
