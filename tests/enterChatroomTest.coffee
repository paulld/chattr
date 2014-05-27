# test that a user can select and enter a chatroom and that they are in the correct chatroom.

# assert = undefined
# assert = require("assert")

# suite "Chatrooms", ->
#   test "user can enter a chatroom from the chatroom list", (done, client) ->
#     client["eval"](->
#       chatroomId = Chatrooms.findOne {_id: chatroomId}
#       emit(chatroomId)
#     ).once

#     done()