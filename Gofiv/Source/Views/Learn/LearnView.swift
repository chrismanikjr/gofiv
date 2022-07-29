//
//  LearnView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct LearnView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selected = 0
    @State var timerCount: Int = 0
    @State var isCount : Bool = true
    @State var timerCountString = "00 : 00 : 00"
    @State var noteField: String = ""
    
    @State var totalQuestion: Int = 10
    @State var totalAnswer: Int = 0
    @State var currentProgress: CGFloat = 0.0


    
    var body: some View {
        VStack(spacing: 8){
            if self.selected == 0{
                LearnTimeView(timerCount: $timerCount, isCount: $isCount, timerCountString: $timerCountString)
            }
            else if self.selected == 1{
                NoteView(noteField: $noteField)
            }else{
                PracticeView(currentProgress: $currentProgress, totalQuestion: $totalQuestion, totalAnswer: $totalAnswer)
            }
            Spacer()
            Topbar(selected: self.$selected).padding(.bottom)
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}

struct Topbar : View {
    
    @Binding var selected : Int
    
    var body : some View{
        
        HStack{
            Button(action: {
                self.selected = 0
                
            }) {
                Image(systemName: "stopwatch")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.vertical,12)
                    .padding(.horizontal,30)
                    .background(self.selected == 0 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 0 ? .blue : .gray)
            
            Button(action: {
                self.selected = 1
            }) {
                Image(systemName: "note.text")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.vertical,12)
                    .padding(.horizontal,30)
                    .background(self.selected == 1 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 1 ? .blue : .gray)
            Button(action: {
                self.selected = 2
            }) {
                Image(systemName: "laptopcomputer")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .padding(.vertical,12)
                    .padding(.horizontal,30)
                    .background(self.selected == 2 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 2 ? .blue : .gray)
        }.padding(8)
            .background(Color("BgrBlueColor").opacity(0.8))
            .clipShape(Capsule())
            .animation(.linear, value: 1)
    }
}
