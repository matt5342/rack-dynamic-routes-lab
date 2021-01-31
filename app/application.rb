require 'pry'
class Application

    @@items = []
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        # binding.pry
        if req.path.match(/items/)
            item = req.path.split("/items/").last
            # binding.pry
            if @@items.find{|i| i.name == item}
                instance = @@items.find{|i| i.name == item}
                resp.write instance.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end

end