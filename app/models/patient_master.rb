class PatientMaster < ActiveRecord::Base
  default_scope order('created_at DESC')
  # attr_accessible :title, :body
  self.table_name = "patient_masters"
  self.primary_key = "id"
  self.per_page = 10
  attr_accessible :name,  :case_sensitive => false
  attr_accessible :age
  attr_accessible :sex
  attr_accessible :email
  attr_accessible :mobile
  attr_accessible :land_line
  attr_accessible :detailed_address
  attr_accessible :location
  attr_accessible :created_by
 # validates_uniqueness_of :name, :case_sensitive => false

  def self.search(search,dropdown)
  if search && dropdown
    if (dropdown=='mobile' || dropdown=='landline')
      find(:all, :conditions => ["#{dropdown} LIKE ?", "#{search}%"])
    else
      find(:all, :conditions => ["lower(#{dropdown}) LIKE ?", "%#{search}%"])
    end
    
  else
    find(:all)
  end
end

end
