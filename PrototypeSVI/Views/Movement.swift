//
//  Movement.swift
//  PrototypeSVI
//
//  Created by Bart Lamers on 07/03/2024.
//

import SwiftUI

struct Movement: View {
    @State var message: String?
    @State var ShakeDetected: Bool = false
    
    var body: some View {
        VStack {
            Text(message ?? "Shake me!")
                .font(.title)
                .onShake {
                    message = "Shakie Shakie"
                    ShakeDetected = true
                }
            if(ShakeDetected) {
                Button() {
                    message = "Shake me!"
                    ShakeDetected = false
                } label: {
                    Text("Reset me")
                        .frame(minWidth: 250)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .controlSize(.large)
                        .font(.title)
                }
            }
        }
    }
}

extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

#Preview {
    Movement()
}
