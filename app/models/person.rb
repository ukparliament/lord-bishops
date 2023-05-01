class Person < ApplicationRecord
  
  def list_display_label
    list_display_label = self.list_display_name + ' ('  + self.dates_as_year_display + ')'
  end
  
  def display_name
    self.forenames + ' ' + self.surname
  end
  
  def list_display_name
    self.surname + ', ' + self.forenames
  end
  
  def dates_as_year_display
    year_of_birth_display + ' - ' + year_of_death_display
  end
  
  def year_of_birth_display
    self.year_of_birth.to_s
  end
  
  def year_of_death_display
    year_of_death_display = ''
    year_of_death_display = self.year_of_death.to_s if self.year_of_death
    year_of_death_display
  end
  
  def lifespan
    self.date_of_birth + ' - ' + self.date_of_death
  end
  
  def date_of_birth
    date_of_birth = ''
    date_of_birth += self.day_of_birth.to_s + ' ' if self.day_of_birth
    date_of_birth += month_display( self.month_of_birth ) + ' ' if self.month_of_birth
    date_of_birth += self.year_of_birth.to_s + ' ' if self.year_of_birth
    date_of_birth
  end
  
  def date_of_death
    date_of_death = ''
    date_of_death += self.day_of_death.to_s + ' ' if self.day_of_death
    date_of_death += month_display( self.month_of_death ) + ' ' if self.month_of_death
    date_of_death += self.year_of_death.to_s + ' ' if self.year_of_death
    date_of_death
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
