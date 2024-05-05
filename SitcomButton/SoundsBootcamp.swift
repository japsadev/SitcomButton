//
//  SoundsBootcamp.swift
//  SitcomButton
//
//  Created by japsa on 5.05.2024.
//

import SwiftUI
import AVKit

class SoundManager {

static let instance = SoundManager()

    var player: AVAudioPlayer?

    func playSound() {

        guard let url = Bundle.main.url(forResource: "laugh", withExtension: ".mp3") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error playing sound. \(error.localizedDescription)")
        }
    }

}

struct SoundsBootcamp: View {

   var soundManager = SoundManager()
    @State private var isPressed = false

    var body: some View {
        VStack {
            Button("Sitcom Button", action: {
                SoundManager.instance.playSound()
            })
            .buttonStyle(MyButtonStyle(isPressed: isPressed))
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in

                        isPressed = true
                    }
                    .onEnded { _ in

                        isPressed = false
                    }
            )
        }
    }
    //MARK: Custom Button
    struct MyButtonStyle: ButtonStyle {
        var isPressed: Bool

        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .padding()
                .background(
                    ZStack{
                        Capsule()
                            .fill(Color.blue)
                            .stroke(Color.black, lineWidth: 3)
                            .offset(y:configuration.isPressed ? 0 : 10)
                        Capsule()
                            .fill(Color.white)
                            .stroke(Color.black, lineWidth:3)
                    }
                )
                            .offset(y:configuration.isPressed ? 10 : 0)
        }
    }
}


#Preview {
    SoundsBootcamp()
}
