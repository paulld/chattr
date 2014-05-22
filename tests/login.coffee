assert = require("assert")

suite "User Authorization", ->
  test "access denied without login", (done, server, client) ->
    client.eval ->
      doc = Meteor.user()
      emit "done", doc

    client.once "done", (doc) ->
      assert.equal doc, null
    done()
