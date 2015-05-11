class Users::SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "users/sessions#failure")
    return sign_in_and_redirect(resource_name, resource)
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render json: {:success => true, :message => "success"}, status: 200
  end
 
  def failure
    return render json: {:success => false, :message => "failed"}, status: 400
  end

  def destroy
    signed_out = sign_out(resource_name)
    render json: {:success => true, :message => "logged out"}
  end
end
