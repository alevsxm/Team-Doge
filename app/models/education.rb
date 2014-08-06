class Education < ActiveRecord::Base
  belongs_to :resovision
  has_one :video

  def self.create_educations(response_hash)

    resovision_education_array = [] #array of educations to eventually push into resovision
    education_response_array = response_hash["educations"]["values"] #array of edcuations from API call
    education_response_array.each do |education|
      resovision_education_array.push(Education.create!(school_name: education["schoolName"],
                                      degree: education["degree"],
                                      field_of_study: education["fieldOfStudy"],
                                      start_year: education["startDate"]["year"],
                                      end_year: education["endDate"].nil? ? "Currently in school" : education["endDate"]["year"]))
    end
    resovision_education_array
  end

end
