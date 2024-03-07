//
//  Gesture.swift
//  PrototypeSVI
//
//  Created by Bart Lamers on 06/03/2024.
//

import SwiftUI

struct Gesture: View {
    @State var gesture: String?
    var body: some View {
        VStack {
       
            Text(gesture ?? "Maak een gebaar")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("⬆️ ⬇️ ➡️ ⬅️")
                .font(.largeTitle)
                .padding(.bottom, 200)
            Rectangle()
                .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onEnded { value in
                    switch(value.translation.width, value.translation.height) {
                        case (...0, -30...30):  gesture = "Swipe naar links ⬅️"
                        case (0..., -30...30):  gesture = "Swipe naar rechts ➡️"
                        case (-100...100, ...0):  gesture = "Swipe naar boven ⬆️"
                        case (-100...100, 0...):  gesture = "Swipe naar beneden ⬇️"
                        default:  gesture = "Geen idee... ❌"
                    }
                }
            )
        }
    }
}

#Preview {
    Gesture()
}
