module OrganizersHelper
  
  def organizer?
    self.organizer == true
  end
  
  def organizer_check
    redirect_to root_path if !current_user || !current_user.organizer?
  end
end