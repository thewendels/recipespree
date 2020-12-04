// global vue 
var app = new Vue({
  el: "#app",
  data: function() {
    return{
      recipe: null,
      newId: null,
    }
  },
  methods: {
    loadRecipe: function() {
      axios
        .get(`http://localhost:3000/api/recipes/${this.newId}`
        )
        .then(response => {
          let recipe = response.data;
          this.recipe = recipe;
          console.log(recipe);
        });
      }
    }
  })