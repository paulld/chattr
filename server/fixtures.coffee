if Chatrooms.find().count() is 0
 now = new Date().getTime()

 Chatrooms.insert
   # chatroomId:
   name: "Chit Chat"
   createdBy: "Gerald"
   created: now - 7 * 3600 * 1000
   isPrivate: false
   isEphemeral: true
   description: "A room for chit chatting"
   # roomMembers:
   # roomTags:

 Chatrooms.insert
   # chatroomId:
   name: "Serious Talk"
   createdBy: "Marcella"
   created: now - 1 * 3600 * 1000
   isPrivate: false
   isEphemeral: false
   description: "Really really important things"
   # roomMembers:
   # roomTags: