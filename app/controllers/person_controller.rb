class PersonController < ApplicationController
  
  def index
    @page_title = 'People'
    @people = Person.all.order( 'surname' ).order( 'forenames' )
  end
end
