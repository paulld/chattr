if Chatrooms.find().count() is 0

  now = new Date().getTime()

  Chatrooms.insert
    _id: "Qvs4QQxJEzYa9NWM1"
    name: "Room 1"
    createdBy: "GAKHC3m5CpTfHdgJG"
    description: "room description 1"
    created: now - 1200 * 1000
    isPrivate: true
    isTemporary: true
    roomMembers: ["GAKHC3m5CpTfHdgJG", "zKzzxzWW5RZQWfRnm", "XKMr59YMPey8SxPEe"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYa9NWM2"
    name: "Room 2"
    createdBy: "XKMr59YMPey8SxPEe"
    description: "room description 2"
    created: now - 2400 * 1000
    isPrivate: true
    isTemporary: true
    roomMembers: ["GAKHC3m5CpTfHdgJG", "zKzzxzWW5RZQWfRnm", "XKMr59YMPey8SxPEe"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYa9NWM3"
    name: "Room 3"
    createdBy: "GAKHC3m5CpTfHdgJG"
    description: "room description 3"
    created: now - 3600 * 1000
    isPrivate: true
    isTemporary: false
    roomMembers: ["GAKHC3m5CpTfHdgJG", "zKzzxzWW5RZQWfRnm", "XKMr59YMPey8SxPEe"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYa9NWM4"
    name: "Room 4"
    createdBy: "XKMr59YMPey8SxPEe"
    description: "room description 3"
    created: now - 4800 * 1000
    isPrivate: true
    isTemporary: false
    roomMembers: ["GAKHC3m5CpTfHdgJG", "zKzzxzWW5RZQWfRnm", "XKMr59YMPey8SxPEe"]
