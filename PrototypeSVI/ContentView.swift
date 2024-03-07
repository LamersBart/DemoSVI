//
//  ContentView.swift
//  PrototypeSVI
//
//  Created by Bart Lamers on 05/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Haptics()
                .tabItem {
                Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                Text("Haptics")
              }

            Gesture()
                .tabItem {
                 Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
                 Text("Gesture")
               }
            
            SpeechToText()
                .tabItem {
                 Image(systemName: "mic.fill")
                 Text("Speech to text")
               }
            
            Movement()
                .tabItem {
                 Image(systemName: "gyroscope")
                 Text("Movement")
               }
        }
    }
}

#Preview {
    ContentView()
}
