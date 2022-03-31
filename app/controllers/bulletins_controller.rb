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
    if !current_user.admin?
      @user_bulletins = current_user.bulletins
    else 
      @user_bulletins = Bulletin.all 
    end
    @bulletins = @user_bulletins.paginate(page: params[:page], per_page: 5)
  end

  def show 
    @bulletin = Bulletin.find(params[:id])
  end

  private 

  def bulletin_params 
    params.require(:bulletin).permit(:subject, :from_address, :body, :header, :footer, subscriber_list_ids: [], crituser_ids: [])
  end 


end
