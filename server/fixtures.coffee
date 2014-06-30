if Chatrooms.find().count() is 0

  now = new Date().getTime()

  for i in [1..6] by 2
    Chatrooms.insert
      name: "Room " + i
      createdBy: "zKzzxzWW5RZQWfRnm"
      description: "room description"
      created: now - i * 3600 * 1000
      isPrivate: true
      isTemporary: false
      # roomTags:
      # roomMembers:

  for i in [2..7] by 2
    Chatrooms.insert
      name: "Room " + i
      createdBy: "muo5sAqL6aPuRGnGv"
      description: "room description"
      created: now - i * 3600 * 1000
      isPrivate: true
      isTemporary: true
      # roomTags:
      # roomMembers: