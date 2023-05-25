require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new


recipe_repository.all.each do |recipe|
    puts "#{recipe.id} - #{recipe.name} - #{recipe.avg_cooking_time} - #{recipe.rating}"
end