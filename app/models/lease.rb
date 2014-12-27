# == Schema Information
#
# Table name: leases
#
#  id              :integer          not null, primary key
#  entry_date      :datetime
#  exit_date       :datetime
#  value           :float
#  lease_type_id   :integer
#  vehicle_plate   :string(255)
#  parking_user_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Lease < ActiveRecord::Base
	
	belongs_to :lease_type
	belongs_to :vehicle_owner
	belongs_to :parking_user
  validates :entry_date, :lease_type_id, :parking_user_id,:vehicle_plate, :presence => true
  
  #before_update :current_date_on_exit_date
  #after_create :one_method
  #after_create :another_method
  #after_update :one_more_method_only_for_updates

  #def current_date_on_exit_date
  #  self.exit_date = Time.now if exit_date.blank?
  #end

  #before_update do |lease| 
  #  lease.exit_date = Time.now if exit_date.blank?
  #end

  #def another_method
  #end

  #def one_more_method_only_for_updates
  #end


before_update :update_lease_value_when_date_change, :if => :exit_date_changed?

  def update_lease_value_when_date_change
    self.exit_date = Time.now if self.exit_date.blank?
    lType = LeaseType.find(self.lease_type_id)
    lTime = LeaseTime.find(lType.lease_time_id)
    segundos = self.exit_date - self.entry_date

    #self.value = (segundos / lTime.seconds.to_f)*lType.price
    if lTime.name == "hora" # 1 horas
        horas = (segundos.to_f / 60 / 60).round(1).ceil #ESTA LINEA aproxima a el entero mas proximo desde 0.1 a 1 y da unos 3 minutos para poner el varlor de la fraccion
        self.value = horas * lType.price
    #end
    else #segundos <= lTime.seconds.to_f 
      #self.value = lType.price  
  # lease.value = lType.price
    #else
      self.value = lType.price * (segundos / lTime.seconds.to_f)    
    end #ya tengo horas y segundos  
  end

after_find do |lease|
  exit_date = Time.now 
  lType = LeaseType.find(lease.lease_type_id)
  lTime = LeaseTime.find(lType.lease_time_id)
  segundos = exit_date - lease.entry_date
     #round(1) redondea la cantidad decimal a la cantidad de digitos especificado 1
     #cantidades como  2.3547868735 sera 2,4
     # 2.07 sera 2  
     # ceil redondea al float a el entero mas cercano 
     # 0.01 = 1
     # 2.3 = 3 
     #horas = (segundos.to_f / 60 / 60).round(2).ceil  ESTA LINEA aproxima a el entero mas proximo desde 0.01 a 1
     #ocea desde el momento que se crea cobra la hora o fraccion 
  if lease.value.blank?   
    if lTime.name == "hora"# 1 horas
       horas = (segundos.to_f / 60 / 60).round(1).ceil #ESTA LINEA aproxima a el entero mas proximo desde 0.1 a 1 y da unos 3 minutos para poner el varlor de la fraccion
       lease.value = horas * lType.price
    end
      lease.value = lType.price 
  end

  #lease.value = segundos#lType.price
  #elsif segundos <= lTime.seconds.to_f 
   #self.value = (segundos / lTime.seconds.to_f)*lType.price  
  # lease.value = lType.price
  #else
  #  lease.value = lType.price * (segundos / lTime.seconds.to_f)    
  #end #ya tengo horas y segundos  
end



 #once the register is initializated  (Creating a new lease) 
after_initialize do |lease|
  lease.entry_date = Time.now if entry_date.blank?
  #lease.lease_type_id = 1 if lease_type_id.blank?
end

#before_save :set_lease_value
#def set_lease_value
#  if self.exit_date.blank?
#     exit_date = Time.now if exit_date.blank?
#     lType = LeaseType.find(self.lease_type_id)
#     lTime = LeaseTime.find(lType.lease_time_id)
#     #segundos = self.exit_date - self.entry_date
#     self.value = lType.price 
# end
#end


	rails_admin do
  	configure :user do
  		visible false
  	end
  end

end

