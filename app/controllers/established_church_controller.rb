class EstablishedChurchController < ApplicationController
  
  def index
    @page_title = 'Established churches'
    @established_churches = EstablishedChurch.all.order( 'name' )
  end
  
  def show
    established_church = params[:established_church]
    @established_church = EstablishedChurch.find( established_church )
    @page_title = @established_church.name
  end
end
