=begin
class UsersController < ApplicationController
  before_action only: [:show, :edit, :update, :age_sorting]
  
  autocomplete :user, :school
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: "Signed up successfully"
    else
      render :new
    end
  end

  def index
    if request.xhr?
      skill_name = params[:skill_name]
      puts "skill_name"
      skill_obj = Skill.find_by name: skill_name
      @user = skill_obj.users.first
      render :json => @user
      return
    end
    @user = User.all
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(10)
#    @search.build_condition
    authorize! :read, @user
  end

  def manages
    if(!current_user.manager?)
      redirect_to projects_path
    end
    @all_projects = current_user.manages
    @projects = @all_projects.page(params[:page]).per(3)
  end
  
  def age_sorting
    @users = User.all
    @users = @users.order(age: :desc)
    render :users => 'index'
  end
  
  def first_name_sorting
    @users = User.all
    @users = @users.order(first_name :desc)
    render :users => 'index'
  end
  
  def last_name_sorting
    @users = User.all
    @users = @users.order(last_name :desc)
    render :users => 'index'
  end
  
  
  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @education_choices = ["GED", "College Student", "Bachelor's Degree", "Master's Degree", "Doctorate Degree"]
    @proficiency_choices = ["1 - Elementary Proficiency", "2 - Limited Working Proficiency", "3 - Minimum Professional Proficiency", "4 - Full Professional Proficiency", "5 - Native or Bilingual Proficiency"]
    @availability_choices = ["Not Available", "Morning", "Afternoon", "Evening", "Any Time"]
    @time_commitment_choices = ["1-3 hours every month", "1-3 hours every week", "More than 3 hours per week"]
    @travel_availability = ["Yes", "No"]
    @field_choices = ["Civil Engineering","Environmental Engineering","Mechanical Engineering","Electrical Engineering","Materials Science","Chemical Engineering","Hydraulics / Hydrology","Computer Science","Education","International Development"]
    @certificate_choices = ["Agricultural and Biological Engineering","Architectural","Chemical","Civil: Construction","Civil: Geotechnical","Civil: Structural","Civil: Transportation","Civil: Water Resources and Environmental","Control Systems","Electrical and Computer: Computer Engineering","Electrical and Computer: Electrical and Electronics","Electrical and Computer: Power","Environmental","Fire Protection","Industrial and Systems","Mechanical: HVAC and Refrigeration","Mechanical: Machine Design and Materials","Mechanical: Thermal and Fluids Systems","Metallurgical and Materials","Mining and Mineral Processing","Naval Architecture and Marine","Nuclear","Petroleum","Software","Structural"]
    
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
    #user.certifications = user_params[:certifications]
    user.phone = user_params[:phone]
    user.zip = user_params[:zip]
    # languages
    user.lang1 = user_params[:lang1]
    user.lang1_fluency = user_params[:lang1_fluency]
    user.lang2 = user_params[:lang2]
    user.lang2_fluency = user_params[:lang2_fluency]
    # availability
    user.travel = user_params[:travel]
    user.time_commitment = user_params[:time_commitment]
    
    user.availability_comments = user_params[:availability_comments]
    
    user.skills = Skill.get_skills(user_params[:skill_ids])
    
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
=end

class UsersController < ApplicationController
  before_action only: [:show, :edit, :update, :age_sorting]
  
  autocomplete :user, :school
  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  def create
    @user = User.new(params[:user])
    @user.availability = Availability.create()
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: "Signed up successfully"
    else
      render :new
    end
  end

  def index
    if request.xhr?
      #skill_name = params[:skill_name]
      @skills = Hash.new
      @certs = Hash.new
      users = User.all
      users.each do |user|
        @skills[user[:id]] = []
        @certs[user[:id]] = []
        user.certifications.each do |cert|
          @certs[user[:id]].push cert[:name]
        end
        user.skills.each do |skill|
          @skills[user[:id]].push skill[:name]
        end
      end
      data = {:skills => @skills, :certs => @certs}
      render :json => data
      return
    end
    @user = User.all
    if params.key?(:q) && params[:q].key?(:c)
      params[:q][:c].keys.each do |condition_index|
        params[:q][:c][condition_index.to_s].merge!(:p => "cont")
      end
    end
    @q = User.ransack(params[:q])
    #[:p] = "cont"
    @users = @q.result.includes(:role).page(params[:page]).per(10)
    @q.build_condition if @q.conditions.empty?
    authorize! :read, @user
  end
  
  def age_sorting
    @users = User.all
    @users = @users.order(age: :desc)
    render :users => 'index'
  end
  
  def first_name_sorting
    @users = User.all
    @users = @users.order(first_name :desc)
    render :users => 'index'
  end
  
  def last_name_sorting
    @users = User.all
    @users = @users.order(last_name :desc)
    render :users => 'index'
  end
  
  
  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @education_choices = ["GED", "College Student", "Bachelor's Degree", "Master's Degree", "Doctorate Degree"]
    @proficiency_choices = ["1 - Elementary Proficiency", "2 - Limited Working Proficiency", "3 - Minimum Professional Proficiency", "4 - Full Professional Proficiency", "5 - Native or Bilingual Proficiency"]
    @availability_choices = ["Not Available", "Morning", "Afternoon", "Evening", "Any Time"]
    @time_commitment_choices = ["1-3 hours every month", "1-3 hours every week", "More than 3 hours per week"]
    @travel_availability = ["Yes", "No"]
    @field_choices = ["Civil Engineering","Environmental Engineering","Mechanical Engineering","Electrical Engineering","Materials Science","Chemical Engineering","Hydraulics / Hydrology","Computer Science","Education","International Development"]
    @certificate_choices = ["Agricultural and Biological Engineering","Architectural","Chemical","Civil: Construction","Civil: Geotechnical","Civil: Structural","Civil: Transportation","Civil: Water Resources and Environmental","Control Systems","Electrical and Computer: Computer Engineering","Electrical and Computer: Electrical and Electronics","Electrical and Computer: Power","Environmental","Fire Protection","Industrial and Systems","Mechanical: HVAC and Refrigeration","Mechanical: Machine Design and Materials","Mechanical: Thermal and Fluids Systems","Metallurgical and Materials","Mining and Mineral Processing","Naval Architecture and Marine","Nuclear","Petroleum","Software","Structural"]
    @current_availability = @user.availability ? @user.availability.as_json : {}
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

    user.update_availability(user_params[:availability])


    user.first_name = user_params[:first_name]
    user.last_name = user_params[:last_name]
    user.age = user_params[:age]
    user.education = user_params[:education]
    user.school = user_params[:school]
    user.expertise = user_params[:expertise]
    user.description = user_params[:description]

    #user.certifications = user_params[:certifications]
    user.phone = user_params[:phone]
    user.zip = user_params[:zip]
    # languages
    user.lang1 = user_params[:lang1]
    user.lang1_fluency = user_params[:lang1_fluency]
    user.lang2 = user_params[:lang2]
    user.lang2_fluency = user_params[:lang2_fluency]
    # availability
    user.travel = user_params[:travel]
    user.time_commitment = user_params[:time_commitment]
    user.availability_comments = user_params[:availability_comments]
    user.skills = Skill.get_skills(user_params[:skill_ids])
    
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
    params.require(:user).permit!
  end    
end
