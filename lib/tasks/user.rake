
namespace :users do

  desc "Create fake products"
  task :create_admin => :environment do
    kevin = User.new(email: 'kev71187@gmail.com', password: 'kevinw', password_confirmation: 'kevinw', admin: true)
    kevin.save
    kellie = User.new(email: 'kellie.b.hudson@gmail.com', password: 'kellieh', password_confirmation: 'kellieh', admin: true)
    kellie.save
  end
end