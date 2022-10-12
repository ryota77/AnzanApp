// 2{10{100}10}2=?
//  ContentView.swift
//  AnzanApp
//
//  Created by 花里紗世 on 2022/07/01.
//

import SwiftUI
enum Operator: String, CaseIterable {
    case plus = "+"
    case muinus = "-"
    case multiply = "×"
    case division = "÷"
    func checkAnswer(numberLeft: Double, numberRight: Double, answerNumber: Double) -> (flag: Bool,correct: Double) {
        var isCorrect = false
        var calculationNumber = 0.0
        
        switch self {
        case .plus: calculationNumber = numberLeft + numberRight
        case .muinus: calculationNumber = numberLeft - numberRight
        case .multiply: calculationNumber = numberLeft * numberRight
        case .division: calculationNumber = numberLeft / numberRight
        }
        
        calculationNumber = floor(calculationNumber * 10) / 10
        if calculationNumber == answerNumber {
            isCorrect = true
        }
        return (isCorrect, calculationNumber)
    }
    
    
    mutating func random() {
        self = Self.allCases.randomElement() ?? .plus
    }
}
struct ContentView: View {
    ///　足し算の左辺の値を格納する
    @State private var numberLeft = 0.0
    /// 足し算の右辺の値を格納する
    @State private var numberRight = 0.0
    /// TextFieldで入力した内容を格納する
    @State private var answerNumber: String = ""
    ///答え画面(AnswerView)の表示管理をするフラグ
    @State private var isShowAnswerView = false
    /// TextFieldで入力した内容をInt型に変換した値を格納する
    @State private var inputNumber = 0.0
    @State private var operatorModel = Operator.plus
    var body: some View {
        ZStack {
            // 背景
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                HStack {
                    Text("\(numberLeft) \(operatorModel.rawValue)  \(numberRight) =")
                    // 文字サイズを大
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    TextField("答えは？", text: $answerNumber)
                    //　TextFiledのスタイルを指定
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //　キーボードをテンキーにする
                        .keyboardType(.decimalPad)
                    // 幅を 100
                        .frame(width: 100)
                }
                Button(action: {
                    if let answerNumber = Double(answerNumber) {
                        inputNumber = answerNumber
                        
                        isShowAnswerView.toggle()
                        print(inputNumber)
                    }
                }) {
                    Text("答える")
                    // 文字サイズを大
                        .font(.largeTitle)
                    //　余白を入れる
                        .padding()
                    // 背景を白透明にする
                        .background(Color.white.opacity(0.8))
                }
                
            }
        }
        .sheet(isPresented: $isShowAnswerView, content: {
            // 答えの画面を呼び出し
            AnswerView(numberLeft: numberLeft,
                       numberRight: numberRight,
                       answerNumber: inputNumber, operatorModel: operatorModel)
        }) // .sheetはここまで
        .onChange(of: isShowAnswerView, perform: { isShowAnswerView in
            if isShowAnswerView == false {
                reset()
            }
        })
        // 画面起動時にここが動く
        .onAppear() {
            reset()
        }
    }
    // クイズをランダムに生成
    private func reset() {
        numberLeft = Double(Int.random(in: 1...9))
        numberRight = Double(Int.random(in: 1...9))
        operatorModel.random()
        answerNumber = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
