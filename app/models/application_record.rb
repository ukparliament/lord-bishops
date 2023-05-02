class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  def month_display( month )
    case month
      when 1
        'January'
      when 2
        'February'
      when 3
        'March'
      when 4
        'April'
      when 5
        'May'
      when 6
        'June'
      when 7
        'July'
      when 8
        'August'
      when 9
        'September'
      when 10
        'October'
      when 11
        'November'
      when 12
        'December'
    end
  end
end
