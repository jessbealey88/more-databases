require_relative './recipe'
class RecipeRepository

    def all
      
      sql = 'SELECT id, name, avg_cooking_time, rating FROM recipes;'
      result_set = DatabaseConnection.exec_params(sql, [])

      recipes = []
      result_set.each do |record|
        recipe = Recipe.new

        recipe.id = record['id']
        recipe.name = record['name']
        recipe.avg_cooking_time = record['avg_cooking_time']
        recipe.rating = record['rating']

        recipes << recipe
      end
      return recipes

    end
  
    def find(id)
   
      sql ='SELECT id, name, avg_cooking_time, rating FROM recipes WHERE id = $1;'
      sql_params =[id]
      
      result_set = DatabaseConnection.exec_params(sql, sql_params)
      record = result_set[0]

      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.avg_cooking_time = record['avg_cooking_time']
      recipe.rating = record['rating']

      return recipe

    end
   
  end