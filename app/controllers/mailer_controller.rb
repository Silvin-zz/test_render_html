class MailerController < ActionController::API

    def show
        user = {}
        user["name"] = "Pedrito"
        user["products"] = [
            {
                "name"  => "Producto 1",
                "cost"  => "$1200.00",
                "tax"   => "120.00",
                "total" => "1320.00"
            },
            {
                "name"  => "Producto 2",
                "cost"  => "$1000.00",
                "tax"   => "100.00",
                "total" => "1100.00"
            }
        ]
        
        data = ApplicationController.render ('mailer/data'),assigns: { user: user }
        begin
            mailer = Mailer::API.new(to: 'bravocado@gmail.com', 
                                    subject: 'saludos', 
                                    template: 'A123')
            mailer.add_template_params(name: 'name'     , value: 'Silvio Bravo Cado')
            mailer.add_template_params(name: 'address'  , value: 'Norte 2')
            mailer.add_custom_param(template_name: 'A123', variable_name: 'producto', values: {})
            mailer.send
        rescue => e 
            p(e.message)
        end
        
        render json: {"uno": data}, status: 200
        
    end
end