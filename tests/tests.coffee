assert = require("assert")

suite "User Authorization", ->
  test "access denied without login", (done, server, client) ->
    client.eval ->
      docs = Meteor.user()
      emit "docs", doc

    client.once "docs", (doc) ->
      assert.equal doc.length, "0"
      done()

  test "access granted for loggedin users", (done, server, client) ->
    client.eval ->
      Meteor.loginWithGithub({requestPermissions: ['user', 'public_repo']}, ->
        Chatrooms.insert name: "testing"
        emit "docs", doc