Template.chatroomItem.events

  "click #delete-room": (e) ->
    e.preventDefault()
    if confirm "This room and its messages will be erased. Do you confirm DELETE?"
      inputs =
        roomId: @_id
        createdBy: @createdBy
        roomMembers: @roomMembers
      Meteor.call 'deleteRoom', inputs, (error, result) ->
        if error
          console.log(error)
        if result
          Router.go 'home'

  "click #quit-room": (e) ->
    e.preventDefault()
    if confirm "You won't have access to this room and its messages anymore. Do you confirm QUIT?"
      inputs =
        roomId: @_id
        createdBy: @createdBy
        roomMembers: @roomMembers
      Meteor.call 'quitRoom', inputs, (error, result) ->
        if error
          console.log(error)
        if result
          Router.go 'home'


Template.chatroomItem.helpers
  isOwner: ->
    Meteor.userId() is @createdBy

  isInvitedMember: ->
    false if _.contains( @roomMembers, Meteor.userId() )

  members: ->
    if @roomMembers
      roomMembers = _.map @roomMembers, (memberId) ->
        member = Meteor.users.findOne({_id: memberId})

  tagsList: ->
    if @tags then @tags.split(',') else []
