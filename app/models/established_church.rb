class EstablishedChurch < ApplicationRecord
  
  def named_dioceses
    LordBishopDiocese
      .all
      .where( 'is_named_see = true' )
      .where( "established_church_id = ?", self.id )
      .order( 'most_recent_name')
  end
  
  def named_archdioceses
    LordBishopDiocese
      .all
      .where( 'is_named_see = true' )
      .where( 'is_archdiocese = true' )
      .where( "established_church_id = ?", self.id )
      .order( 'most_recent_name')
  end
  
  def named_non_archdioceses
    LordBishopDiocese
      .all
      .where( 'is_named_see = true' )
      .where( 'is_archdiocese = false' )
      .where( "established_church_id = ?", self.id )
      .order( 'most_recent_name')
  end
  
  def unnamed_dioceses
    LordBishopDiocese
      .all
      .where( 'is_named_see = false' )
      .where( "established_church_id = ?", self.id )
      .order( 'most_recent_name')
  end
end
