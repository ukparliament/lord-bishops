class LordBishopDioceseName < ApplicationRecord
  
  belongs_to :lord_bishop_diocese
  
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
end
