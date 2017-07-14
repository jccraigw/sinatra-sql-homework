require 'bundler'
Bundler.require

conn = PGconn.open(dbname: 'cars2')

get '/cars' do 

	content_type :json

	res = conn.exec('SELECT make, model, image_url, year, price FROM models;')
	
	models = []
	res.each do |model|
		models.push(model)
	end
	models.to_json

end

get '/cars/join' do

	content_type :json

	res = conn.exec('SELECT models.make, dealers.name FROM models JOIN dealers ON models.dealer_id = dealers.id;')

	relate = []

	res.each do |x|

		relate.push(x)
	end

	relate.to_json
end

get '/cars/:id' do
	
		id = params[:id]
		res = conn.exec("SELECT id, make, model, image_url, year, price FROM models WHERE id = #{id};")
		model = res[0]
		model.to_json
end


post '/cars' do 
	# creat a new model user request body
	new_model = JSON. parse(request.body.read)
	p new_model

	make = new_model["make"]
	model = new_model["model"]
	image_url = new_model["image_url"]
	year = new_model["year"]
	price = new_model["price"]
	conn.exec("INSERT INTO models (make, model, image_url, year, price) VALUES ('#{make}', '#{model}', '#{image_url}', '#{year}', '#{price}');")



	"success"


end

patch '/cars/:id' do

	id = params[:id]

	update_model = JSON.parse(request.body.read)


	make = update_model["make"]
	model = update_model["model"]
	image_url = update_model["image_url"]
	year = update_model["year"]
	price = update_model["price"]

	conn.exec("UPDATE models SET make = '#{make}', model = '#{model}', image_url = '#{image_url}', year = '#{year}', price = '#{price}' WHERE id = #{id};")

	"success"


end

delete '/cars/:id' do

	id = params[:id]

	conn.exec("DELETE FROM models WHERE id = #{id};")

	"success"
end


