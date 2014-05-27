assert = undefined
assert = require("assert")
suite "in-Chatroom functions", ->
  test "delRoom function deletes room (if user is owner of room) ", (done, client, server) ->
    client["eval"] ->

      cid = Chatrooms.insert
        createdBy: "testName"


      userIDcreated = Meteor.users.insert
        _id: "muo5sAqL6aPuRGnBB"
        profile:
          name: "testName"
        # services:
        #   github:
        #     id: 7237136
        #     accessToken: "c79012e86822952cb7bd52deae5db24bc66b8160"
        #     email: "testName@gmail.com"
        #     username: "jimmyboyboy"

      Inputs =
        roomname : cid
        owner: "testName"
        userID : userIDcreated

      Meteor.call "deleteRoom", Inputs
      deleted = Chatrooms.findOne({_id: cid})
      emit('deleted', deleted )

    client.once 'deleted', (deleted) ->
      assert.equal deleted, undefined
      done()


