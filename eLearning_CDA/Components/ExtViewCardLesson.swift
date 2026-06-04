//
//  ExtViewCardLesson.swift
//  eLearning_CDA
//
//  Created by apprenant92 on 03/06/2026.
//

import SwiftUI

struct ExtViewCardLesson: View {
    var body: some View {
        VStack {
            VStack {
                Image(.cours1)
                    .resizable()
                    .scaledToFill()
//                    .clipShape(.)
                
            }
        }
        .frame(width: 175, height: 240)
        .background(.yellow)
        .cornerRadius(40)
    }
}

#Preview {
    ExtViewCardLesson()
}
