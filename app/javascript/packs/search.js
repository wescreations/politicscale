document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")


  var options = {

    getValue: "name",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "candidates",
        header: "<strong>Candidates</strong>",
              },
      {
        listLocation: "national_races",
        header: "<strong>National Races</strong>",
      }, 
      {
        listLocation: "state_races",
        header: "<strong>State Races</strong>",
      }
    ],



    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      },
      showAnimation: {
type: "fade", //normal|slide|fade
time: 700,
callback: function() {}
},

hideAnimation: {
type: "slide", //normal|slide|fade
time: 700,
callback: function() {}
}
    }

  }

  $input.easyAutocomplete(options)
});