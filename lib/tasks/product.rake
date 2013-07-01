
namespace :products do

  desc "Create fake products"
  task :fake_products => :environment do
  	file = File.open("#{Rails.root}/app/assets/images/beer_tshirt.jpg")
  	
    30.times do 
    	product = Product.new
	  	product.url = "http://www.cafepress.com/mf/46453056/beer-bear-deer-vintage_tshirt"
	  	product.category_id = rand(1..3)
	  	product.price = rand(1.00..100.00)
      product.title = "Beer + Deer = Beer"
      product.featured = [true, false].sample
	  	product.save

	  	productPhoto = ProductPhoto.new
	  	productPhoto.photo = file
	  	productPhoto.product_id = product.id
      productPhoto.save
    end

  	file.close
  end
end