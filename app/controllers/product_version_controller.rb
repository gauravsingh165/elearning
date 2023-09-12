class ProductVersionController < ApplicationController


  def version_action
    if current_user.product_version.name == 'Paid'
    
    elsif current_user.product_version.name == 'Free trial'
     
    else
     
    end
  end
  
end
