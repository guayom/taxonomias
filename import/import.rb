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

CSV.foreach('import/data.csv') do |especie|
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
  pp especie[0]
end
