class LordBishopDioceseIncumbencyEndReason < ApplicationRecord
  
  def lord_bishop_diocese_incumbencies
    LordBishopDioceseIncumbency.find_by_sql(
      "
        SELECT lbdi.*, p.surname AS person_surname, p.forenames AS person_forenames, lbd.most_recent_name AS lord_bishop_diocese_most_recent_name, lbd.is_archdiocese AS lord_bishop_diocese_is_archdiocese
        FROM lord_bishop_diocese_incumbencies lbdi, people p, lord_bishop_dioceses lbd
        WHERE lbdi.person_id = p.id
        AND lbdi.lord_bishop_diocese_id = lbd.id
        AND lbdi.lord_bishop_diocese_incumbency_end_reason_id = @#{self.id}
        ORDER BY lbdi.start_year, lbdi.start_month, lbdi.start_day, lbdi.end_year, lbdi.end_month, lbdi.end_day
      "
    )
  end
end
