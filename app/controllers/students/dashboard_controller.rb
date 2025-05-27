class Students::DashboardController < ApplicationController
  before_action :authenticate_student!

  def index
    # Fetch available job roles with optional filtering
    @job_roles = JobRole.all

    # You can add filters like by location, company, etc. later

    # Fetch current student's applications including job role info
    @applications = current_student.applications.includes(:job_role, resume_attachment: :blob)
  end
end
