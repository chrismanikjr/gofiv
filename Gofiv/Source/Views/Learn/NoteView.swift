//
//  NoteView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct NoteView: View {
    @Binding var noteField: String
    var body: some View {
        VStack(spacing: 20){
            Text("Note")
                .font(.system(size: 22))
                .fontWeight(.bold)
            TextEditor(text: $noteField)
                .onChange(of: noteField, perform: { newValue in
                    noteField = newValue
                })
                .frame(height: Helper.screenSize.height * 0.55, alignment: .leading)
                .font(.system(size: 20))
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray)
                ).colorScheme(.light)
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
    }
}

//struct NoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteView()
//    }
//}
