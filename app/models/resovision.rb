class Resovision < ActiveRecord::Base
  belongs_to :user
  has_many :positions, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_one :video, dependent: :destroy

  def self.create_resovision(response_hash)
    first_name = response_hash["firstName"]
    last_name = response_hash["lastName"]
    headline = response_hash["headline"]
    location = response_hash["location"]["name"]
    industry = response_hash["industry"]
    num_positions = response_hash["positions"]["_total"]
    num_educations = response_hash["educations"]["_total"]
    summary = response_hash["summary"]
    pic_url = response_hash["pictureUrl"]

    Resovision.create!(first_name: first_name,
                       last_name: last_name,
                       location: location,
                       pic_url: pic_url,
                       industry: industry,
                       num_positions: num_positions,
                       num_educations: num_educations,
                       summary: summary,
                       headline: headline)
  end

end
