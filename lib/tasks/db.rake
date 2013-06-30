
namespace :db do
  desc 'Fill database with sample data'
  task populate: [:reset, 'db:populate:all']  # for backwards compatability

  namespace :populate do
    task all: [
    	:categories
    ] do
    end
  end
  desc 'Make Default Categories'
	task :categories do
		categories = [
			"Geeky Douche",
			"True Douche",
			"Party Douche"
		]

		categories.each do |category|
			cat = Category.new
			cat.name = category
			cat.save 
		end
	end
end