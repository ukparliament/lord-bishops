class LordBishopDioceseIncumbencyEndReasonController < ApplicationController
  
  def index
    @page_title = 'Lord bishop diocese incumbency end reasons'
    @lord_bishop_diocese_incumbency_end_reasons = LordBishopDioceseIncumbencyEndReason.all.order( 'reason' )
  end
  
  def show
    lord_bishop_diocese_incumbency_end_reason = params[:lord_bishop_diocese_incumbency_end_reason]
    @lord_bishop_diocese_incumbency_end_reason = LordBishopDioceseIncumbencyEndReason.find( lord_bishop_diocese_incumbency_end_reason )
    @page_title = "Lord bishop diocese incumbency end reasons - #{@lord_bishop_diocese_incumbency_end_reason.reason}"
  end
end
