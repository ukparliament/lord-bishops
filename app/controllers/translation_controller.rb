class TranslationController < ApplicationController
  
  def index
    @page_title = 'Translations'
    @translations = Translation.find_by_sql(
      "
        SELECT
          t.*,
          from_lbd.most_recent_name AS from_diocese_name,
          from_lbd.is_archdiocese AS from_is_archdiocese,
          to_lbd.most_recent_name AS to_diocese_name,
          to_lbd.is_archdiocese AS to_is_archdiocese,
          p.id AS person_id,
          p.forenames AS person_forenames,
          p.surname AS person_surname,
          to_lbdi.start_year AS to_incumbency_year,
          to_lbdi.start_month AS to_incumbency_month,
          to_lbdi.start_day AS to_incumbency_day
        
        FROM
          translations t,
          lord_bishop_diocese_incumbencies from_lbdi,
          lord_bishop_dioceses from_lbd,
          lord_bishop_diocese_incumbencies to_lbdi,
          lord_bishop_dioceses to_lbd,
          people p
        
        /* We join to the from incumbency and its diocese. */
        WHERE from_lbdi.id = t.from_lord_bishop_diocese_incumbency_id
        AND from_lbdi.lord_bishop_diocese_id = from_lbd.id
        
        /* We join to the to incumbency and its diocese. */
        AND to_lbdi.id = t.to_lord_bishop_diocese_incumbency_id
        AND to_lbdi.lord_bishop_diocese_id = to_lbd.id
        
        /* We join to the person on the from incumbency. */
        AND from_lbdi.person_id = p.id
        
        ORDER BY to_incumbency_year, to_incumbency_month, to_incumbency_day
      "
    )
  end
end
