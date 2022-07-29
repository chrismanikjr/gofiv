//
//  CardGoal.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI
struct CardGoal: View{
    let goal : GoalModel
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                (Text("\(goal.totalSession ?? 0) ") + Text(Image(systemName: "arrow.triangle.2.circlepath")))
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                Spacer()
                Button {
                    print("Tes")
                } label: {
                    Image(systemName: "ellipsis")
                }.foregroundColor(.black)
            }
            Spacer(minLength: 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(goal.title)")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                .foregroundColor(.black)
                (Text(Image(systemName: "circle.circle")) + Text("\(goal.target) / Day"))
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                (Text(Image(systemName: "bell.fill")) + Text("\(goal.reminder ?? "")"))
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            Spacer(minLength: 5)
            Text("\(goal.total ?? 0) H")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .frame( maxWidth: .infinity, alignment: .trailing)
        }.frame(width: Helper.screenSize.width * 0.4, height: 160)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BgrBlueColor"), lineWidth: 3))
    }
}
