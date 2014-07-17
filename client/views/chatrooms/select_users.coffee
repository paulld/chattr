Template.selectUsers.rendered = ->
  $("#e2_2").select2({placeholder: "Select members", dropdownCssClass: "bigdrop"})
  
Template.selectUsers.helpers
  users:->
    _.reject Meteor.users.find().fetch(), (user) ->
      user._id is Meteor.userId()
