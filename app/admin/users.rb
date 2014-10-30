ActiveAdmin.register User do

  index do
  	column :id
  	column :name
  	column :email
  	column :uid
  	column :provider
    column :locked_at
  	default_actions
  end

  action_item only: :show do 
		
    	if user.access_locked?
    		user.unlock_access!
    	else
		user.lock_access!
	    end
    	link_to 'Lock/Unlock this User!'
   end

end
