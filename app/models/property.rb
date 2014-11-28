class Property < ActiveRecord::Base
  belongs_to :user
  validates :user_id , presence:true 
   validates :bedrooms, presence:true ,numericality:true
   validates :bathrooms , presence:true,numericality:true
   validates :otherroom, presence:true,numericality:true
   validates :rent , presence:true ,numericality:true
   

end
