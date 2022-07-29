//
//  GoalDetailView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct GoalDetailView: View {
    var goalDetail: GoalModel
    @State private var isSuccess = false
    @State var toRoot = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading){
                    HStack {
                        Text("\(goalDetail.title)")
                            .font(.system(size: 22))
                        .fontWeight(.bold)
                        Spacer()
                        Button {
                            print("Edit")
                        } label: {
                            HStack(spacing:2){
                                Image(systemName: "gearshape.fill")
                                Text("Edit")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                            }.foregroundColor(.black)
                        }.frame(width: 65, height: 25, alignment: .center)
                            .background(.white)
                            .cornerRadius(5)
                    }.padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 20))
                    VStack(alignment: .leading) {
                        HStack(spacing: 7){
                            (Text(Image(systemName: "circle.circle")) + Text(" \(goalDetail.target) Hour"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .padding(7)
                                .background(.white)
                                .cornerRadius(20)
                                
                            (Text(Image(systemName: "bell.fill")) + Text(" \(goalDetail.reminder ?? "")"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .padding(7)
                                .background(.white)
                                .cornerRadius(20)
                        }
                        HStack(spacing: 7){
                            (Text(Image(systemName: "stopwatch")) + Text(" \(goalDetail.target) Hour"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .padding(7)
                                .background(.white)
                                .cornerRadius(20)
                                
                            (Text(Image(systemName: "arrow.triangle.2.circlepath")) + Text(" \(goalDetail.totalSession ?? 0)"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .padding(7)
                                .background(.white)
                                .cornerRadius(20)
                            
                            (Text(Image(systemName: "laptopcomputer")) + Text(" \(goalDetail.totalSession ?? 0)"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .padding(7)
                                .background(.white)
                                .cornerRadius(20)
                        }
                    }.padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                }.background(Color("BgrBlueColor"))
                    .cornerRadius(20)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                Button {
//                    isSuccess = true
                    isSuccess.toggle()
                } label: {
                    Text("Start Learn")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .background(Color("SecondaryColor"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .fullScreenCover(isPresented: $isSuccess) {
                        LearnView()
                    }.environment(\.rewind, $isSuccess)
                Button {
                    print("Add Manually")
                } label: {
                    Text("Add Manually")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                //MARK: - Sessio
                Text("Sessions")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: 20){
                    if goalDetail.sessions != nil{
                        ForEach(goalDetail.sessions!) { session in
                            SessionList(session: session, isDetail: true)
                        }
                    }else{
                        Text("No Session, Please Learn First")
                    }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                   
            }
        }
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailView(goalDetail: GoalModel(id: UUID(), title: "Learn MVVM", reminder: "19:00",target: "1", sessions: [SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1H", timeSession: "30 M", startTime: "Wed, 27 July 2022 at 20:00", endTime: "Wed, 27 July 2022 at 20:30", questionPractice: 2),SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1H", timeSession: "40 M", startTime: "Mon, 25 July 2022 at 20:00", endTime: "Mon, 25 July 2022 at 20:40"),SessionModel(id: UUID(), titleGoal: "Learn Core Data", targetGoal: "2H", timeSession: "1H 30 M", startTime: "Sun, 24 July 2022 at 19:00", endTime: "Sun, 24 July 2022 at 20:30")], totalSession: 3, total: 2))
    }
}

struct RewindKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}
extension EnvironmentValues {
    var rewind: Binding<Bool> {
        get { self[RewindKey.self] }
        set { self[RewindKey.self] = newValue }
    }
}
