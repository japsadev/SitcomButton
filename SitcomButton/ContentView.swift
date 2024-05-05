//
//  ContentView.swift
//  SitcomButton
//
//  Created by japsa on 5.05.2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    // Ses dosyasını tanımla
    let laughSound = "laugh" // Ses dosyasının adını değiştirmeyi unutmayın

    var body: some View {
        VStack {
            Button(action: {
                // Butona basıldığında sesi çal
                playSound(sound: laughSound, type: "mp3")
            }) {
//                Text("Play")
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(width: 50,height: 50)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.blue, lineWidth: 4)
                                    .shadow(color: .blue, radius: 10, x: 0, y: 5)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            )
//                    )
            }
        }
    }

    // Ses çalma fonksiyonu
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            let url = URL(fileURLWithPath: path)

            do {
                // Ses dosyasını çal
                let sound = try AVAudioPlayer(contentsOf: url)
                sound.play()
            } catch {
                print("Ses dosyasını çalarken hata oluştu: \(error.localizedDescription)")
            }
        } else {
            print("Ses dosyası bulunamadı.")
        }
    }
}

#Preview {
    ContentView()
}
