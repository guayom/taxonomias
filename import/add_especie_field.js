// # Segunda importación
// # 0 N.científico
// # 1 Reino
// # 2 División
// # 3 Clase
// # 4 Órden
// # 5 Familia
// # 6 Género
// # 7 Especie
// # 8 N.común
// # 9 N.inglés
// # 10 Título
// # 11 CC
// # 12 Otros nombres
// # 13 Garrigues

// Config
var inputFile = './import/data-2018-03-26.csv';

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
      let filename = slug(line[0], { lower: true })
      let targetFile = `./content/especies/${filename}.md`
      let species = line[7]
      let speciessString = `especie: "${species}"`
      
      if (fs.existsSync(targetFile)) {
        var body = fs.readFileSync(targetFile).toString().split('\n')
        body.splice(10, 0, speciessString);
        var output = body.join('\n');
        fs.writeFileSync(targetFile, output);
      } else {
        fs.appendFile('./import/errors.txt', `File no existe: ${filename}\n`, function (err) {
          if (err) throw err;
        });
      }
    })
  });
});