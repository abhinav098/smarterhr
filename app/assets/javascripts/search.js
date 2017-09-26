document.addEventListener("turbolinks:load", function(){
  $input = $("[behavior='autocomplete']")

  var options = {
    getValue: "name",
    url:function(phrase){
      return "/searches.json?q=" + phrase;
    },
    categories:[
      {
        listLocation:"accesses",
        header: "<b>Accesses</b>",
      }
      // {
      //   listLocation:"equipment",
      //   header: "<b>Equipment</b>",
      // }
    ],
    list:{
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }
  $input.easyAutocomplete(options)
});
