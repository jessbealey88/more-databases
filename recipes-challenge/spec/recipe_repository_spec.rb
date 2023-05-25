require 'recipe_repository'
def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end
  
  describe RecipeRepository do
    before(:each) do 
      reset_recipes_table
    end

    it "lists all recipes" do
        repo = RecipeRepository.new
        recipes = repo.all
        
        expect(recipes.length).to eq 2
        expect(recipes.first.avg_cooking_time).to eq '90'
        expect(recipes.first.rating).to eq '4'
    end

    it "lists a single recipe Lasagne" do
        repo = RecipeRepository.new
        recipe = repo.find(1)

        expect(recipe.name).to eq 'Lasagne' 
        expect(recipe.avg_cooking_time).to eq '90'
        expect(recipe.rating).to eq '4'
    end

    it "lists a single recipe Chicken casserole" do
        repo = RecipeRepository.new
        recipe = repo.find(2)

        expect(recipe.name).to eq 'Chicken casserole' 
        expect(recipe.avg_cooking_time).to eq '120'
        expect(recipe.rating).to eq '3'

    end
  
end