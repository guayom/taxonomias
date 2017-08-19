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
    file.write("
      ---\n
      title: \"#{especie[6]}\"
      date: 2017-08-18T20:46:32-06:00
      draft: false
      reinos: [\"#{especie[0]}\"]
      divisiones: [\"#{especie[1]}\"]
      clases: [\"#{especie[2]}\"]
      ordenes: [\"#{especie[3]}\"]
      familias: [\"#{especie[4]}\"]
      generos: [\"#{especie[5]}\"]
      nombre_cientifico: \"#{especie[7]}\"
      nombre_comun: \"#{especie[8]}\"
      nombre_ingles: \"#{especie[9]}\"
      ---\n
      ")
  end
  pp especie[0]
end
