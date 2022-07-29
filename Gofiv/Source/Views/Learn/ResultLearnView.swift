//
//  ResultLearnView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct ResultLearnView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var sessionModel: SessionModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20){
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    Spacer()
                    Text("\(sessionModel.titleGoal)")
                        .font(.system(size: 22))
                    .fontWeight(.bold)
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                HStack{
                    Image("Celebration")
                        .resizable()
                        .frame(width: 35, height: 35)
                    Text(" 00 : 35 : 40")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    Image("Celebration")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                Spacer()
                HStack(spacing: 20){
                    Image(systemName: "chart.bar.xaxis")
                        .resizable()
                        .frame(width: 80, height: 70)
                        .foregroundColor(Color("PrimaryColor"))
                    VStack(alignment: .leading, spacing: 5){
                        Text("\(sessionModel.timeSession) deep focus")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        Text("\(sessionModel.breakTime ?? "0m") on break")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        Text("\(sessionModel.questionPractice ?? 0) questions in practice")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                    }
                }
                Divider()
                    .frame(height:3)
                    .background(Color("SecondaryColor").opacity(0.3))
                HStack(spacing: 15){
                    Text("Start Time \n19:00")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Divider()
                        .frame(width: 2, height:30)
                        .background(Color("SecondaryColor").opacity(0.3))
                    Text("End Time \n19:30")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Divider()
                        .frame(width: 2, height:30)
                        .background(Color("SecondaryColor").opacity(0.3))
                    Text("Daily Goal \n\(sessionModel.timeSession) / \(sessionModel.targetGoal)")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
                Divider()
                    .frame(height:3)
                    .background(Color("SecondaryColor").opacity(0.3))
                
                Text("Note")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .frame(width: Helper.screenSize.width - 40, alignment: .leading)
                Text("Each component can communicate to one or both of the others as follow: The View will talk only to the view model. \n\nThe View Model will talk directly to the Model and indirectly with the View, notifying it somehow (we’ll see later ) the changes of its state. \nThe Model will talk indirectly with the ViewModel, notifying the changes of its state. Each component knows about the other components following these rules: The View knows exactly who is its ViewModel. \n \nThe View knows nothing about the Model. The ViewModel knows exactly who is its Model. The ViewModel talks to some View but it does not know exactly who it is. The Model talks to some ViewModel but it does not know exactly who it is.")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .frame(width: Helper.screenSize.width - 40, alignment: .leading)
            }
        }
    }
}

struct ResultLearnView_Previews: PreviewProvider {
    static var previews: some View {
        ResultLearnView(sessionModel: SessionModel(id: UUID(), titleGoal: "Learn MVVM", targetGoal: "1 H", timeSession: "30 M", startTime: "Wed, 27 July 2022 at 20:00", endTime: "Wed, 27 July 2022 at 20:30", questionPractice: 2))
    }
}
