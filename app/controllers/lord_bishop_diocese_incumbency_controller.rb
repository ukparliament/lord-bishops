class LordBishopDioceseIncumbencyController < ApplicationController
  
  def index
    @page_title = 'Lord bishop diocese incumbency'
    @lord_bishopric_diocese_incumbencies = LordBishopDioceseIncumbency.find_by_sql(
      "
        SELECT lbdi.*, p.surname AS person_surname, p.forenames AS person_forenames, lbd.most_recent_name AS lord_bishop_diocese_most_recent_name, lbd.is_archdiocese AS lord_bishop_diocese_is_archdiocese
        FROM lord_bishop_diocese_incumbencies lbdi, people p, lord_bishop_dioceses lbd
        WHERE lbdi.person_id = p.id
        AND lbdi.lord_bishop_diocese_id = lbd.id
        ORDER BY lbdi.start_year, lbdi.start_month, lbdi.start_day, lbdi.end_year, lbdi.end_month, lbdi.end_day
      "
    )
  end
  
  def show
    lord_bishop_diocese_incumbency = params[:lord_bishop_diocese_incumbency]
    @lord_bishop_diocese_incumbency = LordBishopDioceseIncumbency.find_by_sql(
      "
        SELECT lbdi.*, p.surname AS person_surname, p.forenames AS person_forenames, lbd.most_recent_name AS lord_bishop_diocese_most_recent_name, lbd.is_archdiocese AS lord_bishop_diocese_is_archdiocese
        FROM lord_bishop_diocese_incumbencies lbdi, people p, lord_bishop_dioceses lbd
        WHERE lbdi.person_id = p.id
        AND lbdi.lord_bishop_diocese_id = lbd.id
        AND lbdi.id = #{lord_bishop_diocese_incumbency}
      "
    ).first
    @page_title = @lord_bishop_diocese_incumbency.display_label
  end
end
