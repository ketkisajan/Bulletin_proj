class SubscriberListsController < ApplicationController 

  before_action :set_subscriberList, only: [:show,:edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy, :show]

  def show 
    @subscriberList = SubscriberList.find(params[:id])
  end 

  def index 
    if !current_user.admin?
    @user_sublists = current_user.subscriber_lists
   else
    @user_sublists = SubscriberList.all
   end
    @subscriberLists = @user_sublists.paginate(page: params[:page], per_page: 5)
  end

  def new 
    @subscriberList = SubscriberList.new
  end 

  def create 
    @subscriberList = SubscriberList.new(subscriberList_params)
    @subscriberList.user = current_user
    if @subscriberList.save
      flash[:success] = "Subscriber list was created succesfully."
      redirect_to @subscriberList
    else 
      render 'new'
    end 

  end 

  def edit 
  end 

  def update
    if @subscriberList.update(subscriberList_params)
      flash[:success] = "Article was updated successfully"
      redirect_to @subscriberList
   else
    render 'edit'
   end 
  end 

  def destroy 
    @subscriberList.destroy 
    redirect_to subscriber_lists_path
  end

  private 

  def set_subscriberList 
    @subscriberList = SubscriberList.find(params[:id])
  end 

  def subscriberList_params 
    params.require(:subscriber_list).permit(:list_name, :list_type, subscriber_ids: [])
  end 

  def require_same_user
    if current_user != @subscriberList.user && !current_user.admin?
      flash[:danger] = "You can only view, edit or delete your own subscriber list"
      redirect_to root_path
    end
  end

end