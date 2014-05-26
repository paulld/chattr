assert = undefined
assert = require("assert")
suite "in-Chatroom functions", ->




  test "delRoom function deletes room (if ", (done, client, server) ->
    client["eval"]->
      server["eval"]->
        Chatrooms.insert
          createdBy: "testName"
        emit "room", room

      Accounts.createUser
        name: "testName"
        password: "123456"





    server.once 'createdChatroom', (sampleChatroom) ->
      assert.equal sampleChatroom.name, "testName"
      assert.equal sampleChatroom.description, "testDescription"
      done()

    server.once 'createdChatroom', (sampleChatroom) ->
      assert.equal sampleChatroom.name, "testName"
      assert.equal sampleChatroom.description, "testDescription"
      done()

  # test ".insert for Chatrooms", (done, server)->
  #   server["eval"](->

  #     chatroomId = Chatrooms.insert {name: "testName", description: "testDescription"}
  #     sampleChatroom = Chatrooms.findOne {_id: chatroomId}
  #     emit('createdChatroom', sampleChatroom)

  #   ).once 'createdChatroom', (sampleChatroom) ->
  #     assert.equal sampleChatroom.name, "testName"
  #     assert.equal sampleChatroom.description, "testDescription"
  #     done()





