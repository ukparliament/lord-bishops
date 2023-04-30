class Person < ApplicationRecord
  
  def list_display_label
    list_display_label = self.list_display_name + ' ('  + self.dates_as_year_display + ')'
    list_display_label
  end
  
  def list_display_name
    self.surname + ', ' + self.forenames
  end
  
  def dates_as_year_display
    date_of_birth_display + ' - ' + date_of_death_display
  end
  
  def date_of_birth_display
    date_of_birth_display = self.year_of_birth.to_s
  end
  
  def date_of_death_display
    date_of_death_display = ''
    date_of_death_display = self.year_of_death.to_s if self.year_of_death
    date_of_death_display
  end
end
