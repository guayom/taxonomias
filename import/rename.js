const folder = './content/especies/';
const fs = require('fs');
var parser = require('parser-front-matter');
var slug = require('slug')
const replace = require('replace-in-file');

fs.readdir(folder, (err, files) => {
  files.forEach(file => {
    if (file != "_index.md") {
      fs.readFile("./content/especies/"+file, (err, data) => {
        if (err) throw err;
        var parsedFile = { contents: data };
        parser.parse(parsedFile, function (err, res) {
          let newTitle = `${res.data.nombre_cientifico}${res.data.nombre_ingles != "" ? `, ${res.data.nombre_ingles}` : ""}${res.data.nombre_comun != "" ? `, ${res.data.nombre_comun}` : ""}`
          const options = {
            files: "./content/especies/" + file,
            from: res.data.title,
            to: newTitle,
          };
          replace(options, (error, changes) => {
            if (error) {
              return console.error('Error occurred:', error);
            }
            console.log('Modified files:', changes.join(', '));
          });
        });
      });
    }
  });
})