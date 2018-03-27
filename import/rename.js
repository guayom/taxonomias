const folder = './content/especies/';
const fs = require('fs');
var parser = require('parser-front-matter');
var slug = require('slug')

fs.readdir(folder, (err, files) => {
  files.forEach(file => {
    if (file != "_index.md") {
      fs.readFile("./content/especies/"+file, (err, data) => {
        if (err) throw err;
        var parsedFile = { contents: data };
        parser.parse(parsedFile, function (err, res) {
          let newTitle = slug(res.data.nombre_cientifico, { lower: true }) + ".md"
          fs.rename('./content/especies/' + file, './content/especies/' + newTitle, function (err) {
            if (err) console.log('ERROR: ' + err);
          });
          console.log(`${file} --- ${newTitle}`)
        });
      });
    }
  });
})