//
//  CircularProgressVIew.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 27/07/22.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: Double
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.white,
                    lineWidth: 7
            )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color("PrimaryColor"),
                    style: StrokeStyle(
                        lineWidth: 7,
                        lineCap: .round
                    )
                ).rotationEffect(.degrees(-90))
            Text("\(Int(progress * 100)) %")
                .font(.system(size: 14))
                .fontWeight(.semibold)
        }
        
    }
}
