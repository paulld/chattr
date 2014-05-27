assert = undefined
asser = require('assert')

suite "Post messages to chatroom", ->
  # test "Chatroom has messages", (server, done) ->
  #   server["eval"](->
  #     messages = undefined
  #     messages = Messages.find().fetch()
  #     emit "messages", messages

  #   ).once "messages", (messages) ->
  #     assert.equal messages.length, 1
  #     done()

  test "User can insert a new message to the chatroom", (done, client, server) ->
    client["eval"]



  # ltest "Post button inserts a new message to the chatroom"