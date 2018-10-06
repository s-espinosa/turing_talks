class Presentation < ApplicationRecord
  belongs_to :inning

  def formatted_date
    date.strftime("%B %-d, %Y")
  end
end
