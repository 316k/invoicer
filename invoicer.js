#!/usr/bin/node

var Mustache = require('mustache'),
    fs = require('fs'),
    path = require('path');
var values;

// -- Arguments parsing
try {
    var file = path.resolve(
        process.cwd(),
        process.argv.filter(function(x) {
            return x[0] != '-';
        })[2] || 'invoice.js'
    );
    
    values = require(file);
    
    values = values.values;
    var template = __dirname + '/default.mu';
    fs.lstatSync(template);
} catch(err) {
    template = "";
    console.log("*** Check the js file :");
    console.trace();
}

if(!values || !template) {
    console.error('usage : invoicer [-s] [invoice.js]');
    process.exit(1);
}

// -- Extra functions
// see https://stackoverflow.com/questions/10073699/pad-a-number-with-leading-zeros-in-javascript
function pad(n, width, z) {
    z = z || '0';
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

// Calcul du total d'une ligne de travail horaire
values.total_ligne = function() {
    return (values.taux_horaire() * this.h).toFixed(2);
};

// Calcul du total de la facture
values.total = function() {
    var total = 0;
    values.heures.forEach(function(ligne) {
        total += ligne.h * values.taux_horaire();
    });
    return total.toFixed(2);
};

// Current date
values.date = function() {
    var d = new Date();
    return [d.getFullYear(), pad(d.getMonth()+1, 2), pad(d.getDate(), 2)].join('-');
};
values.taux_horaire = function() {
    return this.tx || values.default_tx;
};

// -- Stats
if(process.argv.indexOf('-s') != -1) {
    console.log('Hours :', values.heures.reduce(function(acc, x) {
        return acc + x.h
    }, 0) + 'h');
    console.log('Total :', values.total()+'$');
    process.exit(0);
}

// -- Mustache template render
fs.readFile(template, 'utf8', function (err, data) {
    if (err) {
        return console.error(err);
    }

    console.log(Mustache.render(data, values));
});
