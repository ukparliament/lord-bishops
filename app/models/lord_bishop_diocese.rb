class LordBishopDiocese < ApplicationRecord
  
  belongs_to :established_church
  has_many :lord_bishop_diocese_names, -> { order( :start_year, :start_month, :start_day ) }
  
  def incumbent_title
    incumbent_title = ''
    if self.is_archdiocese
      incumbent_title = 'Archbishop'
    else
      incumbent_title = 'Bishop'
    end
    incumbent_title
  end
  
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
  
  def lord_bishop_diocese_incumbencies
    LordBishopDioceseIncumbency.find_by_sql(
      "
        SELECT lbdi.*, p.forenames AS person_forenames, p.surname AS person_surname
        FROM lord_bishop_diocese_incumbencies lbdi, people p
        WHERE lbdi.person_id = p.id
        AND lbdi.lord_bishop_diocese_id = #{self.id}
        ORDER BY lbdi.start_year, lbdi.start_month, lbdi.start_day, lbdi.end_year, lbdi.end_month, lbdi.end_day
      "
    )
  end
end
