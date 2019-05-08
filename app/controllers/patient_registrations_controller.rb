class PatientRegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = PatientRegistration.all
    @patient = PatientRegistration.new
  end

  def create
    return if unique_check
    @patient = PatientRegistration.new(patient_params)
    if @patient.save
      redirect_to patients_path, flash: {success: 'New patient added successfully.'}
    else
      redirect_to :back
    end
  end

  def edit

  end

  private

  def unique_check
    if PatientRegistration.find_by(contact_number: params[:patient][:contact_number]).present? || PatientRegistration.find_by(email: params[:patient][:email]).present?
      redirect_to patients_path
    end
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :contact_number, :address_line, :city, :state, :country, :pincode, :email, :govt_id_type, :govt_id)
  end
end
