//
//  Sounds.swift
//  SitcomButton
//
//  Created by japsa on 5.05.2024.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()

    var player: AVAudioPlayer?

    public func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}
struct Sounds: View {
    @State private var isPressed = false

    // Buton isimleri ve ses dosyalarını içeren bir dizi oluşturun
    let buttons = [
        ("Sitcom Laugh", "laugh"),
        // Diğer butonlar buraya eklenebilir
    ]

    var body: some View {
        VStack(spacing: 20) {
            ForEach(buttons.indices, id: \.self) { index in
                Button(buttons[index].0, action: {
                    // Her butona göre uygun sesi çal
                    SoundManager.instance.playSound(soundName: buttons[index].1)
                })
                .buttonStyle(MyButtonStyle(isPressed: isPressed))
            }
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    var isPressed: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .padding()
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.blue)
                        .stroke(Color.black, lineWidth: 3)
                        .offset(y: configuration.isPressed ? 0 : 10)
                    Capsule()
                        .fill(Color.white)
                        .stroke(Color.black, lineWidth: 3)
                }
            )
            .offset(y: configuration.isPressed ? 10 : 0)
    }
}

#Preview {
    Sounds()
}
