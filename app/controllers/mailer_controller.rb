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
        mailer = Mailer::API.new
        mailer.prueba
        
        render json: {"uno": data}, status: 200
        
    end
end