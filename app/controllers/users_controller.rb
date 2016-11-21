class UsersController < ApplicationController
  before_action only: [:show, :edit, :update, :age_sorting]
  
  autocomplete :user, :school
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  def index
    if params[:direction] != nil
      @users = User.order(params[:sort] + " " + params[:direction])
    else
      @users = User.order(params[:id])
    end
    authorize! :read, @users
    @users = @users.page(params[:page]).per(10)
  end
  
  def age_sorting
    @users = User.all
    @users = @users.order(age: :desc)

    render :users => 'index'
  end
  
  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    authorize! :manage, @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if not params[:id]
      redirect_to root_path
    end
    user = User.find(params[:id])
    # update fields
    user.first_name = user_params[:first_name]
    user.last_name = user_params[:last_name]
    user.age = user_params[:age]
    user.education = user_params[:education]
    user.school = user_params[:school]
    user.expertise = user_params[:expertise]
    user.description = user_params[:description]
    user.availability = user_params[:availability]
    user.save
    
    # update complete flag
    if not user.complete
      all_fields_filled = true
      user_params.each do |k, v|
        if v.blank?
          all_fields_filled = false
        end
      end
      if all_fields_filled 
        user.complete = true
        user.save
      else
        flash[:warning] = "Some profile information is still missing. Please fill out the missing fields so that we can determine the best projects for you!"
      end

      if not flash[:warning]
        flash[:notice] = "Profile was successfully updated."
      end
    end

    redirect_to user_path(params[:id])
  end

  private
  def user_params
    # this simply makes it easier to access params[:user_params[:param]]
    params.require(:user)
  end    
end
