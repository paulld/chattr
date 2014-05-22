assert = undefined
assert = require("assert")
suite "Chatrooms", ->
  test "room collection exists", (done, server) ->
    server["eval"](->
      collection = undefined
      collection = Chatrooms.find().fetch()
      emit "collection", collection

    ).once "collection", (collection) ->
      assert.equal collection.length, 0
      done()




  test "create new chatroom function", (done, client, server) ->
    client["eval"](->
      roomInfo =
        name: "testName"
        description: "testDescription"

      Meteor.call "addRoom", roomInfo
      collection = Chatrooms.find().fetch()
      emit "collection", collection

    ).once "collection", (collection) ->
      assert.equal collection.length, 1
      done()


    server.once "collection", (collection) ->
      assert.equal Chatrooms.find().fetch().length, 1
      done()

  test ".insert for Chatrooms", (done, server)->

    server["eval"](->
      Chatrooms.insert {name: "testName", description: "testDescription"}
      collection = Chatrooms.find().fetch()
      find = Chatrooms.findOne({name: "testName"})
      emit "collection", collection


    ).once "collection", (collection) ->
      assert.equal collection.length, 1
      done()




