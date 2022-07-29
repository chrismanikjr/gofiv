//
//  PickView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI

struct TimeModalView: View {
    @Binding var timeModal:Bool
    @Binding var pickDate: Date
    @State var dateFormater = DateFormatter()
    @Binding var dateString: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if timeModal{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
                
                VStack {
                    ZStack{
                        Button {
                            timeModal.toggle()
                            dateFormater.dateFormat = "HH:mm"
                            dateString = dateFormater.string(from: pickDate)
                        } label: {
                            Text("Done")
                                .frame(maxWidth:.infinity, alignment:.trailing)
                        }
                    }
                    .padding(20)
                    
                    ZStack{
                        DatePicker("", selection: $pickDate, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                    }
                    .frame(maxHeight: .infinity)
                }
                .frame(height:300)
                .frame(maxWidth: .infinity)
                .background(.white)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
        .colorScheme(.light)
    }
}

struct DurationModalView: View {
    @Binding var timeModal:Bool
    
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var durationString: String

    
    var body: some View {
        ZStack(alignment: .bottom) {
            if timeModal{
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
                VStack {
                        Button {
                            timeModal.toggle()
                            if hours == 0 && minutes == 0{
                                durationString = ""
                            }
                            else if hours == 0{
                                durationString = "\(minutes) M"
                            }else if minutes == 0{
                                durationString = "\(hours) H"
                            }else{
                                durationString = "\(hours)H \(minutes)M"
                            }
                        } label: {
                            Text("Done")
                                .frame(maxWidth:.infinity, alignment:.trailing)
                        }.padding(20)
                    
                    HStack(spacing: 0){
                        Picker("", selection: $hours){
                            ForEach(0..<3, id: \.self) { i in
                                Text("\(i) hours").tag(i)
                            }
                        }.pickerStyle(.wheel)
                            .frame(width: Helper.screenSize.width/2, height: 200, alignment: .center)
                            .compositingGroup()
                            .clipped()
                        
                        Picker("", selection: $minutes){
                            ForEach(0..<60, id: \.self) { i in
                                Text("\(i) min").tag(i)
                            }
                        }.pickerStyle(.wheel)
                            .frame(width: Helper.screenSize.width/2, height: 200, alignment: .center)
                            .compositingGroup()
                            .clipped()
                    }
                }
                .frame(height:250)
                .frame(maxWidth: Helper.screenSize.width)
                .background(.white)
                .transition(.move(edge: .bottom))
            }
        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        //        .ignoresSafeArea()
        .animation(.easeInOut)
        .colorScheme(.light)
    }
}
