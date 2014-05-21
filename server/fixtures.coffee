if Chatrooms.find().count() is 0
  now = new Date().getTime()

  for i in [1..6]
    Chatrooms.insert
      name: 'Room' + i
      createdBy: 'Carl Sagan'
      chatroomDescription: "room description"
      createdOn: now - i * 3600 * 1000
      isPrivate: true
      isEphemeral: false
      # roomTags:
      # roomMembers:

  # Chatrooms.insert
  #   chatroomId: "GESKmxG8cf9AiiRcF"
  #   name: "Chit Chat"
  #   createdBy: "Gerald"
  #   created: now - 7 * 3600 * 1000
  #   isPrivate: false
  #   isEphemeral: true
  #   description: "A room for chit chatting"
  #   # roomMembers:
  #   # roomTags:

  # Chatrooms.insert
  #   chatroomId: "zkQJM3awPdXD7dogv"
  #   name: "Serious Talk"
  #   createdBy: "Marcella"
  #   created: now - 1 * 3600 * 1000
  #   isPrivate: false
  #   isEphemeral: false
  #   description: "Really really important things"
  #   # roomMembers:
  #   # roomTags:
