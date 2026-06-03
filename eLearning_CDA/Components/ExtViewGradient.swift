//
//  ExtViewGradient.swift
//  eLearning_CDA
//
//  Created by apprenant92 on 01/06/2026.
//

import SwiftUI

struct ExtViewGradient: View {
    @State private var showTextField = false
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.greenDark, .greenSemiDark, .greenSemiLight, .greenLight]), startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ExtViewGradient()
}
