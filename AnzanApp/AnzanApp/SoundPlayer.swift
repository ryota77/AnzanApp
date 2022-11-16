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
    //　不正解の音源データを読み込み
    private let incorrectData = NSDataAsset(name: "incorrect")!.data
    //　不正解用プレイヤーの変数
    private var incorrectPlayer: AVAudioPlayer!
    // 正解の音を鳴らすメソッド
    func correctPlay() {
        do {
            correctPlayer = try AVAudioPlayer(data: correctDeta)
            correctPlayer.play()
        } catch {
            print("正解で、エラーが発生しました！")
        }
    }
    // 不正解の音を鳴らすメソッド
    func incorrectPlay() {
        do {
            // 不正解用のプレイヤーに、音源ファイル名を指定
            incorrectPlayer = try AVAudioPlayer(data: incorrectData)
            //不正解の音源再生
            incorrectPlayer.play()
        } catch {
            print("不正解で、エラーが発生しました！")
        }
    }
}
