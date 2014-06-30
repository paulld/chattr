Meteor.methods
  updateProfileName: () ->
    if user = Meteor.user()
      # unless user.profile.name
      Meteor.users.update({_id:user._id}, {$set:{"profile.name":user.services.github.username}})