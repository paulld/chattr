Template.selectTags.rendered = ->
  $("#e12").select2(
    placeholder: "Select a list of tags"
    tags:["HTML5", "CSS3", "jQuery", "CoffeeScript", "JavaScript", "Bootstrap", "Rails", "Ruby", "Slim"]
    tokenSeparators: [",", " "]
    minimumInputLength: 1
    )
