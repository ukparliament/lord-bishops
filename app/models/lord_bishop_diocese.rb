class LordBishopDiocese < ApplicationRecord
  
  belongs_to :established_church
  
  def list_display_label
    list_display_label = self.most_recent_name
    list_display_label += ' ('  + self.dates_as_year_display + ')' if self.start_year
    list_display_label
  end
  
  def dates_as_year_display
    start_year_display + ' - ' + end_year_display
  end
  
  def start_year_display
    self.start_year.to_s
  end
  
  def end_year_display
    end_year_display = ''
    end_year_display = self.end_year.to_s if self.end_year
    end_year_display
  end
  
  def lifespan
    self.start_date + ' - ' + self.end_date
  end
  
  def start_date
    start_date = ''
    start_date += self.start_day.to_s + ' ' if self.start_day
    start_date += month_display( self.start_month ) + ' ' if self.start_month
    start_date += self.start_year.to_s + ' ' if self.start_year
    start_date
  end
  
  def end_date
    end_date = ''
    end_date += self.end_day.to_s + ' ' if self.end_day
    end_date += month_display( self.end_month ) + ' ' if self.end_month
    end_date += self.end_year.to_s + ' ' if self.end_year
    end_date
  end
  
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
