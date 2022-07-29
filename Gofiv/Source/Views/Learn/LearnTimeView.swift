//
//  LearnTimeView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct LearnTimeView: View {
    @Environment(\.rewind) var rewind

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var timerCount: Int
    @Binding var isCount : Bool
    @Binding var timerCountString: String
    @State var selected = 0
    @State var isPresent: Bool = false

    var body: some View {
        VStack {
            VStack {
                Text("Without self-discipline, Success is impossible period - Lou Holts")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                
                    .padding(30)
            }.background(Color("PrimaryColor").opacity(0.4))
                .cornerRadius(20)
                .padding()
            
            
            //MARK: - Timer
            Text("Focused")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            Text(timerCountString)
                .font(.system(size: 55))
                .fontWeight(.bold)
                .onReceive(timer, perform: { _ in
                    if isCount{
                        timerCount += 1
                        timerCountString = secondsToHoursMinutesSeconds(timerCount) as String
                    }else{
                        isCount =  false
                    }
                })
            //MARK: - Button Play
            HStack(spacing: 70) {
                Button {
                    isCount = false
                    timerCount = 0
                    isPresent = true
                    timerCountString = secondsToHoursMinutesSeconds(timerCount) as String
                } label: {
                    Image(systemName: "stop.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                }.fullScreenCover(isPresented: $isPresent, onDismiss: {
                    rewind.wrappedValue.toggle()
                } ,content: {
                    ResultLearnView(sessionModel: SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1 H", timeSession: "30 M", startTime: "Wed, 27 July 2022 at 20:00", endTime: "Wed, 27 July 2022 at 20:30", questionPractice: 2))
                })
                .frame(width: 70, height: 70)
                    .background(.black)
                    .cornerRadius(35)
                Button {
                    isCount = !isCount
                } label: {
                    if isCount{
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }else{
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                }.frame(width: 70, height: 70)
                    .background(Color("PrimaryColor"))
                    .cornerRadius(35)
            }.padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            

//            Topbar(selected: self.$selected).padding(.bottom)
        }
        
    }
    
    //    func startTimer(){
    //        if timerCount{
    //            timerCount = false
    //            timer.invalidate()
    //        }else{
    //            timerCount = true
    //            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: <#T##Bool#>)
    //        }
    //    }
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> NSString {
        return NSString(format: "%0.2d : %0.2d : %0.2d", seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}

//struct LearnTimeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LearnTimeView()
//    }
//}

