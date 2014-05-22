assert = require("assert")

suite "User Authorization", ->
  test "access denied without login", (done, server, client) ->
    client.eval ->
      doc = Meteor.user()
      emit "doc", doc

    client.once "doc", (doc) ->
      assert.equal doc, null
    done()

  test "access granted for loggedin users", (done, server, client) ->
    client.eval ->
      doc = Meteor.loginWithGithub
      emit "doc", doc

    client.once "doc", (doc) ->
      assert.equal doc, true
    done()