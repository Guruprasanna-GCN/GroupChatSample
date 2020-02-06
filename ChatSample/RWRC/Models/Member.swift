//
//  Member.swift
//  RWRC
//
//  Created by Guruprasanna on 06/02/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import FirebaseFirestore

struct Member {
  
  let id: String?
  let isAdmin: Bool
  
  init(id: String, isAdmin: Bool) {
    self.id = id
    self.isAdmin = isAdmin
  }
  
  init?(document: QueryDocumentSnapshot) {
    let data = document.data()
    
    guard let id = data["id"] as? String else {
      return nil
    }
    
    self.id = id
    guard let isAdmin = data["isAdmin"] as? Bool else {
      return nil
    }
    self.isAdmin = isAdmin
  }
  
}

extension Member: DatabaseRepresentation {
  
  var representation: [String : Any] {
    var rep: [String : Any] = ["isAdmin": isAdmin]
    
    if let id = id {
      rep["id"] = id
    }
    return rep
  }
  
}
