//
//  PracticeView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct PracticeView: View {
    @Binding var currentProgress: CGFloat
    @Binding var totalQuestion: Int
    @Binding var totalAnswer: Int
    var body: some View {
        VStack(spacing: 30){
            Text("Practice")
                .font(.system(size: 22))
                .fontWeight(.bold)
            
            //MARK: - Progress Bar
            VStack(alignment: .trailing) {
                Text("\(totalAnswer)/\(totalQuestion)")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("BgrBlueColor"))
                        .frame(width: (Helper.screenSize.width - 60) , height: 20)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                        .frame(width: (Helper.screenSize.width - 60) * currentProgress, height: 25)
                }
            }
            
            //MARK: - Question
            VStack {
                Text("How does MVVM compare to other UI patterns?")
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                    .padding(30)
            }.background(Color("PrimaryColor").opacity(0.4))
                .cornerRadius(20)
                .padding()
            
            VStack(spacing: 15) {
                Button {
                    if totalAnswer < totalQuestion{
                        totalAnswer += 1
                    }
                    currentProgress = CGFloat(totalAnswer) / CGFloat(totalQuestion)
                } label: {
                    Text("Next Question")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }.disabled(totalAnswer == totalQuestion)
                Button {
                    print("Finish")
                } label: {
                    Text("Finish")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .background(.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }.padding(EdgeInsets(top: 100, leading: 20, bottom: 0, trailing: 20))
            Spacer()
            
        }
    }
}

//struct PracticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        PracticeView()
//    }
//}
