# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {username: 'wendyp', email: 'wendy@example.com', password: 'password', admin: true},
  {username: 'benn', email: 'ben@example.com', password: 'password', admin: false}
])

Recipe.create!([
  {name: "Emily's English Roasted Potatoes", source: 'Barefoot Contessa', recipe_url: 'https://barefootcontessa.com/recipes/emilys-english-roasted-potatoes', servings: '6-8', ingredients: 'Kosher salt
    3 pounds large Yukon Gold potatoes, peeled and 1½ to 2-inch diced
    ½ cup vegetable oil (be sure it’s fresh!)
    Coarse sea salt or fleur de sel
    Minced parsley', instructions: 'Preheat the oven to 425 degrees.

    Bring a large pot of water with 2 tablespoons kosher salt to a boil.  Add the potatoes, return to a boil, lower the heat, and simmer for 8 minutes.  Drain the potatoes, place them back in the pot with the lid on, and shake the pot roughly for 5 seconds to rough up the edges.  Carefully transfer the potatoes in one layer to a baking rack set over a sheet pan.  Set aside to dry for at least 15 minutes.  (They can sit at room temperature for several hours or in the fridge for up to 6 hours.)
    
    Pour the oil onto another sheet pan, tilt the pan to distribute the oil, and place the pan in the oven for 5 to 7 minutes, until the oil is smoking hot.  Transfer the potatoes carefully into the oil (I use a large metal spatula) and toss them lightly to coat each potato with the hot oil. Lower the oven temperature to 350 degrees F. Roast for 45 minutes to one hour, turning the potatoes occasionally with tongs, until very browned and crisp on the outside and tender and creamy inside.
    
    Transfer to a serving platter, sprinkle generously with 1½ to 2 teaspoons sea salt and parsley and serve hot.', image_url: 'https://d14iv1hjmfkv57.cloudfront.net/assets/recipes/emilys-english-roasted-potatoes/_1200x600_crop_center-center_82_line/IMG_0935.jpg?mtime=20200506111848&focal=none&tmtime=20200930132238'}, {name: "Cacio e Pepe Roasted Asparagus", source: 'Barefoot Contessa', recipe_url: 'https://barefootcontessa.com/recipes/emilys-english-roasted-potatoes', servings: '4', ingredients: '1½ pounds thick asparagus spears
    2 tablespoons unsalted butter, melted
    Kosher salt and freshly ground black pepper
    3 tablespoons freshly grated Italian Pecorino cheese
    1 tablespoon freshly grated Italian Parmesan cheese
    1 lemon, quartered
    Fleur de sel', instructions: 'Preheat the oven to 450 degrees.

    Place 12 cups of water and 2 tablespoons of salt in a large pot, cover, and bring to a boil. Remove and discard 1½ inches from the woody ends of the asparagus. Peel the bottom 2 inches of each spear with a vegetable peeler (see note). When the water boils, add the asparagus and blanch for 3 to 4 minutes, until al dente. Drain.
    
    Transfer the asparagus to a 10 x 12-inch rectangular baking dish. Add the butter, 1 teaspoon salt and ½ teaspoon pepper and toss to coat the asparagus. Arrange the asparagus decoratively in the dish, sprinkle with the Pecorino and Parmesan, and roast for 5 minutes, until the cheese melts. Squeeze on some lemon juice, sprinkle with fleur de sel, and serve hot.', notes: 'The peeler works best if you dip it in a glass of water from time to time.', image_url: 'https://d14iv1hjmfkv57.cloudfront.net/assets/recipes/cacio-e-pepe-roasted-asparagus/_1200x600_crop_center-center_82_line/75627/IMG_1204_200527_122036.jpg?mtime=20200527122036&focal=none&tmtime=20200930132559'}, {name: "Sheet-Pan Blackened Salmon with Garlicky Kale", source: 'Once Upon a Chef', recipe_url: 'https://www.onceuponachef.com/recipes/sheet-pan-blackened-salmon-with-garlicky-kale.html', servings: '4', total_prep_time: 30, intro: 'From chef Alex Guarnaschelli, this sheet-pan salmon with garlicky kale makes a quick, healthy, and delicious weeknight dinner.', ingredients: '1/2 teaspoon sweet paprika
    1/2 teaspoon cayenne pepper
    1 teaspoon garlic powder
    1 teaspoon dry mustard
    1 teaspoon dried oregano
    Salt
    5 tablespoons extra virgin olive oil, divided
    4 (6 to 8-ounce portions) salmon filets, skin on
    1 bunch Tuscan kale (about 8 ounces), stems removed, leaves torn into bite-sized pieces
    2 garlic cloves, minced
    1 tablespoon honey
    Grated zest and juice of 1 lime', instructions: "Preheat the oven to 400°F and set an oven rack in the lower-middle position.
    Prepare the Salmon: In a small bowl, combine the paprika, cayenne pepper, garlic powder, dry mustard, oregano, and 3/4 teaspoon salt; stir until evenly mixed and no lumps remain. Use 1 tablespoon of the oil to grease a rimmed sheet pan. Place the salmon filets, skin-side down, on the pan, leaving space between them; drizzle the salmon with 2 tablespoons of the oil. Sprinkle the spice mix evenly over the salmon.
    Prepare the Kale: In a medium bowl, using tongs, toss the kale with the remaining 2 tablespoons of oil, the minced garlic, and a pinch of salt. Arrange it all around (but not covering) the salmon; it's okay to pile it up a bit, as it will shrink significantly as it roasts.
    Place the pan on the lower-middle rack and roast for 12 to 14 minutes for medium-cooked salmon. (If you prefer your salmon medium-rare, cook 10 to 12 minutes. For well-done, cook 15 to 17 minutes.) Remove the pan from the oven and drizzle the honey over the fish. Then sprinkle the lime zest and juice over the fish. Serve immediately.", image_url: 'https://www.onceuponachef.com/images/2020/10/Sheet-Pan-Blackened-Salmon-760x988.jpg'}, {name: "Levain-Style Chocolate Chip Cookies", source: 'Serious Eats', recipe_url: 'https://www.seriouseats.com/recipes/2019/04/super-thick-chocolate-chip-cookie-recipe.html', servings: '8', total_prep_time: 780, intro: 'This style of ultra-thick chocolate chip cookie, popularized by the NYC bakery Levain, requires a dough with less sugar than flour, and more chocolate chips than sugar. These ratios keep the cookies thick, not cakey, with a flavor defined by the chocolate itself, so be sure to use the best-quality chips you can find.', ingredients: "4 ounces unsalted American butter (about 1/2 cup; 113g), softened to about 65°F (18°C)
    4 ounces light brown sugar (about 1/2 cup, firmly packed; 113g)
    3 1/2 ounces white sugar, preferably well toasted (about 1/2 cup; 100g)
    1/2 ounce vanilla extract (about 1 tablespoon; 15g)
    2 teaspoons (8g) Diamond Crystal kosher salt; for table salt, use about half as much by volume or the same weight (plus more for sprinkling, if desired)
    1 3/4 teaspoons baking powder
    1 teaspoon baking soda
    Pinch of grated nutmeg
    2 large eggs (about 3 1/2 ounces; 100g), straight from the fridge
    10 ounces all-purpose flour (about 2 1/4 cups, spooned; 283g), such as Gold Medal
    15 ounces assorted chocolate chips (about 2 1/2 cups; 425g), not chopped chocolate; see note
    8 1/2 ounces raw walnut pieces or lightly toasted pecan pieces (shy 1 3/4 cups; 240g)", instructions: "To Prepare the Dough: Combine butter, light brown sugar, white sugar, vanilla extract, salt, baking powder, baking soda, and nutmeg in the bowl of a stand mixer fitted with a paddle attachment.

    Mix on low to moisten, then increase speed to medium and beat until soft, fluffy, and pale, about 8 minutes; halfway through, pause to scrape bowl and beater with a flexible spatula. With mixer running, add eggs one at a time, letting each incorporate fully before adding the next. Reduce speed to low, then add the flour all at once. When flour is incorporated, add chocolate chips and nuts and keep mixing until dough is homogeneous.
    
    Divide dough into 8 equal portions (about 6 ounces/170g each) and round each into a smooth ball. Wrap in plastic and refrigerate at least 12 hours before baking; if well protected from air, the dough can be kept in the fridge up to 1 week.
    
    To Bake: Adjust oven rack to middle position and preheat to 350°F (180°C). Line an aluminum half-sheet pan with parchment paper. When the oven comes to temperature, arrange up to 4 portions of cold dough on prepared pan, leaving ample space between them to account for spread. If you like, sprinkle with additional salt to taste.
    
    Bake until cookies are puffed and lightly brown, about 22 minutes or to an internal temperature of between 175 and 185°F (79 and 85°C). The ideal temperature will vary from person to person; future rounds can be baked more or less to achieve desired consistency.
    
    Cool cookies directly on baking sheet until no warmer than 100°F (38°C) before serving. Enjoy warm, or within 12 hours; these cookies taste best when freshly baked (see Make-Ahead and Storage).", image_url: 'https://www.seriouseats.com/2019/02/20190131-levain-style-chocolate-chip-cookies-vicky-wasik-20.jpg'}
])

Tag.create!([
  {name: "Side | Starchy"},
  {name: "Side | Veggie"},
  {name: "Entree | Seafood"},
  {name: "Entree | One-Pan Meal"},
  {name: "Dessert | Chocolate"},
  {name: "Dessert | Cookies"},
])

RecipeTag.create!([
  {recipe_id: 1, tag_id: 1},
  {recipe_id: 2, tag_id: 2},
  {recipe_id: 3, tag_id: 3},
  {recipe_id: 3, tag_id: 4},
  {recipe_id: 4, tag_id: 5},
  {recipe_id: 4, tag_id: 6}
])