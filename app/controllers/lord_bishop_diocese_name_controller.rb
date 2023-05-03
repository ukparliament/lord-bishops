class LordBishopDioceseNameController < ApplicationController
  
  def index
    @page_title = 'Lord bishop diocese names'
    @lord_bishop_diocese_names = LordBishopDioceseName.find_by_sql(
      "
        SELECT lbdn.*, lbd.most_recent_name
        FROM lord_bishop_diocese_names lbdn, lord_bishop_dioceses lbd
        WHERE lbdn.lord_bishop_diocese_id = lbd.id
        ORDER BY start_year, start_month, start_day, end_year, end_month, end_day, name
      "
    )
  end
end
