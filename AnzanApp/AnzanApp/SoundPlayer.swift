//
//  SoundPlayer.swift
//  AnzanApp
//
//  Created by 花里紗世 on 2022/11/02.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    // 正解の音源データを読み込み
    private let correctDeta = NSDataAsset(name: "correct")!.data
    // 正解プレイヤーの変数
    private var correctPlayer: AVAudioPlayer!
    func correctPlay() {
        do {
            correctPlayer = try AVAudioPlayer(data: correctDeta)
            correctPlayer.play()
        } catch {
            print("正解で、エラーが発生しました！")
        }
    }
}
