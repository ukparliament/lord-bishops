class Translation < ApplicationRecord
  
  def person_name
    self.person_forenames + ' ' + self.person_surname
  end
  
  def from_bishop_title
    self.from_diocese_bishop_styled_as + ' of ' + self.from_diocese_name
  end
  
  def to_bishop_title
    self.to_diocese_bishop_styled_as + ' of ' + self.to_diocese_name
  end
  
  def from_diocese_bishop_styled_as
    from_diocese_bishop_styled_as = ''
    if from_is_archdiocese
      from_diocese_bishop_styled_as = 'Archbishop'
    else
      from_diocese_bishop_styled_as = 'Bishop'
    end
    from_diocese_bishop_styled_as
  end
  
  def to_diocese_bishop_styled_as
    to_diocese_bishop_styled_as = ''
    if to_is_archdiocese
      to_diocese_bishop_styled_as = 'Archbishop'
    else
      to_diocese_bishop_styled_as = 'Bishop'
    end
    to_diocese_bishop_styled_as
  end
  
  def to_incumbency_start_date
    to_incumbency_start_date = self.to_incumbency_year.to_s
    if self.to_incumbency_month
      to_incumbency_start_date = month_display( self.to_incumbency_month ) + ' ' + to_incumbency_start_date
      if self.to_incumbency_day
        to_incumbency_start_date = self.to_incumbency_day.to_s + ' ' + to_incumbency_start_date
      end
    end
    to_incumbency_start_date
    
    #self.to_incumbency_day.to_s + ' ' + month_display( self.to_incumbency_month ) +  ' ' + 
  end
end
