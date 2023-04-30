class EstablishedChurchController < ApplicationController
  
  def index
    @page_title = 'Established churches'
    @established_churches = EstablishedChurch.all.order( 'name' )
  end
end
