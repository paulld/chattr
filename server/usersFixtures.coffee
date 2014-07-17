if Meteor.users.find().count() is 0
  Meteor.users.insert
    _id: "rdHcNRTny7Y5ZZckX"
    profile:
      name: "Cranky Old Man"
    services:
      github:
        id: 7147135
        accessToken: "c79090e86822952cb7bd52deae5db24bc66b8160"
        email: "coolman@gnail.com"
        username: "victorleungtw"

  Meteor.users.insert
    _id: "muo5sAqL6aPuRGnGv"
    profile:
      name: "Crashing"
    services:
      github:
        id: 7147136
        accessToken: "c79090e86822952cb7bd52deae5db24bc66b8160"
        email: "haha@gail.com"
        username: "dotZak"

  Meteor.users.insert
    _id: "zKzzxzWW5RZQWfRnm"
    profile:
      name: "Creator Yim"
      belongsToRooms: [
        "Qvs4QQxJEzYa9NWM1"
        "Qvs4QQxJEzYa9NWM2"
        "Qvs4QQxJEzYa9NWM3"
        "Qvs4QQxJEzYa9NWM4"
      ]
    services:
      github:
        id: 3065452
        accessToken: "bdc06d8cee919cd12a048b993e8b3c55188343e3"
        email: "smartkid@coolmail.com"
        username: "MichaelYim"

  Meteor.users.insert
    _id: "GAKHC3m5CpTfHdgJG"
    profile:
      name: "Paul"
      belongsToRooms: [
        "Qvs4QQxJEzYa9NWM1"
        "Qvs4QQxJEzYa9NWM2"
        "Qvs4QQxJEzYa9NWM3"
        "Qvs4QQxJEzYa9NWM4"
      ]
    services:
      github:
        id: 7286592
        accessToken: "ed0fd4e640e1dbda8add1f03e8b617c3894a06b0"
        email: "paul@iamsocool.com"
        username: "paulld"

  Meteor.users.insert
    _id: "XKMr59YMPey8SxPEe"
    profile:
      belongsToRooms: [
        "Qvs4QQxJEzYa9NWM1"
        "Qvs4QQxJEzYa9NWM2"
        "Qvs4QQxJEzYa9NWM3"
        "Qvs4QQxJEzYa9NWM4"
      ]
      name: "annieccheung"
    services:
      github:
        id: 6646365
        accessToken: "d69ec903c62f4c71601439b1c5e3e3d63037d5ae"
        email: "annie@iamsocool.com"
        username: "annieccheung"
