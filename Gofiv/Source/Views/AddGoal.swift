//
//  AddGoal.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import SwiftUI
import CoreData


struct AddGoal: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State var goalTitle = ""
    @State var duration = ""
    @State var description = ""
    @State var pickDate: Date = Date()

    @State var pickReminder: Bool = false
    @State var selectedReminder: String = ""
    
    @State var pickDuration: Bool = false
//    @State private var selectionDuration: [Int] = [0, 0]

    @State var selectedDurationH: Int = 0
    @State var selectedDurationM: Int = 0

//    @State var goalDuration: Int = 0
    @State var selectedDuration: String = ""

    @StateObject  var dateModel = DateViewModel()
    let viewModel = AddGoalViewModel()
    var goalId: NSManagedObjectID?



    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    Spacer()
                    Text("Add Goal")
                        .font(.system(size: 22))
                    .fontWeight(.bold)
                    Spacer()
                }
                HStack(spacing: 0.0) {
                    Text("Goal Title").font(.system(size: 16, weight: .medium))
                        .padding(.top, 8)
                        .foregroundColor(.black)
                    
                    Text("*").font(.system(size: 16, weight: .medium))
                        .padding(.top, 8)
                        .foregroundColor(.red)
                }
                TextField("Type your title", text: $goalTitle)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray)
                    )
                    .colorScheme(.light)
                
                HStack(spacing: 20){
                    VStack(alignment:.leading) {
                        HStack(spacing: 0.0) {
                            Text("Goal Duration").font(.system(size: 16, weight: .medium))
                                .padding(.top, 8)
                                .foregroundColor(.black)
                            
                            Text("*").font(.system(size: 16, weight: .medium))
                                .padding(.top, 8)
                                .foregroundColor(.red)
                        }
                        Button {
                            pickDuration.toggle()
                        } label: {
                            if selectedDuration == "" {
                                Text("Choose")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            } else {
                                Text("\(selectedDuration)")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }.padding(13)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.gray))
                    }
                    VStack(alignment:.leading) {
                            Text("Reminder").font(.system(size: 16, weight: .medium))
                                .padding(.top, 8)
                                .foregroundColor(.black)
                  
                        Button {
                            pickReminder.toggle()
                        } label: {
                            if selectedReminder == "" {
                                Text("Choose")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            } else {
                                Text("\(selectedReminder)")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }.padding(13)
    //                        .background(.blue)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.gray))
                    }
                }
                Text("Description").font(.system(size: 16, weight: .medium))
                    .padding(.top, 8)
                    .foregroundColor(.black)
                TextField("", text: $description)
                    .frame(height: 350)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray)
                    )
                    .colorScheme(.light)
                Spacer()
                Button {
                    let values = GoalValue(id: UUID(), title: goalTitle, duration: (selectedDurationH * 60 + selectedDurationM), reminder: pickDate, description: description )

                    viewModel.saveGoal(goalId: goalId, with: values, in: viewContext)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add Goal")
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .background(Color("SecondaryColor"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                Spacer()
            }.padding(20)
                .transition(.move(edge: .bottom))

            DurationModalView(timeModal: $pickDuration, hours: $selectedDurationH, minutes: $selectedDurationM, durationString: $selectedDuration)
            TimeModalView(timeModal: $pickReminder,pickDate: $pickDate, dateString: $selectedReminder)
            

        }
        .onAppear {
            guard let goalId = goalId, let goal = viewModel.fetchGoal(for: goalId, context: viewContext) else {
                return
            }
            goalTitle = goal.title ?? ""
            duration = "\(goal.duration)"
            pickDate = goal.reminder ?? Date()
            description = goal.description
        }
    }
}

struct AddGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddGoal()
    }
}
