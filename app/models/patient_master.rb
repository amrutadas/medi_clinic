class PatientMaster < ActiveRecord::Base
  default_scope order('created_at DESC')
  # attr_accessible :title, :body
  self.table_name = "patient_masters"
  self.primary_key = "id"
  self.per_page = 10
  attr_accessible :name
  attr_accessible :age
  attr_accessible :sex
  attr_accessible :email
  attr_accessible :mobile
  attr_accessible :land_line
  attr_accessible :detailed_address
  attr_accessible :location
  attr_accessible :created_by

  def self.search(search,dropdown)
  if search && dropdown
    find(:all, :conditions => ["#{dropdown} LIKE ?", "%#{search}%"])
  else
    find(:all)
  end
end

end
