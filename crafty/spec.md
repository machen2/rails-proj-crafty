# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) -- User has_many Crafts
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) -- Craft belongs_to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) -- Craft has_many Tags through Craft_Tags
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) --Join Table Craft_Tags
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -- Tag.most_popular_tags, /tags/most_popular
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) -- (/users/:id/crafts/new, nested Tag form)
- [x] Include signup (how e.g. Devise) -- Custom, through Registrations Controller
- [x] Include login (how e.g. Devise) -- Custom, through Sessions Controller
- [x] Include logout (how e.g. Devise) -- Custom, through Sessions Controller
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) -- Omniauth through Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes) -- users/:id/crafts/:id (show)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) -- users/:id/crafts/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) --Login, Signup, Craft New, Craft Edit

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate
