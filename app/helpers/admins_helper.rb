module AdminsHelper
  
  def admin?
    self.admin == true
  end
  
  def admin_check
    redirect_to root_path if !current_user.admin?
  end
end