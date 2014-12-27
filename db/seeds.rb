# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#Creating admin
admin = User.create({ name: ENV['DEFAULT_USERNAME'] , last_name: ENV['DEFAULT_LASTNAME'], phone: ENV['DEFAULT_PHONE'], email: ENV['DEFAULT_ADMIN_EMAIL'], password: ENV['DEFAULT_PASSWORD'], password_confirmation: ENV['DEFAULT_PASSWORD'], role: 'admin' })

#creating parking owners
owner = User.create({ name: 'owner' , last_name: 'lopez', phone: '3134909090', email: 'owner@mail.com', password: 'own12345', password_confirmation: 'own12345', role: 'parking_owner' })
propio = User.create({ name: 'propio' , last_name: 'etario', phone: '3005551010', email: 'propio@mail.com', password: 'pro12345', password_confirmation: 'pro12345', role: 'parking_owner' })
patron = User.create({ name: 'patrons' , last_name: 'ron', phone: '3104443030', email: 'pat@mail.com', password: 'pat12345', password_confirmation: 'pat12345', role: 'parking_owner' })
patronAvatar = User.create({ name: 'avatar' , last_name: 'aguirrrre', phone: '3202443030', email: 'avatar@mail.com', password: 'ava12345', password_confirmation: 'ava12345', role: 'parking_owner' })

#Creating Parkings
parking = Parking.create({ name: 'la40' , address: 'cra 40', email: 'la40@mail.com', phone: '3134904040', message: 'Bienvenidos atendemos de Lunes a Viernes 6 am - 9pm' })
ParkingUser.create({ user_id: owner.id , parking_id: parking.id})

parking2 = Parking.create({ name: 'la20' , address: 'cra 20', email: 'la20@mail.com', phone: '3134902020', message: 'Horario Lunes-Domingo 6am-10pm' })
ParkingUser.create({ user_id: owner.id , parking_id: parking2.id})

parking3 = Parking.create({ name: 'parkingpark' , address: 'cra 10', email: 'parkingpark@mail.com', phone: '3134005050', message: 'Atendemos las 24 Horas' })
ParkingUser.create({ user_id: propio.id , parking_id: parking3.id})

parking4 = Parking.create({ name: 'parkingZon' , address: 'cra parking 10', email: 'parkingzon@mail.com', phone: '3002001010', message: 'Servicio las 24 Horas' })
ParkingUser.create({ user_id: patron.id , parking_id: parking4.id})

parking5 = Parking.create({ name: 'parkingAvatar88' , address: 'cra avatar 88', email: 'parkingavatar88@mail.com', phone: '3882881810', message: 'Servicio las 24 Horas atendidos por un Avatar' })
ParkingUser.create({ user_id: patronAvatar.id , parking_id: parking5.id})


#Creating Employees
employee = User.create({ name: 'emporio' , last_name: 'duran', phone: '3124997755', email: 'emporio@mail.com', password: 'emp12345', password_confirmation: 'emp12345', role: 'employee' })
ParkingUser.create({ user_id: employee.id , parking_id: parking.id})

employee2 = User.create({ name: 'julio' , last_name: 'lopez', phone: '3104907474', email: 'julio@mail.com', password: 'jul12345', password_confirmation: 'jul12345', role: 'employee' })
ParkingUser.create({ user_id: employee2.id , parking_id: parking.id})

employee3 = User.create({ name: 'felipe' , last_name: 'calderon', phone: '3201907710', email: 'felipe@mail.com', password: 'fel12345', password_confirmation: 'fel12345', role: 'employee' })
ParkingUser.create({ user_id: employee3.id, parking_id: parking2.id})

employee4 = User.create({ name: 'carlos' , last_name: 'cuesta', phone: '3157803320', email: 'carlos@mail.com', password: 'car12345', password_confirmation: 'car12345', role: 'employee' })
ParkingUser.create({ user_id: employee4.id, parking_id: parking3.id})

employee5 = User.create({ name: 'benito' , last_name: 'camelas', phone: '3267134466', email: 'benito@mail.com', password: 'ben12345', password_confirmation: 'ben12345', role: 'employee' })
ParkingUser.create({ user_id: employee5.id, parking_id: parking4.id})
ParkingUser.create({ user_id: employee5.id, parking_id: parking3.id})

#Creating seconds proportion
hora = LeaseTime.create({ name: 'hora' , seconds: '3600'})
dia = LeaseTime.create({ name: 'dia' , seconds: '86400'})
semana = LeaseTime.create({ name: 'semana' , seconds: '604800'})
quincena = LeaseTime.create({ name: 'quincena' , seconds: '9072000'})
mes = LeaseTime.create({ name: 'mes' , seconds: '18144000'})

#Creating Vehicle types
VehicleType.create([{name: 'Moto'},
					{name: 'Carro particular'},
					{name: 'Taxy'},
					{name: 'Buseta'},
					{name: 'Camion'},
					{name: 'Tractomula'},
					{name: 'Maquinaria pesada'}])


#Creating Leases types  #per hour 
LeaseType.create([{name: 'Hora o fraccion Moto',price: '500',vehicle_type_id:'1', parking_id: parking.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Carro',price: '1000',vehicle_type_id:'2', parking_id: parking.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Moto',price: '300',vehicle_type_id:'1', parking_id: parking2.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Carro',price: '700',vehicle_type_id:'2', parking_id: parking2.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Moto',price: '400',vehicle_type_id:'1', parking_id: parking3.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Carro',price: '800',vehicle_type_id:'2', parking_id: parking3.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Moto',price: '1000',vehicle_type_id:'1', parking_id: parking4.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Carro',price: '1200',vehicle_type_id:'2', parking_id: parking4.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Moto',price: '1000',vehicle_type_id:'1', parking_id: parking5.id, lease_time_id: hora.id},
				{name: 'Hora o fraccion Carro',price: '3000',vehicle_type_id:'2', parking_id: parking5.id, lease_time_id: hora.id},
				#Weekly
				{name: 'Semanal Moto',price: '8000',vehicle_type_id:'1', parking_id: parking.id, lease_time_id: semana.id},
				{name: 'Semanal Carro particular',price: '10000',vehicle_type_id:'2', parking_id: parking.id, lease_time_id: semana.id},
				{name: 'Semanal Taxy',price: '12000',vehicle_type_id:'3', parking_id: parking.id, lease_time_id: semana.id},
				{name: 'Semanal Buseta',price: '15000',vehicle_type_id:'4', parking_id: parking.id, lease_time_id: semana.id},
				{name: 'Semanal Camion',price: '17000',vehicle_type_id:'5', parking_id: parking.id, lease_time_id: semana.id},
				{name: 'Semanal Tractomula',price: '20000',vehicle_type_id:'6', parking_id: parking.id, lease_time_id: semana.id},
				{name: 'Semanal Maquinaria pesada',price: '22000',vehicle_type_id:'7', parking_id: parking.id, lease_time_id: semana.id},
				{name: 'Semanal Moto',price: '5000',vehicle_type_id:'1', parking_id: parking2.id, lease_time_id: semana.id},
				{name: 'Semanal Carro particular',price: '7000',vehicle_type_id:parking2.id, parking_id: parking2.id, lease_time_id: semana.id},
				{name: 'Semanal Taxy',price: '15000',vehicle_type_id:'3', parking_id: parking2.id, lease_time_id: semana.id},
				{name: 'Semanal Buseta',price: '20000',vehicle_type_id:'4', parking_id: parking2.id, lease_time_id: semana.id},
				{name: 'Semanal Camion',price: '22000',vehicle_type_id:'5', parking_id: parking2.id, lease_time_id: semana.id},
				{name: 'Semanal Tractomula',price: '25000',vehicle_type_id:'6', parking_id: parking2.id, lease_time_id: semana.id},
				{name: 'Semanal Maquinaria pesada',price: '30000',vehicle_type_id:'7', parking_id: parking2.id, lease_time_id: semana.id},
				{name: 'Semanal Moto',price: '10000',vehicle_type_id:'1', parking_id: parking3.id, lease_time_id: semana.id},
				{name: 'Semanal Carro particular',price: '12000',vehicle_type_id:'2', parking_id: parking3.id, lease_time_id: semana.id},
				{name: 'Semanal Taxy',price: '14000',vehicle_type_id:parking3.id, parking_id: parking3.id, lease_time_id: semana.id},
				{name: 'Semanal Buseta',price: '16000',vehicle_type_id:'4', parking_id: parking3.id, lease_time_id: semana.id},
				{name: 'Semanal Camion',price: '18000',vehicle_type_id:'5', parking_id: parking3.id, lease_time_id: semana.id},
				{name: 'Semanal Tractomula',price: '20000',vehicle_type_id:'6', parking_id: parking3.id, lease_time_id: semana.id},
				{name: 'Semanal Maquinaria pesada',price: '22000',vehicle_type_id:'7', parking_id: parking3.id, lease_time_id: semana.id},
				{name: 'Semanal Moto',price: '10000',vehicle_type_id:'1', parking_id: parking4.id, lease_time_id: semana.id},
				{name: 'Semanal Carro particular',price: '15000',vehicle_type_id:'2', parking_id: parking4.id, lease_time_id: semana.id},
				{name: 'Semanal Taxy',price: '20000',vehicle_type_id:'3', parking_id: parking4.id, lease_time_id: semana.id},
				{name: 'Semanal Buseta',price: '25000',vehicle_type_id:parking4.id, parking_id: parking4.id, lease_time_id: semana.id},
				{name: 'Semanal Camion',price: '30000',vehicle_type_id:'5', parking_id: parking4.id, lease_time_id: semana.id},
				{name: 'Semanal Tractomula',price: '35000',vehicle_type_id:'6', parking_id: parking4.id, lease_time_id: semana.id},
				{name: 'Semanal Maquinaria pesada',price: '40000',vehicle_type_id:'7', parking_id: parking4.id, lease_time_id: semana.id},
				#fortnightly
				{name: 'Quincenal Moto',price: '15000',vehicle_type_id:'1', parking_id: parking.id, lease_time_id: quincena.id},
				{name: 'Quincenal Carro particular',price: '18000',vehicle_type_id:'2', parking_id: parking.id, lease_time_id: quincena.id},
				{name: 'Quincenal Taxy',price: '20000',vehicle_type_id:'3', parking_id: parking.id, lease_time_id: quincena.id},
				{name: 'Quincenal Buseta',price: '28000',vehicle_type_id:'4', parking_id: parking.id, lease_time_id: quincena.id},
				{name: 'Quincenal Camion',price: '30000',vehicle_type_id:'5', parking_id: parking.id, lease_time_id: quincena.id},
				{name: 'Quincenal Tractomula',price: '36000',vehicle_type_id:'6', parking_id: parking.id, lease_time_id: quincena.id},
				{name: 'Quincenal Maquinaria pesada',price: '40000',vehicle_type_id:'7', parking_id: parking.id, lease_time_id: quincena.id},
				{name: 'Quincenal Moto',price: '10000',vehicle_type_id:'1', parking_id: parking2.id, lease_time_id: quincena.id},
				{name: 'Quincenal Carro particular',price: '15000',vehicle_type_id:parking2.id, parking_id: parking2.id, lease_time_id: quincena.id},
				{name: 'Quincenal Taxy',price: '20000',vehicle_type_id:'3', parking_id: parking2.id, lease_time_id: quincena.id},
				{name: 'Quincenal Buseta',price: '25000',vehicle_type_id:'4', parking_id: parking2.id, lease_time_id: quincena.id},
				{name: 'Quincenal Camion',price: '30000',vehicle_type_id:'5', parking_id: parking2.id, lease_time_id: quincena.id},
				{name: 'Quincenal Tractomula',price: '35000',vehicle_type_id:'6', parking_id: parking2.id, lease_time_id: quincena.id},
				{name: 'Quincenal Maquinaria pesada',price: '45000',vehicle_type_id:'7', parking_id: parking2.id, lease_time_id: quincena.id},
				{name: 'Quincenal Moto',price: '17000',vehicle_type_id:'1', parking_id: parking3.id, lease_time_id: quincena.id},
				{name: 'Quincenal Carro particular',price: '20000',vehicle_type_id:'2', parking_id: parking3.id, lease_time_id: quincena.id},
				{name: 'Quincenal Taxy',price: '24000',vehicle_type_id:parking3.id, parking_id: parking3.id, lease_time_id: quincena.id},
				{name: 'Quincenal Buseta',price: '28000',vehicle_type_id:'4', parking_id: parking3.id, lease_time_id: quincena.id},
				{name: 'Quincenal Camion',price: '30000',vehicle_type_id:'5', parking_id: parking3.id, lease_time_id: quincena.id},
				{name: 'Quincenal Tractomula',price: '32000',vehicle_type_id:'6', parking_id: parking3.id, lease_time_id: quincena.id},
				{name: 'Quincenal Maquinaria pesada',price: '34000',vehicle_type_id:'7', parking_id: parking3.id, lease_time_id: quincena.id},
				{name: 'Quincenal Moto',price: '18000',vehicle_type_id:'1', parking_id: parking4.id, lease_time_id: quincena.id},
				{name: 'Quincenal Carro particular',price: '22000',vehicle_type_id:'2', parking_id: parking4.id, lease_time_id: quincena.id},
				{name: 'Quincenal Taxy',price: '23000',vehicle_type_id:'3', parking_id: parking4.id, lease_time_id: quincena.id},
				{name: 'Quincenal Buseta',price: '30000',vehicle_type_id:parking4.id, parking_id: parking4.id, lease_time_id: quincena.id},
				{name: 'Quincenal Camion',price: '32000',vehicle_type_id:'5', parking_id: parking4.id, lease_time_id: quincena.id},
				{name: 'Quincenal Tractomula',price: '38000',vehicle_type_id:'6', parking_id: parking4.id, lease_time_id: quincena.id},
				{name: 'Quincenal Maquinaria pesada',price: '40000',vehicle_type_id:'7', parking_id: parking4.id, lease_time_id: quincena.id},
				#monthly
				{name: 'Mensual Moto',price: '20000',vehicle_type_id:'1', parking_id: parking.id, lease_time_id: mes.id},
				{name: 'Mensual Carro particular',price: '30000',vehicle_type_id:'2', parking_id: parking.id, lease_time_id: mes.id},
				{name: 'Mensual Taxy',price: '35000',vehicle_type_id:'3', parking_id: parking.id, lease_time_id: mes.id},
				{name: 'Mensual Buseta',price: '50000',vehicle_type_id:'4', parking_id: parking.id, lease_time_id: mes.id},
				{name: 'Mensual Camion',price: '60000',vehicle_type_id:'5', parking_id: parking.id, lease_time_id: mes.id},
				{name: 'Mensual Tractomula',price: '70000',vehicle_type_id:'6', parking_id: parking.id, lease_time_id: mes.id},
				{name: 'Mensual Maquinaria pesada',price: '80000',vehicle_type_id:'7', parking_id:parking.id, lease_time_id: mes.id},
				{name: 'Mensual Moto',price: '25000',vehicle_type_id:'1', parking_id: parking2.id, lease_time_id: mes.id},
				{name: 'Mensual Carro particular',price: '35000',vehicle_type_id:'2', parking_id: parking2.id, lease_time_id: mes.id},
				{name: 'Mensual Taxy',price: '40000',vehicle_type_id:'3', parking_id: parking2.id, lease_time_id: mes.id},
				{name: 'Mensual Buseta',price: '55000',vehicle_type_id:'4', parking_id: parking2.id, lease_time_id: mes.id},
				{name: 'Mensual Camion',price: '60000',vehicle_type_id:'5', parking_id: parking2.id, lease_time_id: mes.id},
				{name: 'Mensual Tractomula',price: '65000',vehicle_type_id:'6', parking_id: parking2.id, lease_time_id: mes.id},
				{name: 'Mensual Maquinaria pesada',price: '70000',vehicle_type_id:'7', parking_id:parking2.id, lease_time_id: mes.id},
				{name: 'Mensual Moto',price: '30000',vehicle_type_id:'1', parking_id: parking3.id, lease_time_id: mes.id},
				{name: 'Mensual Carro particular',price: '40000',vehicle_type_id:'2', parking_id: parking3.id, lease_time_id: mes.id},
				{name: 'Mensual Taxy',price: '50000',vehicle_type_id:'3', parking_id: parking3.id, lease_time_id: mes.id},
				{name: 'Mensual Buseta',price: '60000',vehicle_type_id:'4', parking_id: parking3.id, lease_time_id: mes.id},
				{name: 'Mensual Camion',price: '70000',vehicle_type_id:'5', parking_id: parking3.id, lease_time_id: mes.id},
				{name: 'Mensual Tractomula',price: '80000',vehicle_type_id:'6', parking_id: parking3.id, lease_time_id: mes.id},
				{name: 'Mensual Maquinaria pesada',price: '90000',vehicle_type_id:'7', parking_id:parking3.id, lease_time_id: mes.id},
				{name: 'Mensual Moto',price: '30000',vehicle_type_id:'1', parking_id: parking4.id, lease_time_id: mes.id},
				{name: 'Mensual Carro particular',price: '45000',vehicle_type_id:'2', parking_id: parking4.id, lease_time_id: mes.id},
				{name: 'Mensual Taxy',price: '50000',vehicle_type_id:'3', parking_id: parking4.id, lease_time_id: mes.id},
				{name: 'Mensual Buseta',price: '65000',vehicle_type_id:'4', parking_id: parking4.id, lease_time_id: mes.id},
				{name: 'Mensual Camion',price: '75000',vehicle_type_id:'5', parking_id: parking4.id, lease_time_id: mes.id},
				{name: 'Mensual Tractomula',price: '85000',vehicle_type_id:'6', parking_id: parking4.id, lease_time_id: mes.id},
				{name: 'Mensual Maquinaria pesada',price: '95000',vehicle_type_id:'7', parking_id: parking4.id, lease_time_id: mes.id}])
#TODO: seed the vehicle, vihicle_owner
