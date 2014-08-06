class Position < ActiveRecord::Base
  belongs_to :resovision
  has_one :video

  def self.create_positions(response_hash)
    resovision_positions_array = [] #array of positions to eventually push into resovision
    position_response_array = response_hash["positions"]["values"]
    position_response_array.each do |position|
      resovision_positions_array.push(Position.create!(title: position["title"],
                       summary: position["summary"],
                       start_year: position["startDate"]["year"],
                       start_month: position["startDate"]["month"],
                       end_year: position["endDate"].nil? ? "Is current position" : position["endDate"]["year"],
                       end_month: position["endMonth"].nil? ? "Is current position" : position["endMonth"]["year"],
                       is_current: position["isCurrent"],
                       company_name: position["company"]["name"]
                       ))
    end
    resovision_positions_array
  end

end
