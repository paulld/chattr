assert = require("assert")

suite "Chatrooms", ->
 test "room collection exists", (done, server) ->
   server["eval"](->
     collection = undefined
     collection = Chatrooms.find().fetch()
     emit "collection", collection

   ).once "collection", (collection) ->
     assert.equal collection.length, 2
     done()

suite "User Authorization", ->
   test "access denied without login", (done, server, client) ->
     client.eval ->
       doc = Meteor.user()
       emit "doc", doc

     client.once "doc", (doc) ->
       assert.equal doc, null
       done()

   # test "access granted for loggedin users", (done, server, client) ->
   #   client.eval ->
   #     Meteor.loginWithGithub({requestPermissions: ['user', 'public_repo']}, ->
   #       doc = Meteor.user()
   #       emit "doc", doc

   #   client.once "doc", (doc) ->
   #     assert.equal doc, !null
   #     done()