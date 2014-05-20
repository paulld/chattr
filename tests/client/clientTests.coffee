describe "sanity test", ->
  it "is always true", ->
    chai.expect(true).to.be.true

describe "chatroom", ->
  describe "chatroom creation", ->
    it "saves name and description", ->
      #Template.createChatroom.events["submit form"]()
      console.log Template.createChatroom.events.val()
      chai.assert.property(Template.createChatroom.events, 'submit form')
      #chai.assert(console.logcalledWith('whatever'))