invoicer
========

A simple command-line invoice generator.

## Install

Dependancies : You'll need `node.js`.

    $ (yum, apt-get, whatever package manager) install nodejs

If there is a file called invoice.js in the current directory, you don't need to
specify it as a command-line argument.

If you do not specify a mustache template to use, the default one will be used.

## Configuration

invoice.js :
```
exports.values = {
    heures: [
        {h: number of hours, d: "Description", (d2: "Optional extra description",) t: "date", tx: 25}, // tx is optional
    ],
    default_tx: 25,
    color: "#D64DB7", // Invoice color (html format)
    invoice_code: "XYZ", // Invoice code
    me: {
        name: 'Nicolas Hurtubise',
        email: 'nicolas.k.hurtubise@gmail.com',
        description: "Services de développement web Nicolas Hurtubise",
        paypal: 'nicolas.k.hurtubise@gmail.com',
    },
    client: {
        name: "M. Jack J. Johnson",
        company: "Powercompany Inc.",
        address: "123 fake street",
        phone: "123-4567"
    },
    use_paypal: true, // if you want to enable [Pay with PayPal] button
}
```
