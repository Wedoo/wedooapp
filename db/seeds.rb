# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = %w[ong admin].map{ |symbol| [symbol.to_sym,Role.find_or_create_by(symbol: symbol)] }
roles = Hash[roles]

user_ong = User.find_or_create_by(email: '2020@wedoo.cl') do |u|
  u.password = "12345678"
  u.role = roles[:ong]
  u.confirmed_at = Date.today
end
user_admin = User.find_or_create_by(email: 'awesome_admin@wedoo.cl') do |u|
  u.password = "12345678"
  u.role = roles[:admin]
  u.confirmed_at = Date.today
end

# Comunas con sus respectivas divisiones electorales
Municipality.create(name: "Arica", district: 1, circunscription: 1)
Municipality.create(name: "Camarones", district: 1, circunscription: 1)
Municipality.create(name: "General Lagos", district: 1, circunscription: 1)
Municipality.create(name: "Putre", district: 1, circunscription: 1)
Municipality.create(name: "Alto Hospicio", district: 2, circunscription: 1)
Municipality.create(name: "Camiña", district: 2, circunscription: 1)
Municipality.create(name: "Colchane", district: 2, circunscription: 1)
Municipality.create(name: "Huara", district: 2, circunscription: 1)
Municipality.create(name: "Iquique", district: 2, circunscription: 1)
Municipality.create(name: "Pica", district: 2, circunscription: 1)
Municipality.create(name: "Pozo Almonte", district: 2, circunscription: 1)
Municipality.create(name: "Calama", district: 3, circunscription: 2)
Municipality.create(name: "María Elena", district: 3, circunscription: 2)
Municipality.create(name: "Ollagüe", district: 3, circunscription: 2)
Municipality.create(name: "San Pedro de Atacama", district: 3, circunscription: 2)
Municipality.create(name: "Tocopilla", district: 3, circunscription: 2)
Municipality.create(name: "Antofagasta", district: 4, circunscription: 2)
Municipality.create(name: "Mejillones", district: 4, circunscription: 2)
Municipality.create(name: "Sierra Gorda", district: 4, circunscription: 2)
Municipality.create(name: "Taltal", district: 4, circunscription: 2)
Municipality.create(name: "Chañaral", district: 5, circunscription: 3)
Municipality.create(name: "Copiapó", district: 5, circunscription: 3)
Municipality.create(name: "Diego de Almagro", district: 5, circunscription: 3)
Municipality.create(name: "Alto del Carmen", district: 6, circunscription: 3)
Municipality.create(name: "Caldera", district: 6, circunscription: 3)
Municipality.create(name: "Huasco", district: 6, circunscription: 3)
Municipality.create(name: "Freirina", district: 6, circunscription: 3)
Municipality.create(name: "Tierra Amarilla", district: 6, circunscription: 3)
Municipality.create(name: "Vallenar", district: 6, circunscription: 3)
Municipality.create(name: "Andacollo", district: 7, circunscription: 4)
Municipality.create(name: "La Higuera", district: 7, circunscription: 4)
Municipality.create(name: "La Serena", district: 7, circunscription: 4)
Municipality.create(name: "Paihuano", district: 7, circunscription: 4)
Municipality.create(name: "Vicuña", district: 7, circunscription: 4)
Municipality.create(name: "Coquimbo", district: 8, circunscription: 4)
Municipality.create(name: "Ovalle", district: 8, circunscription: 4)
Municipality.create(name: "Río Hurtado", district: 8, circunscription: 4)
Municipality.create(name: "Canela", district: 9, circunscription: 4)
Municipality.create(name: "Combarbalá", district: 9, circunscription: 4)
Municipality.create(name: "Illapel", district: 9, circunscription: 4)
Municipality.create(name: "Los Vilos", district: 9, circunscription: 4)
Municipality.create(name: "Monte Patria", district: 9, circunscription: 4)
Municipality.create(name: "Punitaqui", district: 9, circunscription: 4)
Municipality.create(name: "Salamanca", district: 9, circunscription: 4)
Municipality.create(name: "Cabildo", district: 10, circunscription: 5)
Municipality.create(name: "La Calera", district: 10, circunscription: 5)
Municipality.create(name: "Hijuelas", district: 10, circunscription: 5)
Municipality.create(name: "La Cruz", district: 10, circunscription: 5)
Municipality.create(name: "La Ligua", district: 10, circunscription: 5)
Municipality.create(name: "Nogales", district: 10, circunscription: 5)
Municipality.create(name: "Papudo", district: 10, circunscription: 5)
Municipality.create(name: "Petorca", district: 10, circunscription: 5)
Municipality.create(name: "Puchuncaví", district: 10, circunscription: 5)
Municipality.create(name: "Quillota", district: 10, circunscription: 5)
Municipality.create(name: "Quintero", district: 10, circunscription: 5)
Municipality.create(name: "Zapallar", district: 10, circunscription: 5)
Municipality.create(name: "Calle Larga", district: 11, circunscription: 5)
Municipality.create(name: "Catemu", district: 11, circunscription: 5)
Municipality.create(name: "Llaillay", district: 11, circunscription: 5)
Municipality.create(name: "Los Andes", district: 11, circunscription: 5)
Municipality.create(name: "Panquehue", district: 11, circunscription: 5)
Municipality.create(name: "Putaendo", district: 11, circunscription: 5)
Municipality.create(name: "Rinconada", district: 11, circunscription: 5)
Municipality.create(name: "San Esteban", district: 11, circunscription: 5)
Municipality.create(name: "San Felipe", district: 11, circunscription: 5)
Municipality.create(name: "Santa María", district: 11, circunscription: 5)
Municipality.create(name: "Limache", district: 12, circunscription: 5)
Municipality.create(name: "Olmué", district: 12, circunscription: 5)
Municipality.create(name: "Quilpué", district: 12, circunscription: 5)
Municipality.create(name: "Villa Alemana", district: 12, circunscription: 5)
Municipality.create(name: "Isla de Pascua", district: 13, circunscription: 6)
Municipality.create(name: "Juan Fernández", district: 13, circunscription: 6)
Municipality.create(name: "Valparaíso", district: 13, circunscription: 6)
Municipality.create(name: "Concón", district: 14, circunscription: 6)
Municipality.create(name: "Viña del Mar", district: 14, circunscription: 6)
Municipality.create(name: "Algarrobo", district: 15, circunscription: 6)
Municipality.create(name: "Cartagena", district: 15, circunscription: 6)
Municipality.create(name: "Casablanca", district: 15, circunscription: 6)
Municipality.create(name: "El Quisco", district: 15, circunscription: 6)
Municipality.create(name: "El Tabo", district: 15, circunscription: 6)
Municipality.create(name: "San Antonio", district: 15, circunscription: 6)
Municipality.create(name: "Santo Domingo", district: 15, circunscription: 6)
Municipality.create(name: "Colina", district: 16, circunscription: 7)
Municipality.create(name: "Lampa", district: 16, circunscription: 7)
Municipality.create(name: "Quilicura", district: 16, circunscription: 7)
Municipality.create(name: "Pudahuel", district: 16, circunscription: 7)
Municipality.create(name: "Tiltil", district: 16, circunscription: 7)
Municipality.create(name: "Conchalí", district: 17, circunscription: 7)
Municipality.create(name: "Huechuraba", district: 17, circunscription: 7)
Municipality.create(name: "Renca", district: 17, circunscription: 7)
Municipality.create(name: "Cerro Navia", district: 18, circunscription: 7)
Municipality.create(name: "Lo Prado", district: 18, circunscription: 7)
Municipality.create(name: "Quinta Normal", district: 18, circunscription: 7)
Municipality.create(name: "Independencia", district: 19, circunscription: 7)
Municipality.create(name: "Recoleta", district: 19, circunscription: 7)
Municipality.create(name: "Cerrillos", district: 20, circunscription: 7)
Municipality.create(name: "Estación Central", district: 20, circunscription: 7)
Municipality.create(name: "Maipú", district: 20, circunscription: 7)
Municipality.create(name: "Santiago", district: 22, circunscription: 7)
Municipality.create(name: "Buin", district: 30, circunscription: 7)
Municipality.create(name: "Calera de Tango", district: 30, circunscription: 7)
Municipality.create(name: "Paine", district: 30, circunscription: 7)
Municipality.create(name: "San Bernardo", district: 30, circunscription: 7)
Municipality.create(name: "Alhué", district: 31, circunscription: 7)
Municipality.create(name: "Curacaví", district: 31, circunscription: 7)
Municipality.create(name: "El Monte", district: 31, circunscription: 7)
Municipality.create(name: "Isla de Maipo", district: 31, circunscription: 7)
Municipality.create(name: "María Pinto", district: 31, circunscription: 7)
Municipality.create(name: "Melipilla", district: 31, circunscription: 7)
Municipality.create(name: "Padre Hurtado", district: 31, circunscription: 7)
Municipality.create(name: "Peñaflor", district: 31, circunscription: 7)
Municipality.create(name: "San Pedro", district: 31, circunscription: 7)
Municipality.create(name: "Talagante", district: 31, circunscription: 7)
Municipality.create(name: "Ñuñoa", district: 21, circunscription: 8)
Municipality.create(name: "Providencia", district: 21, circunscription: 8)
Municipality.create(name: "Las Condes", district: 23, circunscription: 8)
Municipality.create(name: "Lo Barnechea", district: 23, circunscription: 8)
Municipality.create(name: "Vitacura", district: 23, circunscription: 8)
Municipality.create(name: "La Reina", district: 24, circunscription: 8)
Municipality.create(name: "Peñalolén", district: 24, circunscription: 8)
Municipality.create(name: "La Granja", district: 25, circunscription: 8)
Municipality.create(name: "Macul", district: 25, circunscription: 8)
Municipality.create(name: "San Joaquín", district: 25, circunscription: 8)
Municipality.create(name: "La Florida", district: 26, circunscription: 8)
Municipality.create(name: "El Bosque", district: 27, circunscription: 8)
Municipality.create(name: "La Cisterna", district: 27, circunscription: 8)
Municipality.create(name: "San Ramón", district: 27, circunscription: 8)
Municipality.create(name: "Lo Espejo", district: 28, circunscription: 8)
Municipality.create(name: "Pedro Aguirre Cerda", district: 28, circunscription: 8)
Municipality.create(name: "San Miguel", district: 28, circunscription: 8)
Municipality.create(name: "La Pintana", district: 29, circunscription: 8)
Municipality.create(name: "Pirque", district: 29, circunscription: 8)
Municipality.create(name: "Puente Alto", district: 29, circunscription: 8)
Municipality.create(name: "San José de Maipo", district: 29, circunscription: 8)
Municipality.create(name: "Rancagua", district: 32, circunscription: 9)
Municipality.create(name: "Codegua", district: 33, circunscription: 9)
Municipality.create(name: "Coínco", district: 33, circunscription: 9)
Municipality.create(name: "Coltauco", district: 33, circunscription: 9)
Municipality.create(name: "Doñihue", district: 33, circunscription: 9)
Municipality.create(name: "Graneros", district: 33, circunscription: 9)
Municipality.create(name: "Machalí", district: 33, circunscription: 9)
Municipality.create(name: "Malloa", district: 33, circunscription: 9)
Municipality.create(name: "Mostazal", district: 33, circunscription: 9)
Municipality.create(name: "Olivar", district: 33, circunscription: 9)
Municipality.create(name: "Quinta de Tilcoco", district: 33, circunscription: 9)
Municipality.create(name: "Rengo", district: 33, circunscription: 9)
Municipality.create(name: "Requínoa", district: 33, circunscription: 9)
Municipality.create(name: "Chimbarongo", district: 34, circunscription: 9)
Municipality.create(name: "Las Cabras", district: 34, circunscription: 9)
Municipality.create(name: "Peumo", district: 34, circunscription: 9)
Municipality.create(name: "Pichidegua", district: 34, circunscription: 9)
Municipality.create(name: "San Fernando", district: 34, circunscription: 9)
Municipality.create(name: "San Vicente", district: 34, circunscription: 9)
Municipality.create(name: "Chépica", district: 35, circunscription: 9)
Municipality.create(name: "La Estrella", district: 35, circunscription: 9)
Municipality.create(name: "Litueche", district: 35, circunscription: 9)
Municipality.create(name: "Lolol", district: 35, circunscription: 9)
Municipality.create(name: "Marchihue", district: 35, circunscription: 9)
Municipality.create(name: "Nancagua", district: 35, circunscription: 9)
Municipality.create(name: "Navidad", district: 35, circunscription: 9)
Municipality.create(name: "Palmilla", district: 35, circunscription: 9)
Municipality.create(name: "Paredones", district: 35, circunscription: 9)
Municipality.create(name: "Peralillo", district: 35, circunscription: 9)
Municipality.create(name: "Pichilemu", district: 35, circunscription: 9)
Municipality.create(name: "Placilla", district: 35, circunscription: 9)
Municipality.create(name: "Pumanque", district: 35, circunscription: 9)
Municipality.create(name: "Santa Cruz", district: 35, circunscription: 9)
Municipality.create(name: "Curicó", district: 36, circunscription: 10)
Municipality.create(name: "Hualañé", district: 36, circunscription: 10)
Municipality.create(name: "Licantén", district: 36, circunscription: 10)
Municipality.create(name: "Molina", district: 36, circunscription: 10)
Municipality.create(name: "Rauco", district: 36, circunscription: 10)
Municipality.create(name: "Romeral", district: 36, circunscription: 10)
Municipality.create(name: "Sagrada Familia", district: 36, circunscription: 10)
Municipality.create(name: "Teno", district: 36, circunscription: 10)
Municipality.create(name: "Vichuquén", district: 36, circunscription: 10)
Municipality.create(name: "Talca", district: 37, circunscription: 10)
Municipality.create(name: "Constitución", district: 38, circunscription: 10)
Municipality.create(name: "Curepto", district: 38, circunscription: 10)
Municipality.create(name: "Empedrado", district: 38, circunscription: 10)
Municipality.create(name: "Maule", district: 38, circunscription: 10)
Municipality.create(name: "Pelarco", district: 38, circunscription: 10)
Municipality.create(name: "Pencahue", district: 38, circunscription: 10)
Municipality.create(name: "Río Claro", district: 38, circunscription: 10)
Municipality.create(name: "San Clemente", district: 38, circunscription: 10)
Municipality.create(name: "San Rafael", district: 38, circunscription: 10)
Municipality.create(name: "Colbún", district: 39, circunscription: 11)
Municipality.create(name: "Linares", district: 39, circunscription: 11)
Municipality.create(name: "San Javier", district: 39, circunscription: 11)
Municipality.create(name: "Villa Alegre", district: 39, circunscription: 11)
Municipality.create(name: "Yerbas Buenas", district: 39, circunscription: 11)
Municipality.create(name: "Cauquenes", district: 40, circunscription: 11)
Municipality.create(name: "Chanco", district: 40, circunscription: 11)
Municipality.create(name: "Longaví", district: 40, circunscription: 11)
Municipality.create(name: "Parral", district: 40, circunscription: 11)
Municipality.create(name: "Pelluhue", district: 40, circunscription: 11)
Municipality.create(name: "Retiro", district: 40, circunscription: 11)
Municipality.create(name: "Bulnes", district: 42, circunscription: 12)
Municipality.create(name: "Cabrero", district: 42, circunscription: 12)
Municipality.create(name: "Cobquecura", district: 42, circunscription: 12)
Municipality.create(name: "Coelemu", district: 42, circunscription: 12)
Municipality.create(name: "Ñiquén", district: 42, circunscription: 12)
Municipality.create(name: "Portezuelo", district: 42, circunscription: 12)
Municipality.create(name: "Quillón", district: 42, circunscription: 12)
Municipality.create(name: "Quirihue", district: 42, circunscription: 12)
Municipality.create(name: "Ninhue", district: 42, circunscription: 12)
Municipality.create(name: "Ránquil", district: 42, circunscription: 12)
Municipality.create(name: "San Carlos", district: 42, circunscription: 12)
Municipality.create(name: "San Fabián", district: 42, circunscription: 12)
Municipality.create(name: "San Nicolás", district: 42, circunscription: 12)
Municipality.create(name: "Treguaco", district: 42, circunscription: 12)
Municipality.create(name: "Yumbel", district: 42, circunscription: 12)
Municipality.create(name: "Hualpén", district: 43, circunscription: 12)
Municipality.create(name: "Talcahuano", district: 43, circunscription: 12)
Municipality.create(name: "Chiguayante", district: 44, circunscription: 12)
Municipality.create(name: "Concepción", district: 44, circunscription: 12)
Municipality.create(name: "San Pedro de la Paz", district: 44, circunscription: 12)
Municipality.create(name: "Coronel", district: 45, circunscription: 12)
Municipality.create(name: "Florida", district: 45, circunscription: 12)
Municipality.create(name: "Hualqui", district: 45, circunscription: 12)
Municipality.create(name: "Penco", district: 45, circunscription: 12)
Municipality.create(name: "Santa Juana", district: 45, circunscription: 12)
Municipality.create(name: "Tomé", district: 45, circunscription: 12)
Municipality.create(name: "Chillán", district: 41, circunscription: 13)
Municipality.create(name: "Chillán Viejo", district: 41, circunscription: 13)
Municipality.create(name: "Coihueco", district: 41, circunscription: 13)
Municipality.create(name: "El Carmen", district: 41, circunscription: 13)
Municipality.create(name: "Pemuco", district: 41, circunscription: 13)
Municipality.create(name: "Pinto", district: 41, circunscription: 13)
Municipality.create(name: "San Ignacio", district: 41, circunscription: 13)
Municipality.create(name: "Yungay", district: 41, circunscription: 13)
Municipality.create(name: "Arauco", district: 46, circunscription: 13)
Municipality.create(name: "Cañete", district: 46, circunscription: 13)
Municipality.create(name: "Contulmo", district: 46, circunscription: 13)
Municipality.create(name: "Curanilahue", district: 46, circunscription: 13)
Municipality.create(name: "Los Álamos", district: 46, circunscription: 13)
Municipality.create(name: "Lebu", district: 46, circunscription: 13)
Municipality.create(name: "Lota", district: 46, circunscription: 13)
Municipality.create(name: "Tirúa", district: 46, circunscription: 13)
Municipality.create(name: "Alto Biobío", district: 47, circunscription: 13)
Municipality.create(name: "Antuco", district: 47, circunscription: 13)
Municipality.create(name: "Laja", district: 47, circunscription: 13)
Municipality.create(name: "Los Ángeles", district: 47, circunscription: 13)
Municipality.create(name: "Mulchén", district: 47, circunscription: 13)
Municipality.create(name: "Nacimiento", district: 47, circunscription: 13)
Municipality.create(name: "Negrete", district: 47, circunscription: 13)
Municipality.create(name: "Quilaco", district: 47, circunscription: 13)
Municipality.create(name: "Quilleco", district: 47, circunscription: 13)
Municipality.create(name: "San Rosendo", district: 47, circunscription: 13)
Municipality.create(name: "Santa Bárbara", district: 47, circunscription: 13)
Municipality.create(name: "Tucapel", district: 47, circunscription: 13)
Municipality.create(name: "Angol", district: 48, circunscription: 14)
Municipality.create(name: "Collipulli", district: 48, circunscription: 14)
Municipality.create(name: "Ercilla", district: 48, circunscription: 14)
Municipality.create(name: "Los Sauces", district: 48, circunscription: 14)
Municipality.create(name: "Lumaco", district: 48, circunscription: 14)
Municipality.create(name: "Purén", district: 48, circunscription: 14)
Municipality.create(name: "Renaico", district: 48, circunscription: 14)
Municipality.create(name: "Traiguén", district: 48, circunscription: 14)
Municipality.create(name: "Curacautín", district: 49, circunscription: 14)
Municipality.create(name: "Galvarino", district: 49, circunscription: 14)
Municipality.create(name: "Lautaro", district: 49, circunscription: 14)
Municipality.create(name: "Lonquimay", district: 49, circunscription: 14)
Municipality.create(name: "Melipeuco", district: 49, circunscription: 14)
Municipality.create(name: "Perquenco", district: 49, circunscription: 14)
Municipality.create(name: "Victoria", district: 49, circunscription: 14)
Municipality.create(name: "Vilcún", district: 49, circunscription: 14)
Municipality.create(name: "Padre Las Casas", district: 50, circunscription: 15)
Municipality.create(name: "Temuco", district: 50, circunscription: 15)
Municipality.create(name: "Carahue", district: 51, circunscription: 15)
Municipality.create(name: "Cholchol", district: 51, circunscription: 15)
Municipality.create(name: "Freire", district: 51, circunscription: 15)
Municipality.create(name: "Nueva Imperial", district: 51, circunscription: 15)
Municipality.create(name: "Pitrufquén", district: 51, circunscription: 15)
Municipality.create(name: "Saavedra", district: 51, circunscription: 15)
Municipality.create(name: "Teodoro Schmidt", district: 51, circunscription: 15)
Municipality.create(name: "Cunco", district: 52, circunscription: 15)
Municipality.create(name: "Curarrehue", district: 52, circunscription: 15)
Municipality.create(name: "Gorbea", district: 52, circunscription: 15)
Municipality.create(name: "Loncoche", district: 52, circunscription: 15)
Municipality.create(name: "Pucón", district: 52, circunscription: 15)
Municipality.create(name: "Toltén", district: 52, circunscription: 15)
Municipality.create(name: "Villarrica", district: 52, circunscription: 15)
Municipality.create(name: "Corral", district: 53, circunscription: 16)
Municipality.create(name: "Lanco", district: 53, circunscription: 16)
Municipality.create(name: "Máfil", district: 53, circunscription: 16)
Municipality.create(name: "Mariquina", district: 53, circunscription: 16)
Municipality.create(name: "Valdivia", district: 53, circunscription: 16)
Municipality.create(name: "Futrono", district: 54, circunscription: 16)
Municipality.create(name: "La Unión", district: 54, circunscription: 16)
Municipality.create(name: "Lago Ranco", district: 54, circunscription: 16)
Municipality.create(name: "Los Lagos", district: 54, circunscription: 16)
Municipality.create(name: "Paillaco", district: 54, circunscription: 16)
Municipality.create(name: "Panguipulli", district: 54, circunscription: 16)
Municipality.create(name: "Río Bueno", district: 54, circunscription: 16)
Municipality.create(name: "Osorno", district: 55, circunscription: 17)
Municipality.create(name: "San Juan de la Costa", district: 55, circunscription: 17)
Municipality.create(name: "San Pablo", district: 55, circunscription: 17)
Municipality.create(name: "Fresia", district: 56, circunscription: 17)
Municipality.create(name: "Frutillar", district: 56, circunscription: 17)
Municipality.create(name: "Llanquihue", district: 56, circunscription: 17)
Municipality.create(name: "Los Muermos", district: 56, circunscription: 17)
Municipality.create(name: "Puerto Octay", district: 56, circunscription: 17)
Municipality.create(name: "Puerto Varas", district: 56, circunscription: 17)
Municipality.create(name: "Puyehue", district: 56, circunscription: 17)
Municipality.create(name: "Purranque", district: 56, circunscription: 17)
Municipality.create(name: "Río Negro", district: 56, circunscription: 17)
Municipality.create(name: "Calbuco", district: 57, circunscription: 17)
Municipality.create(name: "Cochamó", district: 57, circunscription: 17)
Municipality.create(name: "Maullín", district: 57, circunscription: 17)
Municipality.create(name: "Puerto Montt", district: 57, circunscription: 17)
Municipality.create(name: "Ancud", district: 58, circunscription: 17)
Municipality.create(name: "Castro", district: 58, circunscription: 17)
Municipality.create(name: "Chaitén", district: 58, circunscription: 17)
Municipality.create(name: "Chonchi", district: 58, circunscription: 17)
Municipality.create(name: "Curaco de Vélez", district: 58, circunscription: 17)
Municipality.create(name: "Dalcahue", district: 58, circunscription: 17)
Municipality.create(name: "Futaleufú", district: 58, circunscription: 17)
Municipality.create(name: "Hualaihué", district: 58, circunscription: 17)
Municipality.create(name: "Palena", district: 58, circunscription: 17)
Municipality.create(name: "Puqueldón", district: 58, circunscription: 17)
Municipality.create(name: "Queilén", district: 58, circunscription: 17)
Municipality.create(name: "Quellón", district: 58, circunscription: 17)
Municipality.create(name: "Quemchi", district: 58, circunscription: 17)
Municipality.create(name: "Quinchao", district: 58, circunscription: 17)
Municipality.create(name: "Aysén", district: 59, circunscription: 18)
Municipality.create(name: "Cisnes", district: 59, circunscription: 18)
Municipality.create(name: "Chile Chico", district: 59, circunscription: 18)
Municipality.create(name: "Coyhaique", district: 59, circunscription: 18)
Municipality.create(name: "Cochrane", district: 59, circunscription: 18)
Municipality.create(name: "Guaitecas", district: 59, circunscription: 18)
Municipality.create(name: "Lago Verde", district: 59, circunscription: 18)
Municipality.create(name: "Río Ibáñez", district: 59, circunscription: 18)
Municipality.create(name: "O'Higgins", district: 59, circunscription: 18)
Municipality.create(name: "Tortel", district: 59, circunscription: 18)
Municipality.create(name: "Antártica", district: 60, circunscription: 19)
Municipality.create(name: "Cabo de Hornos", district: 60, circunscription: 19)
Municipality.create(name: "Laguna Blanca", district: 60, circunscription: 19)
Municipality.create(name: "Natales", district: 60, circunscription: 19)
Municipality.create(name: "Porvenir", district: 60, circunscription: 19)
Municipality.create(name: "Primavera", district: 60, circunscription: 19)
Municipality.create(name: "Punta Arenas", district: 60, circunscription: 19)
Municipality.create(name: "Río Verde", district: 60, circunscription: 19)
Municipality.create(name: "San Gregorio", district: 60, circunscription: 19)
Municipality.create(name: "Timaukel", district: 60, circunscription: 19)
Municipality.create(name: "Torres del Paine", district: 60, circunscription: 19)


senate = Chamber.create(name: 'Senado', codename: :senate)
deputies = Chamber.create(name: 'Cámara', codename: :deputies)

s1 = Representative.create(first_name: 'Carlos', last_name: 'Cantero', second_last_name: 'Ojeda', chamber: senate, electoral_division: 2, party: 'Ind', email: 'ccantero@senado.cl', twitter: 'SenadorCantero', facebook: 'https://www.facebook.com/pages/Senador-Carlos-Cantero/245202768842200', webpage: 'http://www.cantero.cl/')
s2 = Representative.create(first_name: 'Alejandro', last_name: 'Navarro', second_last_name: 'Brain', chamber: senate, electoral_division: 12, party: 'MAS', email: 'anavarro@senado.cl', twitter: 'senadornavarro', facebook: 'http://www.facebook.com/alejandronavarrobrain', webpage: 'http://www.navarro.cl/')
s3 = Representative.create(first_name: 'Jaime', last_name: 'Quintana', second_last_name: 'Leal', chamber: senate, electoral_division: 14, party: 'PPD', email: 'jquintana@senado.cl', twitter: 'senadorquintana', facebook: 'https://www.facebook.com/groups/47163357630/', webpage: 'http://jaimequintana.cl/')
s4 = Representative.create(first_name: 'Ena', last_name: 'Von Baer', second_last_name: 'Jahn', chamber: senate, electoral_division: 8, party: 'UDI', email: 'evonbaer@senado.cl', twitter: 'enavonbaer', facebook: 'http://www.facebook.com/enavonbaer', webpage: 'http://www.enavonbaer.cl/')
s5 = Representative.create(first_name: 'Ignacio', last_name: 'Walker', second_last_name: 'Prieto', chamber: senate, electoral_division: 5, party: 'PDC', email: 'iwalker@senado.cl', twitter: 'ignaciowalker', facebook: 'http://www.facebook.com/ignaciowalkerp', webpage: 'http://www.ignaciowalker.cl/')

s6 = Representative.create(first_name: 'Camilo', last_name: 'Escalona', second_last_name: 'Medina', chamber: senate, electoral_division: 17, party: 'PS', email: 'cescalona@senado.cl', twitter: nil, facebook: nil, webpage: 'http://escalonasenador.cl/')
s7 = Representative.create(first_name: 'Carlos', last_name: 'Kuschel', second_last_name: 'Silva', chamber: senate, electoral_division: 17, party: 'RN', email: 'kuschel@senado.cl', twitter: nil, facebook: nil, webpage: 'http://www.kuschel.cl/')
s8 = Representative.create(first_name: 'Ricardo', last_name: 'Lagos', second_last_name: 'Weber', chamber: senate, electoral_division: 6, party: 'PPD', email: 'rlagos@senado.cl', twitter: 'lagosweber', facebook: 'http://www.facebook.com/pages/Ricardo-Lagos-Weber/8885557220', webpage: 'http://www.lagosweber.cl/')
s9 = Representative.create(first_name: 'Jovino', last_name: 'Novoa', second_last_name: 'Vásquez', chamber: senate, electoral_division: 7, party: 'UDI', email: 'jnovoa@senado.cl', twitter: nil, facebook: nil, webpage: 'http://www.jovinonovoa.cl/')
s10 = Representative.create(first_name: 'Andrés', last_name: 'Zaldívar', second_last_name: 'Larraín', chamber: senate, electoral_division: 10, party: 'PDC', email: 'azaldivar@senado.cl', twitter: 'andreszaldivarl', facebook: 'https://www.facebook.com/andres.zaldivarlarrain', webpage: 'http://andreszaldivar.cl/')

s11 = Representative.create(first_name: 'Guido', last_name: 'Girardi', second_last_name: 'Lavín', chamber: senate, electoral_division: 7, party: 'PPD', email: 'ggirardi@senado.cl', twitter: 'guidogirardi', facebook: 'https://www.facebook.com/senadorgirardi', webpage: 'http://www.guidogirardi.cl/')
s11 = Representative.create(first_name: 'Soledad', last_name: 'Alvear', second_last_name: 'Valenzuela', chamber: senate, electoral_division: 8, party: 'PDC', email: 'salvear@senado.cl', twitter: 'soledadalvear', facebook: 'https://www.facebook.com/SoledadAlvearValenzuela', webpage: 'http://soledadalvear.cl/')

education_commission = Commission.create(name: "Educación, Cultura, Ciencia y Tecnología", chamber: senate, representatives: [s1, s2, s3, s4, s5])
finance_commission = Commission.create(name: "Hacienda", chamber: senate, representatives: [s6, s7, s8, s9, s10])

ong = Ong.create do |o|
  o.name = 'Educacion 2020'
  o.mission = "Mi misión"
  o.vission = "Mi Visión"
  o.webpage = "http://www.educacion2020.cl"
  o.address = "Arturo Prat 1171, 2º piso Santiago"
  o.twitter = "educacion2020"
  o.facebook = "educacion2020"
  o.email = 'contacto@educacion2020.cl'
  o.subdomain = 'educacion2020'
end

initiative1 = Initiative.create do |i|
  i.title = "Firma por la Reforma Educativa que Chile necesita"
  i.description = <<-EOF
  Educación 2020 ha lanzado una nueva propuesta para el país: "La Reforma Educativa que Chile Necesita" se basa en 5 principios indispensables para cambiar la educación de nuestro país: cobertura, con énfasis en educación inicial; calidad, más allá del Simce y la PSU; equidad, para que todos los niños, niñas y jóvenes de Chile puedan acceder a una educación de calidad en todos los niveles; inclusión, para terminar con la segregación; y Educación Pública, que debe ser nuestro gran proyecto país.<br><br>Desde estos principios, proponemos al país esta nueva Hoja de Ruta, cuyos puntos principales son:<br>
  <ol>
    <li>Aumento de cobertura y calidad de la Educación Parvularia, creación de una nueva institucionalidad, mayor financiamiento por niño y una regulación efectiva, gratuidad en toda la educación parvularia subvencionada por el Estado y fomento de la integración social desde la primera infancia. Además, creemos necesario establecer como obligatorios kínder y prekínder.</li>
    <li>En cuanto a Educación Escolar, fortalecer y crear una nueva institucionalidad de la Educación Pública, nueva Carrera Docente, transparentar y perfeccionar regulación del sector particular subvencionado, gratuidad en toda la educación subvencionada por el Estado, terminando con el copago, promover la inclusión, la educación multicultural y los aprendizajes integrales.</li>
    <li>Cambio radical del modelo regulatorio de la Educación Superior, así como del sistema de acreditación e ingreso. Fortalecimiento de la Educación Pública superior, con énfasis en la educación técnica profesional y garantizar que todo estudiante con las capacidades pueda estudiar en la educación superior.</li>
    <li>Crear un programa de Nivelación de estudios para adultos, en comprensión lectora y matemáticas, con especial foco en los primeros 3 quintiles socioeconómicos.</li>
  </ol>
  EOF
  i.hashtag = "ReformaEducativaQueChileNecesita"
  i.signs_active = true
  i.donations_active = false
  i.ong = ong
  i.initiative_stat = InitiativeStat.new(signs_count: 100, donations_count: 10, donations_amount: 50, conversions_count: 20)
end

initiative2 = Initiative.create do |i|
  i.title = "Educación Pública AHORA"
  i.description = <<-EOF
  <div>Manifiesto por la Educación Pública
    <ol><li>Porque no habrá solución a la dramática segregación social chilena sin una Educación Pública, gratuita y de calidad, capaz de atraer a alumnos social y culturalmente diferentes. No habrá solución en tanto las escuelas -el espacio por excelencia donde aprendemos a convivir- separen a los futuros ciudadanos según lo que pueden pagar.</li>
    <li>Porque es un deber del Estado garantizar el derecho constitucional –en todas y cada una de las localidades de Chile– a una educación de calidad, sin tener que pagar por ella.</li>
    <li>Porque el Estado es el responsable de impulsar proyectos educativos integradores cuyo fin sea el bien del país, y no solamente el beneficio particular de cada persona.</li>
    <li>Porque Chile tiene el deber de garantizar la existencia de proyectos, que no respondan a intereses particulares -ideológicos o religiosos- y que no discriminen a ningún niño a partir de estos intereses.</li>
    <li>Porque queremos escuelas sin prácticas de selección o expulsión de alumnos, de acuerdo a su rendimiento académico. Todos merecen una oportunidad.</li>
    <li>Porque tener todo esto no es un imposible. Son condiciones mínimas con las que cuentan muchos sistemas educativos, indispensables para el desarrollo y la paz social de cualquier país.</li>
    </ol></div>
  EOF
  i.hashtag = "EducacionPublicaAHORA"
  i.signs_active = true
  i.donations_active = true
  i.ong = ong
  i.initiative_stat = InitiativeStat.new(signs_count: 101, donations_count: 11, donations_amount: 51, conversions_count: 21)
end

initiative3 = Initiative.create do |i|
  i.title = "Rechazamos el descuento tributario por gastos en educación privada"
  i.description = <<-EOF
  <div>El descuento tributario para gastos en educación propuesto en el proyecto de reforma Tributaria es un incentivo que beneficiaría sólo al 20% de los contribuyentes de mayores ingresos, profundizaría la segregación y perjuficaría la Educación Pública.<br><br>Es por eso que miles de ciudadanos nos unimos para pedirle a los parlamentarios que rechacen esta iniciativa. No queremos más segregación. Queremos una educación de calidad e incluso para todos los niños y jóvenes de Chile.
  </div>
  EOF
  i.hashtag = "RechazoDescuentoTributarioEducPrivada"
  i.signs_active = true
  i.donations_active = false
  i.spam_active = true
  i.spam_receiver = education_commission
  i.ong = ong
  i.initiative_stat = InitiativeStat.new(signs_count: 102, donations_count: 12, donations_amount: 52, conversions_count: 22)
end

initiative4 = Initiative.create do |i|
  i.title = "No más negociado con las escuelas de pedagogía"
  i.description = <<-EOF
  <div>La calidad de nuestros profesores refleja la calidad de nuestro sistema educativo. En Chile, ambas dejan mucho que desear: según los resultados de una prueba aplicada a estudiantes de pedagogía, la mitad de los futuros profesores no domina materias básicas como traspasar fracciones a decimales y sólo un 1% tiene un desempeño “bueno” en comunicación escrita.<br><br>Los principales responsables son muchas Universidades e Institutos Profesionales que no están entregando una educación de calidad.<br><br>Muchos estudiantes y sus familias se han endeudado para obtener un título profesional que les asegure mejores condiciones de vida: también es injusto para ellos pagar grandes sumas de dinero por una mala educación.<br><br>Ante esta grave situación, Educación 2020 hace un llamado a toda la sociedad a comprometerse con este debate. Los profesores son los que día a día forman el futuro de este país, son la pieza clave sin la cual no podemos avanzar en una educación de mejor calidad e igualdad. Por ello, hoy decimos basta de programas de pedagogía mediocres, basta con el negociado de la educación.
  <br>
  <br><b>Súmate.</b>
  <br>
  <br>
  En estos momentos se está discutiendo en el Parlamento un proyecto de ley que crea un examen que certifica la calidad de los nuevos profesores. Sin embargo, esta prueba no sería obligatoria y no tendría ninguna consecuencia para esas Universidades e Institutos Profesionales que obtienen malos resultados.<br><br>Queremos que esto cambie: la prueba debe ser obligatoria, tal como pasa en otras profesiones como Leyes y Medicina; también debe medir conocimientos y la capacidad que tienen los futuros profesores de enseñar, y si una Universidad o Instituto Profesional no obtiene un nivel mínimo debe responsabilizarse por ello.<br><br>Políticos de distintos sectores se han mostrado de acuerdo con estas iniciativas, pero todavía no se hace nada concreto para cambiar. Por eso te invitamos a sumarte a esta campaña y decir de una vez por todas: NO + al negociado con las carreras de Pedagogía.
  </div>
  EOF
  i.hashtag = "NoMasNegociadoConEscuelasDePedagogia"
  i.active = false
  i.signs_active = false
  i.donations_active = false
  i.ong = ong
  i.initiative_stat = InitiativeStat.new(signs_count: 103, donations_count: 13, donations_amount: 53, conversions_count: 23)
end

paypal_app=PaypalApp.create do |pa|
  pa.active= true
  pa.mode= 0
  pa.client_id="AU_1nxCKaikf7bSSqyxucNuBDOL4ZKtL5T_mHIRf_oEaDVdKAgLp5Nf4Rvnz" 
  pa.client_secret="EL6U0RCWfDs-RKtP7HJ9_GDs0MF2SX_fayOxbkjKJfddQ7rkr8-MpuNT2mr7" 
  pa.username="danielbc+paypal1_api1.gmail.com" 
  pa.app_id="APP-80W284485P519543T" 
  pa.password="1381891309" 
  pa.signature="AFcWxV21C7fd0v3bYYYRCpSSRl31AdYNqT0chXyCBMwAG0TG9--VJZxP"
  pa.ong=ong
end
