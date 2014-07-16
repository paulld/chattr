Template.usersList.rendered = ->
  $("#e2_2").select2({placeholder: "Select members", dropdownCssClass: "bigdrop"})
  
Template.usersList.helpers
  users:->
    _.reject Meteor.users.find().fetch(), (user) ->
      user._id is Meteor.userId()
