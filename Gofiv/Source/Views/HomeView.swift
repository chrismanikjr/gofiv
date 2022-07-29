//
//  HomeView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 27/07/22.
//

import SwiftUI

struct HomeView: View {
    @State private var totalLearn: Int = 24
    @State private var targetLearn: Int = 120
    @State private var isAdd = false

    @State private var doneDay: Int = 1
    @State private var goalModel: [GoalModel] = [GoalModel(id: UUID(), title: "Learn MVVM", reminder: "19:00",target: "1H",sessions: [SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1H", timeSession: "30 M", startTime: "Wed, 27 July 2022 at 20:00", endTime: "Wed, 27 July 2022 at 20:30", questionPractice: 2),SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1H", timeSession: "40 M", startTime: "Mon, 25 July 2022 at 20:00", endTime: "Mon, 25 July 2022 at 20:40")], totalSession: 2, total: 2),
                                                 GoalModel(id: UUID(), title: "Learn Core Data", reminder: "20:00",target: "2H", sessions: [SessionModel(id: UUID(), titleGoal: "Learn Core Data", targetGoal: "2H", timeSession: "1H 30 M", startTime: "Sun, 24 July 2022 at 19:00", endTime: "Sun, 24 July 2022 at 20:30")], totalSession: 1, total: 1),
                                                 GoalModel(id: UUID(), title: "Learn Swift UI", reminder: "21:00",target: "1H", totalSession: 0, total: 0)]
    @State private var sessionModel: [SessionModel] = [SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1H", timeSession: "30 M", startTime: "Wed, 27 July 2022 at 20:00", endTime: "Wed, 27 July 2022 at 20:30", questionPractice: 2),SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1H", timeSession: "40 M", startTime: "Mon, 25 July 2022 at 20:00", endTime: "Mon, 25 July 2022 at 20:40"),SessionModel(id: UUID(), titleGoal: "Learn Core Data", targetGoal: "2H", timeSession: "1H 30 M", startTime: "Sun, 24 July 2022 at 19:00", endTime: "Sun, 24 July 2022 at 20:30")]
    @StateObject  var dateModel = DateViewModel()
    var body: some View {
        //MARK: - Top
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                HStack{
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Good Morning")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                        Text("Chrismanto")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Image("ProfileImage")
                        .resizable()
                        .frame(width: 46, height: 46)
                }.padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
                //MARK: - Card
                VStack{
                    HStack {
                        CircularProgressView(progress: 0.2)
                            .frame(width: 60, height: 60)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Today")
                                .font(.system(size: 17))
                            .fontWeight(.semibold)
                            Text("\(totalLearn) m / \(targetLearn) m")
                                .font(.system(size: 14))
                            .fontWeight(.medium)
                        }
                        Spacer()
                        Button(action: {}) {
                            HStack{
                                Image(systemName: "flame.fill")
                                Text("\(doneDay)D")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                        }.padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .foregroundColor(Color("PrimaryColor"))
                            .background(.white)
                            .cornerRadius(10)
                            .disabled(true)
                    }.padding(15)
                    HStack(spacing: 15){
                        ForEach(dateModel.currentWeek, id: \.self) { day in
                            ZStack{
                                Circle()
                                    .fill(dateModel.isToday(date: day) ? Color("PrimaryColor") : .white)
                                    .frame(width: 30, height: 30)
                                Text(dateModel.extractWeekDate(date: day, format: "E"))
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundColor(dateModel.isToday(date: day) ? .white : .black)
                            }
                        }
                    }.padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                }.background(Color("BgrBlueColor"))
                    .cornerRadius(20)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))

                //MARK: - GOal
                HStack{
                    Text("Goals")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        isAdd = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }.fullScreenCover(isPresented: $isAdd) {
                        AddGoal()
                    }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(goalModel) { goal in
                            NavigationLink(destination: GoalDetailView(goalDetail: goal)) {
                                CardGoal(goal: goal)
                            }
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                
                //MARK: - Sessio
                Text("Sessions")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: 20){
                    ForEach(sessionModel) { session in
                        SessionList(session: session, isDetail: false)
                    }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }.navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .onAppear {
                print("URL Core Data: \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

