Template.usersList.helpers
  users:->
    _.reject Meteor.users.find().fetch(), (user) ->
      user._id is Meteor.userId()
