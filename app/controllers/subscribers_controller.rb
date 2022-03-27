class SubscribersController < ApplicationController 

  before_action :require_login, except: [:index, :show]

  def new 
    # byebug
    @subscriber = Subscriber.new
    # @subscriber.subscriber_list_ids = [params[:subl]]
  end 

  def index
    @subscribers = Subscriber.paginate(page: params[:page], per_page: 5) 
  end 

  def show 
    # byebug
    @subscriber = Subscriber.find(params[:id])
    # @subscriber_subLists = @subscriber.subscriberLists.paginate(page: params[:page], per_page: 5)
  end 
  
  def create 
    @subscriber = Subscriber.new(subscriber_params) 
    @subscriber.subscriber_list_ids = [params[:subscriber][:subl]]
    if @subscriber.save 
      flash[:notice] = "Subscriber was succesfully created" 
      redirect_to @subscriber
    else 
      render 'new' 
    end 
  end 

  def edit 
    @subscriber = Subscriber.find(params[:id])
  end 

  def update
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update(subscriber_params)
      flash[:success] = "Subscriber was updated successfully"
      redirect_to @subscriber
   else
    render 'edit'
   end 
  end 

  def destroy 
    # byebug
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy 
    redirect_to subscriber_lists_path
  end

  private 

  def subscriber_params 
    params.require(:subscriber).permit(:name, :email, subscriber_list_ids: [])
  end

  def require_login
    if !logged_in? 
      flash[:danger] = "You need to be logged in to perform that action"
      redirect_to subscribers_path
    end
  end

end