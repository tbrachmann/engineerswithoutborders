class VolunteersController < ApplicationController
  helper :all
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]


  # GET /volunteers
  # GET /volunteers.json
  def index
    
    @all_status = Volunteer.all_status
    @selected_status = params[:status] || session[:status] || {}
    
    @all_states = Volunteer.all_states
    @selected_state = params[:state] || session[:state] || {}
    
    @all_education = Volunteer.all_education
    @selected_education = params[:education] || session[:education] || {}
    


    

    ungrouped = Volunteer.where(group: "Select One")
    @grouped = Volunteer.where.not(group: "Select One")
    @volunteers = ungrouped
    if @selected_status != "Select One"
      @volunteers = @volunteers.where(status: @selected_status)
    end
    
    if @selected_state != "Select One"
      @volunteers = @volunteers.where(state: @selected_state)
    end
    
    if @selected_education != "Select One"
      @volunteers = @volunteers.where(education: @selected_education)
    end
    
      
  end


  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
  end

  # GET /volunteers/new
  def new
    @groups = Volunteer.all_groups
    @volunteer = Volunteer.new
    @states = Volunteer.all_states
    @statuses = Volunteer.status_volunteer
    @education = Volunteer.education_volunteer
    @time_invest = Volunteer.time_invest_volunteer
    @places = Volunteer.all_places
    @involvement = Volunteer.involvement
  end

  # GET /volunteers/1/edit
  def edit
    @groups = Volunteer.all_groups
    @states = Volunteer.all_states
    @statuses = Volunteer.status_volunteer
    @education = Volunteer.education_volunteer
    @time_invest = Volunteer.time_invest_volunteer
    @places = Volunteer.all_places
    @involvement = Volunteer.involvement
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    # if @volunteer..nil? || @movie.director.empty?
    #   flash[:notice] = "'#{@movie.title}' has no director info"
    #   redirect_to movies_path
    # else
    #   @movies = Movie.search_director(params[:id])
    # end
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.first_name.empty?
      flash[:notice] = "Error: Invalid first name."
      redirect_to new_volunteer_path
    elsif @volunteer.last_name.empty?
      flash[:notice] = "Error: Invalid last name."
      redirect_to new_volunteer_path
    elsif @volunteer.phone.empty? or ((@volunteer.phone =~ /^([0-9]{3}(\s|\-)?){2}[0-9]{4}$/) != 0)
      flash[:notice] = "Error: Invalid phone number."
      redirect_to new_volunteer_path
    elsif @volunteer.email.empty? or ((@volunteer.email.upcase =~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/) != 0)
      flash[:notice] = "Error: Invalid email address."
      redirect_to new_volunteer_path
    elsif @volunteer.city.empty? 
      flash[:notice] = "Error: Invalid City."
      redirect_to new_volunteer_path
    else
      respond_to do |format|
        if @volunteer.save
          format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
          format.json { render :show, status: :created, location: @volunteer }
        else
          format.html { render :new }
          format.json { render json: @volunteer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /volunteers/1
  # PATCH/PUT /volunteers/1.json
  def update
    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully updated.' }
        format.json { render :show, status: :ok, location: @volunteer }
      else
        format.html { render :edit }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer.destroy
    respond_to do |format|
      format.html { redirect_to volunteers_url, notice: 'Volunteer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_params
      params.require(:volunteer).permit(:first_name, :last_name, :phone, :email, :city, :state, :subscribe, 
      :join_team, :status, :education, :major, :certification, :languages, :fluency, :ewb_experience, :international_experience, :work_experience, :reason, :time_investment,
      :travel, :places, :current_events, :involvement, :group)
    end
end


    
