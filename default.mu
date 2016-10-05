<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8" />
        <title>{{client.company}} - Facture - {{date}}</title>
        <style>
            body {
                width: 742px;
                margin: 28px;
                padding: 0;
                font-family: DejaVu Sans;
                font-size: 12px;
            }

            header .first-part .title {
                float: right;
                margin-top: -5px
            }

            header .first-part h1, header .first-part h2 {
                text-transform: uppercase;
                font-weight: lighter;
                font-size: 26px;
                display: inline;
                margin-top: 15px;
            }

            header .first-part h1 {
                float: left;
            }
            header .first-part h2 {
                color: {{color}};
                float: right;
            }
            
            header .first-part hr.double {
                clear: both;
            }

            html body header .first-part .logo {
                position: absolute;
                top: 15px;
                left: 13px;
                width: 400px;
                z-index: -1
            }

            html body header .second-part .date {
                float: left;
            }

            html body header .second-part .price {
                text-align: right;
                padding-right: 10px;
                color: {{color}};
                font-size: 32px;
                float: right;
                padding-top: 10px;
            }

            html body header .third-part {
                margin-top: 18px;
                font-size: 13px;
                color: #473530;
                margin-bottom: 18px
            }

            html body header .third-part .client {
                float: left;
                width: 50%
            }

            html body header .third-part .company {
                float: right;
                width: 50%;
                text-align: right
            }

            html body section table {
                margin-top: 16px;
                border: 0;
                width: 100%;
                border-collapse: collapse
            }

            html body section table thead {
                text-transform: uppercase
            }

            html body section table thead tr {
                height: auto
            }

            html body section table thead tr th {
                font-weight: 400;
                border-bottom: 1px solid #ded0af;
                text-align: center
            }

            html body section table thead tr th.hours {
                width: 15%
            }

            html body section table thead tr th.description {
                width: 55%
            }

            html body section table thead tr th.rates {
                width: 15%
            }

            html body section table thead tr th.line-total {
                width: 15%
            }

            html body section table tr {
                text-align: left
            }

            html body section table tr:nth-child(even){
                background-color: #f2f2f2;
            }

            html body section table tr td {
                padding: 10px;
            }

            section table tr.hours td {
                text-align: center;
                font-size: 15px;
                font-weight: lighter;
            }
            section table tr.hours td.description {
                text-align: left;
                font-size: 14px;
            }

            section table tr.hours td.description .date {
                color: black;
                font-size: 12px;
                font-weight: normal;
            }

            html body section table tr td.right {
                text-align: right
            }

            html body section table tr: nth-last-child(7){
                border-bottom: 1px solid #ded0af
            }

            html body section table tr: nth-last-child(2){
                border-bottom: 1px solid gray
            }

            html body section table tr.calculation {
                padding-top: 0!important;
                padding-bottom: 0;
                background-color: #fff
            }

            html body section table tr.calculation td {
                height: 25px!important;
                padding-top: 0!important;
                padding-bottom: 0!important;
                text-align: right
            }

            html body section table tr.calculation.final {
                text-transform: uppercase;
                color: {{color}}
                
                ;
                font-size: 14px
            }

            html body section table tr.calculation.final td {
                padding: 10px!important
            }

            html body footer .info {
                margin-top: 24px;
                font-size: 13px;
                line-height: 20px;
                color: #473530;
                margin-bottom: 24px
            }

            html body footer .info .payment-info {
                float: left;
                width: 50%
            }

            html body footer .info .other-info {
                float: right;
                width: 50%;
                text-align: right
            }

            html body a {
                color: {{color}}
            }

            html body a: hover {
                color: {{color}};
            }

            html body a img {
                border: 0
            }

            html body .main-color {
                color: {{color}} !important;
            }

            html body .uppercase {
                text-transform: uppercase;
            }

            html body .lowercase {
                text-transform: lowercase
            }

            html body .clear {
                clear: both
            }

            html body .important {
                text-transform: uppercase;
                font-weight: 700;
                color: #473530
            }

            html body hr {
                border-color: #000;
                border-width: 1px
            }

            html body hr.gray {
                border-color: gray
            }

            html body hr.double {
                border-color: #473530;
                border-width: 2px;
                border-style: solid
            }

            html body abbr {
                border-bottom: 1px dotted #000
            }
        </style>
    </head>
    
    <body>
        <header>
            <div class="first-part">
                <h1>Facture #{{invoice_code}}</h1>
                <h2>{{client.company}}</h2>

                <hr class="double" />
            </div>
            
            <div class="second-part">
                <span class="date">
                    En date du {{date}}
                </span>
                <span class="price">
                    {{total}} $
                </span>

                <br /><br /><br /><br />
                <hr class="clear" />
            </div>
            
            <div class="third-part">
                <div class="client">
                    <strong>Facture envoyée à {{client.name}}</strong><br />
                    <span>{{client.company}}</span><br />
                    <span>{{client.address}}</span><br />
                    Tél : <span>{{client.phone}}</span><br />
                </div>

                <!--
                <div class="company">
                    <strong>{{me.name}}</strong><br />
                    <span>{{me.email}}</span><br />
                </div>
                -->
                <div class="clear"></div>
            </div>
            
            <hr class="double" />
        </header>
        
        <section>
            <h3>
                {{#labels.title}}
                    {{.}}
                {{/labels.title}}
                {{^labels.title}}
                    Travail à taux horaire
                {{/labels.title}}
            </h3>
            <table class="invoice">
                <thead>
                    <tr>
                        <th class="hours">
                            {{#labels.heures}}
                                {{.}}
                            {{/labels.heures}}
                            {{^labels.heures}}
                                Heures
                            {{/labels.heures}}
                        </th>
                        <th class="description">Description</th>
                        <th class="rates">
                            {{#labels.tx}}
                                {{.}}
                            {{/labels.tx}}
                            {{^labels.tx}}
                                Taux horaire
                            {{/labels.tx}}
                        </th>
                        <th class="line-total">Total ligne</th>
                    </tr>
                </thead>
                {{#heures}}
                <tr class="hours">
                    <td>{{h}}</td>
                    <td class="description">
                        {{d}}
                        {{#d2}}
                            <br />
                            <small>{{d2}}</small>
                        {{/d2}}
                        {{#t}}
                            <br />
                            <span class="date">({{t}})</span>
                        {{/t}}
                    </td>
                    <td>{{taux_horaire}}</td>
                    <td>{{total_ligne}}</td>
                </tr>
                {{/heures}}
                
                {{#rabais}}
                    <tr class="calculation">
                        <td></td>
                        <td></td>
                        <td>Rabais</td>
                        <td>{{rabais.montant}}</td>
                    </tr>
                {{/rabais}}
                
                <tr class="calculation">
                    <td></td>
                    <td></td>
                    <td>Sous-Total</td>
                    <td>{{total}} $</td>
                </tr>
                
                {{#taxes}}
                    <tr class="calculation">
                        <td></td>
                        <td></td>
                        <td>Taxes</td>
                        <td>0,00</td>
                    </tr>
                {{/taxes}}
                
                <tr class="calculation final">
                    <td></td>
                    <td></td>
                    <td>Total CAD</td>
                    <td>{{total}} $</td>
                </tr>
            </table>

            <hr class="double" />
        </section>
        
        <footer>
            <div class="info">
                <div class="payment-info">
                    <span class="important main-color">Informations sur le paiement</span><br />
                    Nom du bénéficiaire : <strong>{{me.name}}</strong>
                    <br />
                    Virement INTERAC à : <strong>{{me.email}}</strong>
                    <br /><br />
                    Virement bancaire possible, me contacter par courriel.<br /><br />

                    {{#use_paypal}}
                    <form name="paypal" id="paypal" method="POST" action="https://www.paypal.com/cgi-bin/webscr">
                        <input type="hidden" name="cmd" value="_cart" />
                        <input type="hidden" name="upload" value="1" />
                        <input type="hidden" name="business" value="{{me.paypal}}" />
                        <input type="hidden" name="charset" value="UTF-8" />
                        <input type="hidden" name="currency_code" value="CAD" />
                        <input type="hidden" name="return" value="https://www.paypal.com/" />
                        <input type="hidden" name="cancel_return" value="https://www.paypal.com/" />
                        <input type="hidden" name="item_name_1" value="Facture {{invoice_code}} - {{client.company}}" />
                        <input type="hidden" name="amount_1" value="{{total}}" />

                        <a href="#!" onclick="document.forms['paypal'].submit()">
                            Payer la facture avec PayPal
                        </a>
                        <br />

                        (prévoir des frais de traitement)
                    </form>
                    {{/use_paypal}}
                </div>

                <div class="other-info">
                    <span class="important main-color">Informations sur l'entreprise</span><br />
                    {{me.description}}<br />
                    {{#me.neq}}
                        <abbr title="Numéro d'entreprise du Québec">NEQ</abbr> : {{me.neq}}
                    {{/me.neq}}
                    <br /><br />
                    {{#me.website}}
                        <a href="{{me.website}}" target="_blank">
                            {{me.website}}
                        </a><br />
                    {{/me.website}}
                    <a href="mailto:{{me.email}}" target="_blank">{{me.website}}</a>
                </div>

                <div class="clear"></div>
            </div>
            <hr />
            <span class="important">
                Le paiement doit être effectué par virement bancaire électronique{{#use_paypal}}, par paiement PayPal{{/use_paypal}}
                ou par chèque à l’ordre de {{me.name}}.
            </span>
        </footer>
    </body>
</html>
