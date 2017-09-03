require 'csv'
require 'fileutils'
require 'pp'
require 'parameterize'

# 0 Reino,
# 1 División,
# 2 Clase,
# 3 Orden,
# 4 Familia,
# 5 Género,
# 6 Especie,
# 7 N. científico,
# 8 N. común,
# 9 N. Inglés,
# 10 O. Nombres,

CSV.foreach('import/aves.csv') do |especie|
  File.open("content/especies/#{especie[6].parameterize}.md", "w+") do |file|
    file.write("---\n")
    file.write("title: \"#{especie[6]}\"\n")
    file.write("date: 2017-08-18T20:46:32-06:00\n")
    file.write("draft: false\n")
    file.write("reinos: [\"#{especie[0]}\"]\n")
    file.write("divisiones: [\"#{especie[1]}\"]\n")
    file.write("clases: [\"#{especie[2]}\"]\n")
    file.write("ordenes: [\"#{especie[3]}\"]\n")
    file.write("familias: [\"#{especie[4]}\"]\n")
    file.write("generos: [\"#{especie[5]}\"]\n")
    file.write("nombre_cientifico: \"#{especie[7]}\"\n")
    file.write("nombre_comun: \"#{especie[8]}\"\n")
    file.write("nombre_ingles: \"#{especie[9]}\"\n")
    file.write("---\n")
  end
  pp especie[7]
end
