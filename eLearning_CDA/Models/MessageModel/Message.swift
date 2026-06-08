//
//  Message.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 04/06/2026.
//

import Foundation
import SwiftUI

struct Message: Identifiable {
    //identifiant unique automatique
    let id = UUID()
    let name: String
    let lastMessage: String
    let image: String
}

