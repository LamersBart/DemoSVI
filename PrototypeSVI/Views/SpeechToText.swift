//
//  SpeechToText.swift
//  PrototypeSVI
//
//  Created by Bart Lamers on 05/03/2024.
//

import SwiftUI
import SwiftSpeech

struct SpeechToText: View {
    
    @State var isLocaleSettingPopoverPresented = false
    
    var locale = Locale(identifier: "nl-NL")
    
    @State private var text = "Tap om te spreken"
    
    public init(locale: Locale = .autoupdatingCurrent) {
        self.locale = locale
    }
    
    public init(localeIdentifier: String) {
        self.locale = Locale(identifier: "nl-NL")
    }
    
    
    public var body: some View {
        VStack(spacing: 35.0) {
            Text(text)
                .font(.largeTitle)
            SwiftSpeech.RecordButton()
                .swiftSpeechToggleRecordingOnTap(locale: self.locale, animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                .onRecognizeLatest(update: $text)
        }
        .navigationTitle("Basic")
        .onAppear {
            SwiftSpeech.requestSpeechRecognitionAuthorization()
        }
    }
}

struct Basic_Previews: PreviewProvider {
    static var previews: some View {
        SpeechToText()
    }
}
