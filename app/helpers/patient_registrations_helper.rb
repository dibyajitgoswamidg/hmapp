module PatientRegistrationsHelper
  def gender(val)
    gender = {"1" => "Male", "2" => "Female", "3" => "Others"}
    gender[val]
  end
end
