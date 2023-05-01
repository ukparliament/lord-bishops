class PersonController < ApplicationController
  
  def index
    @page_title = 'People'
    @people = Person.all.order( 'surname' ).order( 'forenames' )
  end
  
  def show
    person = params[:person]
    @person = Person.find( person )
    @page_title = @person.display_name
  end
end
