//　2{10{100}10}2=?
//  AnswerView.swift
//  AnzanApp
//
//  Created by 花里紗世 on 2022/07/12.
//

import SwiftUI

struct AnswerView: View {
    /// 足し算の左辺の値
    let numberLeft: Double
    /// 足し算の右辺の値
    let numberRight: Double
    /// TextFieldで入力した内容をInt型に変換した値
    let answerNumber: Double
    //　計算した結果
    @State private var calculationNumber = 0.00
    /// 結果を格納する変数
    @State private var resultMessage: String = ""
    private let soundPlayer = SoundPlayer()
    var operatorModel: Operator
    var body: some View {
        ZStack {
            // 背景
                Image("background")
                .resizable()
            // アスペクト比を調整
                .aspectRatio(contentMode: .fit)
            VStack {
                // 出題内容とその入力結果を表示
                Text(String(format: "%.0f",numberLeft)
                     + "\(operatorModel.rawValue)"
                     + String(format: "%.0f",numberRight)
                     + "=\(String(format: "%.2f",answerNumber))")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                //　答えを表示
                Text("答えは \(String(format: "%.2f",calculationNumber))")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                // 結果を表示
                Text(resultMessage)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .onAppear() {
            let result = operatorModel.checkAnswer(numberLeft: numberLeft, numberRight: numberRight, answerNumber: answerNumber)
            if result.flag {
                resultMessage = "大正解!"
                soundPlayer.correctPlay()
            } else {
                resultMessage = "不正解"
                soundPlayer.incorrectPlay()
            }
            calculationNumber = result.correct
        }
    }
}

//struct AnswerView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnswerView()
//    }
//}

