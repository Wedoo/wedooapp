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
  i.signs_active = false
  i.donations_active = false
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
