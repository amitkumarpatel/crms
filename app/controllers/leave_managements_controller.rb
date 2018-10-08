class LeaveManagementsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_leave_management, only: [:show, :edit, :update, :destroy]

  # GET /leave_managements
  # GET /leave_managements.json
  def index
    @leave_managements = LeaveManagement.where("true").order(:holiday_name).page params[:page]
  end

  # GET /leave_managements/1
  # GET /leave_managements/1.json
  def show
  end

  # GET /leave_managements/new
  def new
    @leave_management = LeaveManagement.new
  end

  # GET /leave_managements/1/edit
  def edit
  end

  # POST /leave_managements
  # POST /leave_managements.json
  def create
    @leave_management = LeaveManagement.new(leave_management_params)

    respond_to do |format|
      if @leave_management.save
        format.html { redirect_to @leave_management, notice: 'Leave management was successfully created.' }
        format.json { render :show, status: :created, location: @leave_management }
      else
        format.html { render :new }
        format.json { render json: @leave_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_managements/1
  # PATCH/PUT /leave_managements/1.json
  def update
    respond_to do |format|
      if @leave_management.update(leave_management_params)
        format.html { redirect_to @leave_management, notice: 'Leave management was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_management }
      else
        format.html { render :edit }
        format.json { render json: @leave_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_managements/1
  # DELETE /leave_managements/1.json
  def destroy
    @leave_management.destroy
    respond_to do |format|
      format.html { redirect_to leave_managements_url, notice: 'Leave management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_management
      @leave_management = LeaveManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_management_params
      params.require(:leave_management).permit(:holiday_name, :date, :user_id)
    end
end
