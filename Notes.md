Start with debugger:

@recipe.errors (! can't be empty if we don't do .valid?)

@recipe.errors = `#<ActiveModel::Error attribute=ingredient_id, type=blank, options={}#<ActiveModel::Errors [#<ActiveModel::NestedError attribute=recipe_ingredients.recipe_id, type=blank, options={}>]>`

Look at https://guides.rubyonrails.org/association_basics.html#bi-directional-associations

Use inverse_of on ingredient

@recipe.errors = `#<ActiveModel::Errors [#<ActiveModel::NestedError attribute=recipe_ingredients.recipe_id, type=blank, options={}>]>`

Look again at same website

Use inverse_of on recipe
Use foreign_key on recipe_ingredient (Why? because no more automatic discovery)
=> NOPE

(Googled "rails nested error on bi-directional association with inverse_of" since now I know what to search for)

WOW http://laptite.github.io/blog/2014/02/26/deep-nesting-with-has-many-through-and-a-join-model/ has the same issue

At the end, seems the @recipe.recipes_ingredients.build was needed? Not intuitive for me

Adding it, not working
+> Maybe need the builder for ingredient?

Adding it, not working (using build_ingredient, i read somewhere this is the function to call, don't remember why)

Looking at https://stackoverflow.com/questions/935650/accepts-nested-attributes-for-child-association-validation-failing

Old but seems to match.

Validation is an issue in that case, our case maybe too?

Adding:  validates_presence_of :recipe

YAAAAAAS @recipe.valid? is true!!!

Now the create is failing, removing it since it taken care of with `build`

