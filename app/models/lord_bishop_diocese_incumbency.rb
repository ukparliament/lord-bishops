class LordBishopDioceseIncumbency < ApplicationRecord
  
  belongs_to :person
  belongs_to :lord_bishop_diocese
  belongs_to :lord_bishop_diocese_incumbency_end_reason, optional: true
  
  def display_label
    display_label = self.person_name + ' - ' + self.bishop_title
  end
  
  def person_name
    self.person_forenames + ' ' + self.person_surname
  end
  
  def bishop_title
    bishop_title = ''
    if self.lord_bishop_diocese_is_archdiocese
      bishop_title += 'Archbishop of '
    else
      bishop_title += 'Bishop of '
    end
    bishop_title += self.lord_bishop_diocese_most_recent_name
  end
  
  def date_range
    self.start_date + ' - ' + self.end_date
  end
  
  def start_date
    start_date = ''
    if self.start_year
      start_date += self.start_year.to_s
      if self.start_month
        start_date = month_display( self.start_month ) + ' ' + start_date
        if self.start_day
          start_date = self.start_day.to_s + ' ' + start_date
        end
      end
    else
      start_date += 'Unknown'
    end
    start_date
  end
  
  def end_date
    end_date = ''
    if self.end_year
      end_date += self.end_year.to_s
      if self.end_month
        end_date = month_display( self.end_month ) + ' ' + end_date
        if self.end_day
          end_date = self.end_day.to_s + ' ' + end_date
        end
      end
    end
    end_date
  end
  
  def translated_from
    Translation.find_by_sql(
      "
        SELECT t.*, lbd.is_archdiocese AS from_is_archdiocese, lbd.most_recent_name AS from_diocese_name
        FROM translations t, lord_bishop_diocese_incumbencies lbdi, lord_bishop_dioceses lbd
        WHERE t.to_lord_bishop_diocese_incumbency_id = #{self.id}
        AND t.from_lord_bishop_diocese_incumbency_id = lbdi.id
        AND lbdi.lord_bishop_diocese_id = lbd.id
      "
    ).first
  end
  
  def translated_to
    Translation.find_by_sql(
      "
        SELECT t.*, lbd.is_archdiocese AS to_is_archdiocese, lbd.most_recent_name AS to_diocese_name
        FROM translations t, lord_bishop_diocese_incumbencies lbdi, lord_bishop_dioceses lbd
        WHERE t.from_lord_bishop_diocese_incumbency_id = #{self.id}
        AND t.to_lord_bishop_diocese_incumbency_id = lbdi.id
        AND lbdi.lord_bishop_diocese_id = lbd.id
      "
    ).first
  end
end
