// global vue 
var app = new Vue({
  el: "#app",
  data: function() {
    return{
      recipes: []
    }
  },
  methods: {
    loadRecipes: function() {
      axios
        .get("http://localhost:3000/api/recipes")
        .then(response => {
          let recipes = response.data;
          this.recipes = recipes;
          console.log(recipes);
        });
    }
  },
  mounted: function() {
    this.loadRecipes();
  }
})