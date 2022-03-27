class BulletinsController < ApplicationController 

  def new 
    @bulletin = Bulletin.new
    @user_lists = current_user.subscriber_lists
  end 


  def create 
    @bulletin = Bulletin.new(bulletin_params)
    @user_lists = current_user.subscriber_lists
    @bulletin.user = current_user
    @bulletin.from_address = current_user
    # byebug
    if @bulletin.save
      flash[:success] = "Bulletin was created succesfully."
      redirect_to bulletins_path
    else 
      render 'new'
    end 
  end 

  def index 
    @user_bulletins = current_user.bulletins
    @bulletins = @user_bulletins.paginate(page: params[:page], per_page: 5)
  end

  private 

  def bulletin_params 
    params.require(:bulletin).permit(:subject, :from_address, :body, :header, :footer, subscriber_list_ids: [])
  end 


end
