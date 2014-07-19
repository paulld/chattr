if Chatrooms.find().count() is 0

  now = new Date().getTime()

  Chatrooms.insert
    _id: "Qvs4QQxJEzYaROOM1"
    name: "Room 1"
    createdBy: "GAKHC3m5CpTfHdgJG"
    description: "Paul (creator), Annie (invited), Old Man (invited)"
    createdAt: now - 4800 * 1000
    isPrivate: true
    isTemporary: true
    roomMembers: ["GAKHC3m5CpTfHdgJG", "rdHcNRTny7Y5ZZckX", "XKMr59YMPey8SxPEe"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYaROOM2"
    name: "Room 2"
    createdBy: "XKMr59YMPey8SxPEe"
    description: "Annie (creator), Paul (invited), Old Man (invited)"
    createdAt: now - 3600 * 1000
    isPrivate: true
    isTemporary: true
    roomMembers: ["GAKHC3m5CpTfHdgJG", "rdHcNRTny7Y5ZZckX", "XKMr59YMPey8SxPEe"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYaROOM3"
    name: "Room 3"
    createdBy: "GAKHC3m5CpTfHdgJG"
    description: "Paul (creator), Annie (invited), Old Man (invited)"
    createdAt: now - 2400 * 1000
    isPrivate: true
    isTemporary: false
    roomMembers: ["GAKHC3m5CpTfHdgJG", "rdHcNRTny7Y5ZZckX", "XKMr59YMPey8SxPEe"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYaROOM4"
    name: "Room 4"
    createdBy: "XKMr59YMPey8SxPEe"
    description: "Annie (creator), Paul (invited), Old Man (invited)"
    createdAt: now - 1200 * 1000
    isPrivate: true
    isTemporary: false
    roomMembers: ["GAKHC3m5CpTfHdgJG", "rdHcNRTny7Y5ZZckX", "XKMr59YMPey8SxPEe"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYaROOM5"
    name: "Room 5"
    createdBy: "rdHcNRTny7Y5ZZckX"
    description: "Old Man (creator), Paul (invited)"
    createdAt: now - 600 * 1000
    isPrivate: true
    isTemporary: false
    roomMembers: ["rdHcNRTny7Y5ZZckX", "GAKHC3m5CpTfHdgJG"]

  Chatrooms.insert
    _id: "Qvs4QQxJEzYaROOM6"
    name: "Room 6"
    createdBy: "rdHcNRTny7Y5ZZckX"
    description: "Old Man (creator), Annie (invited)"
    createdAt: now - 500 * 1000
    isPrivate: true
    isTemporary: false
    roomMembers: ["rdHcNRTny7Y5ZZckX", "XKMr59YMPey8SxPEe"]