class ApplicationsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_application, only: [:update]

  def index
    # Show all applications for current student
    @applications = current_student.applications.includes(:job_role)
  end

  def new
    @job_roles = JobRole.all
    @application = Application.new
  end

  def create
    @application = current_student.applications.build(application_params)
    @application.status = "pending"  # default status

    if @application.save
      redirect_to applications_path, notice: "Application submitted successfully."
    else
      @job_roles = JobRole.all
      render :new
    end
  end

  def update
   if @application.update(application_params)
     redirect_to admin_application_path(@application), notice: "Application status updated."
   else
     render :edit
   end
 end


  private

  def set_application
    @application = Application.find(params[:id])
  end

  # Strong parameters for update
  def application_params
    params.require(:application).permit(:job_role_id, :status, :other, :allowed, :attributes, :resume)
  end
end
