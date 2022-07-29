//
//  SessionList.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct SessionList: View{
    let session: SessionModel
    let isDetail: Bool
    var body: some View{
        VStack(alignment: .leading){
            if session.questionPractice != nil{
                Text("Practice")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,  alignment: .trailing)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 15))
            }else{
                Spacer()
            }
        
            VStack(alignment: .leading, spacing: 5) {
                if isDetail == false{
                    Text("\(session.titleGoal)")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
                Text("\(session.endTime)")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                .foregroundColor(.black)
            }.padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
            Spacer(minLength: 5)
            Text("\(session.timeSession)")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .frame( maxWidth: .infinity, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 15))
            
        }.frame(height: isDetail ? 120 : 150)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BgrBlueColor"), lineWidth: 3))
    }
}
