class EstablishedChurch < ApplicationRecord
  
  def archdioceses
    LordBishopDiocese
      .all
      .where( 'is_archdiocese = true' )
      .where( 'is_named_see = true' )
      .where( "established_church_id = ?", self.id )
  end
  
  def named_dioceses
    LordBishopDiocese
      .all
      .where( 'is_archdiocese = false' )
      .where( 'is_named_see = true' )
      .where( "established_church_id = ?", self.id )
  end
  
  def other_dioceses
    LordBishopDiocese
      .all
      .where( 'is_archdiocese = false' )
      .where( 'is_named_see = false' )
      .where( "established_church_id = ?", self.id )
  end
end
