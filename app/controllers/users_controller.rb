class UsersController < ApplicationController
  
def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end

private
def user_params
  params.require(:user).permit(:nickname, :prefecture_id, :gender_identity_id, :sexual_orientation_1_id, 
  :sexual_orientation_2_id,:sexual_orientation_3_id,:sexual_orientation_4_id,
  :sexual_orientation_5_id, :sexual_orientation_6_id, :sexual_orientation_7_id,
  :height, :body_type_id, :purpose_id, :self_pr, :image)
end

end
