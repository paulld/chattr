# assert = undefined
assert = require("assert")
suite "Chatrooms", ->
  test "chatroom collection exists", (done, server) ->
    server["eval"](->
      collection = undefined
      collection = Chatrooms.find().fetch()
      emit "collection", collection

    ).once "collection", (collection) ->
      assert.equal collection.length, 6
      done()




  test "addRoom function creates chatroom with correct input", (done, client, server) ->
    client["eval"](->
      roomInfo =
        name: "testName"
        description: "testDescription"

      chatroomId = Meteor.call "addRoom", roomInfo
      sampleChatroom = Chatrooms.findOne {_id: chatroomId}
      emit('createdChatroom', sampleChatroom)

    ).once 'createdChatroom', (sampleChatroom) ->
      assert.equal sampleChatroom.name, "testName"
      assert.equal sampleChatroom.description, "testDescription"
      done()

    server.once 'createdChatroom', (sampleChatroom) ->
      assert.equal sampleChatroom.name, "testName"
      assert.equal sampleChatroom.description, "testDescription"
      done()

  test ".insert for Chatrooms", (done, server)->
    server["eval"](->

      chatroomId = Chatrooms.insert {name: "testName", description: "testDescription"}
      sampleChatroom = Chatrooms.findOne {_id: chatroomId}
      emit('createdChatroom', sampleChatroom)

    ).once 'createdChatroom', (sampleChatroom) ->
      assert.equal sampleChatroom.name, "testName"
      assert.equal sampleChatroom.description, "testDescription"
      done()





