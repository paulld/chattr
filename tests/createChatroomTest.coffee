assert = undefined
assert = require("assert")
suite "Chatrooms", ->
  test "chatroom collection exists", (done, server) ->
    server["eval"](->
      collection = undefined
      collection = Chatrooms.find().fetch()
      emit "collection", collection

    ).once "collection", (collection) ->
      assert.equal collection.length, 0
      done()




  test "addRoom function creates chatroom with correct input", (done, client, server) ->
    client["eval"](->
      roomInfo =
        name: "testName"
        description: "testDescription"

      Meteor.call "addRoom", roomInfo
      addedNewChatroom = (post) ->
        emit('post', post)

      Chatrooms.find().observe
        added: addedNewChatroom

    ).once "post", (post) ->
      assert.equal post.name, "testName"
      assert.equal post.description, "testDescription"
      done()


    server.once "post", (post) ->
      assert.equal post.name, "testName"
      assert.equal post.description, "testDescription"
      done()

  test ".insert for Chatrooms", (done, server)->

    server["eval"](->
      Chatrooms.insert {name: "testName", description: "testDescription"}
      addedNewChatroom = (post) ->
        emit('post', post)

      Chatrooms.find().observe
        added: addedNewChatroom



    ).once 'post', (post) ->
      assert.equal post.name, "testName"
      assert.equal post.description, "testDescription"
      done()





