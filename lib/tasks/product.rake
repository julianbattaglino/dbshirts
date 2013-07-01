
namespace :products do

  desc "Create fake products"
  task :fake_products => :environment do
  	file = [
      File.open("#{Rails.root}/app/assets/images/beer_tshirt.jpg"),
      File.open("#{Rails.root}/app/assets/images/to_save_some_time_lets_assume_im_always_right_li.jpg")
    ]
  	
    30.times do 
    	product = Product.new
	  	product.url = "http://www.cafepress.com/mf/46453056/beer-bear-deer-vintage_tshirt"
	  	product.category_id = rand(1..3)
	  	product.price = rand(1.00..100.00)
      product.title = "Beer + Deer = Beer"
      product.featured = [true, false].sample
	  	product.save

	  	productPhoto = ProductPhoto.new
	  	productPhoto.photo = file[rand(0..1)]
	  	productPhoto.product_id = product.id
      productPhoto.save
    end

  	file.close
  end
end