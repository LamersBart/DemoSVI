//
//  Motion.swift
//  PrototypeSVI
//
//  Created by Bart Lamers on 05/03/2024.
//

import SwiftUI
import CoreHaptics

struct HapticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .controlSize(.large)
    }
}

struct Haptics: View {
    @State var numberPressed: Int = 0
    var body: some View {
        VStack {
            if(numberPressed == 0){
                Text("Druk op me")
                    .font(.largeTitle)
                    .padding()
            }
            if(numberPressed >= 1){
                Text("Je hebt totaal: " + String(numberPressed) + " x gedrukt!")
                    .font(.title)
                    .padding()
            }
            Button() {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                numberPressed = numberPressed + 1
            } label: {
                Text("Light haptic feedback").frame(minWidth: 200)
            }
            .buttonStyle(HapticButtonStyle())
            
            Button() {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                numberPressed = numberPressed + 1
            } label: {
                Text("Medium haptic feedback").frame(minWidth: 200)
            }
            .buttonStyle(HapticButtonStyle())
            
            Button() {
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                numberPressed = numberPressed + 1
            } label: {
                Text("Heavy haptic feedback").frame(minWidth: 200)
            }
            .buttonStyle(HapticButtonStyle())
            
            Button() {
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                numberPressed = numberPressed + 1
            } label: {
                Text("Rigid haptic feedback").frame(minWidth: 200)
            }
            .buttonStyle(HapticButtonStyle())
            .padding(.bottom, 300)
            if(numberPressed >= 1) {
                Button() {
                    numberPressed = 0
                } label: {
                    Text("Reset counter").frame(minWidth: 200)
                }
                .buttonStyle(HapticButtonStyle())
            }
        }
    }
}


#Preview {
    Haptics()
}
