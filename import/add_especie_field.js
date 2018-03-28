// 0 reinos
// 1 divisiones
// 2 clases
// 3 ordenes
// 4 familias
// 5 generos
// 6 title
// 7 nombre_cientifico
// 8 nombre_comun
// 9 nombre_ingles

// Config
var inputFile = './import/data.csv';

// Dependencies
var fs = require('fs');
var parse = require('csv-parse');
var slug = require('slug')

fs.readFile(inputFile, 'utf8', function (err, data) {
  if (err) {
    return console.log(err);
  }
  parse(data, { comment: '#' }, function (err, output) {
    output.forEach(line => {
      let filename = slug(line[7], { lower: true })
      let targetFile = `./content/especies/${filename}.md`
      let species = line[6]
      let speciessString = `especie: "${species}"`
      
      if (fs.existsSync(targetFile)) {
        var body = fs.readFileSync(targetFile).toString().split('\n')
        body.splice(10, 0, speciessString);
        var output = body.join('\n');
        console.log(output)
      } else {
        fs.appendFile('./import/errors.txt', `File no existe: ${filename}\n`, function (err) {
          if (err) throw err;
        });
      }
    })
  });
});