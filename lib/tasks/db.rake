
namespace :db do
  desc 'Fill database with sample data'
  task populate: [:reset, 'db:populate:all']  # for backwards compatability

  namespace :populate do
    task all: [
    	:categories,
      :create_admin

    ] do
    end
  end
  desc 'Make Default Categories'
	task :categories do
		categories = [
			"Geeky Douche",
			"Party Douche",
      "True Douche"
		]

		categories.each do |category|
			cat = Category.new
			cat.name = category
			cat.save 
		end
	end
  
  desc "Create Admin"
  task :create_admin => :environment do
    kevin = User.new(email: 'kev71187@gmail.com', password: 'kevinw', password_confirmation: 'kevinw', admin: true)
    kevin.save
    kellie = User.new(email: 'kellie.b.hudson@gmail.com', password: 'kellieh', password_confirmation: 'kellieh', admin: true)
    kellie.save
  end
end