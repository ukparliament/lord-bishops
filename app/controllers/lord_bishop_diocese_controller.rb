class LordBishopDioceseController < ApplicationController
  
  def index
    @page_title = 'Lord bishop dioceses'
    @lord_bishop_dioceses = LordBishopDiocese.all.order( 'most_recent_name' )
  end
  
  def show
    lord_bishop_diocese = params[:lord_bishop_diocese]
    @lord_bishop_diocese = LordBishopDiocese.find( lord_bishop_diocese )
    @page_title = @lord_bishop_diocese.most_recent_name
  end
end
