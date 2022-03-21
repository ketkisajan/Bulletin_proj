class SubscriberListsController < ApplicationController 

  before_action :set_article, only: [:show,:edit, :update, :destroy]

  def show 
    @subscriberList = SubscriberList.find(params[:id])
  end 

  def index 
    @subscriberLists = SubscriberList.all
  end

  def new 
    @subscriberList = SubscriberList.new
  end 

  def create 
    @subscriberList = SubscriberList.new(subscriberList_params)
    # # @subscriberList.user = current_user
    if @subscriberList.save
      flash[:notice] = "Subscriber list was created succesfully."
      redirect_to @subscriberList
    else 
      render 'new'
    end 

  end 

  def edit 
  end 

  def update
    if @subscriberList.update(subscriberList_params)
      flash[:notice] = "Article was updated successfully"
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

  def set_article 
    @subscriberList = SubscriberList.find(params[:id])
  end 

  def subscriberList_params 
    params.require(:subscriber_list).permit(:list_name, :list_type)
  end 

end