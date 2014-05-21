var assert;

assert = require("assert");

suite("Chatrooms", function() {
  test("room collection exists", function(done, server) {
    server["eval"](function() {
      var collection;
      collection = Chatrooms.find().fetch();
      emit("collection", collection);
    }).once("collection", function(collection) {
      assert.equal(collection.length, 0);
      done();
    });
  });
  test("create new chatroom", function(done, client, server) {

    client["eval"](function() {
      roomInfo = {
        name: "testName",
        description: "testDescription"
      } ;
      Meteor.call('addRoom', roomInfo);

      var collection = Chatrooms.find().fetch();

      emit("collection", collection);
    }).once("collection", function(collection) {
      assert.equal(collection.length, 1);
      done();
    });


    server.once("collection", function(collection) {
      assert.equal(Chatrooms.find().fetch().length, 1);
      done();
    });
  });
});
