require 'csv'
require 'fileutils'
require 'pp'
require 'parameterize'

FileUtils::mkdir_p "content/especies/"

# 0 reinos
# 1 divisiones
# 2 clases
# 3 ordenes
# 4 familias
# 5 generos
# 6 title
# 7 nombre_cientifico
# 8 nombre_comun
# 9 nombre_ingles

# Segunda importación
# 0 N. científico	
# 1 Reino
# 2 División	
# 3 Clase
# 4 Órden	
# 5 Familia
# 6 Género	
# 7 Especie	
# 8 N. común	
# 9 N. inglés	
# 10 Título	
# 11 CC	
# 12 Otros nombres	
# 13 Garrigues

CSV.foreach('import/data-2018-03-26.csv') do |especie|
  File.open("content/especies/#{especie[10].parameterize}.md", "w+") do |file|
    file.write("---\n")
    file.write("title: \"#{especie[10]}\"\n")
    file.write("date: 2018-03-26T20:00:00-00:00\n")
    file.write("draft: false\n")
    file.write("reinos: [\"#{especie[1]}\"]\n")
    file.write("divisiones: [\"#{especie[2]}\"]\n")
    file.write("clases: [\"#{especie[3]}\"]\n")
    file.write("ordenes: [\"#{especie[4]}\"]\n")
    file.write("familias: [\"#{especie[5]}\"]\n")
    file.write("generos: [\"#{especie[6]}\"]\n")
    file.write("nombre_cientifico: \"#{especie[0]}\"\n")
    file.write("nombre_comun: \"#{especie[8]}\"\n")
    file.write("nombre_ingles: \"#{especie[9]}\"\n")
    file.write("otros_nombres: \"#{especie[12]}\"\n")
    file.write("garrigues: \"#{especie[13]}\"\n")
    file.write("vista: true\n")
    file.write("los_cielos: true\n")
    file.write("---\n")
  end
  pp especie[0]
end
