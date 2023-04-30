class PersonController < ApplicationController
  
  def index
    @page_title = 'People'
    @people = Person.all
  end
end
