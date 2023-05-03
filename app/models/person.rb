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
  
  def is_lifespan_redacted?
    
    # We redact lifespan - birth and death dates - by default.
    is_lifespan_redacted = true
    
    # If the person has a year of death ...
    if self.year_of_death
      
      # ... we consider them dead and unredact their lifespan.
      is_lifespan_redacted = false
    end
    is_lifespan_redacted
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
  
  def lord_bishop_diocese_incumbencies
    LordBishopDioceseIncumbency.find_by_sql(
      "
        SELECT lbdi.*, lbd.is_archdiocese AS lord_bishop_diocese_is_archdiocese, lbd.most_recent_name AS lord_bishop_diocese_most_recent_name
        FROM lord_bishop_diocese_incumbencies lbdi, lord_bishop_dioceses lbd
        WHERE lbdi.lord_bishop_diocese_id = lbd.id
        AND lbdi.person_id = #{self.id}
        ORDER BY lbdi.start_year, lbdi.start_month, lbdi.start_day, lbdi.end_year, lbdi.end_month, lbdi.end_day
      "
    )
  end
end
