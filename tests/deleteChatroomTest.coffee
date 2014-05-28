assert = require("assert")
suite "in-Chatroom functions", ->
  test "delRoom function deletes room (if user is owner of room) ", (done, client, server) ->
    client["eval"] ->

      userIDcreated = Meteor.users.insert
        _id: "muo5sAqL6aPuRGnBB"
        profile:
          name: "testName"

      cid = Chatrooms.insert
        createdBy: "muo5sAqL6aPuRGnBB"

      Inputs =
        roomname : cid
        owner: "muo5sAqL6aPuRGnBB"
        userID : "muo5sAqL6aPuRGnBB"

      Meteor.call "deleteRoom", Inputs
      deleted = Chatrooms.findOne({_id: cid})
      emit('deleted', deleted )

    client.once 'deleted', (deleted) ->
      assert.equal deleted, undefined
      done()


