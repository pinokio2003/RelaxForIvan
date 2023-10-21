//
//  UkraineView.swift
//  RelaxForIvan
//
//  Created by Anatolii Kravchuk on 21.10.2023.
//

import SwiftUI
import CoreMotion

struct UkraineView: View {
    @State var motion: CMDeviceMotion? = nil
    let motionManager = CMMotionManager()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 280, height: 280)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 0)
            Image("UKR")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .offset(x: motion != nil ? CGFloat(motion!.gravity.x * 20) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 20) : 0)
                .rotation3DEffect(motion != nil ? .degrees(Double(motion!.attitude.pitch) * 5 / .pi) : .degrees(0), axis: (
                    x: motion != nil ? -motion!.gravity.y : 0,
                    y: motion != nil ? -motion!.gravity.x : 0,
                    z: 0))
                .shadow(color: .black.opacity(0.5), radius: 1,
                        x: motion != nil ? CGFloat(-motion!.gravity.x * 3) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 3) : 0)
            
            HStack(spacing:0) {
                Image("eye")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 21, height: 21)
                    .offset(x: -30, y: 23)
                
                Image("eye")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 21, height: 21)
                    .offset(x: 30, y: 23)
            }
            .offset(x: motion != nil ? CGFloat(motion!.gravity.x * 10) : 0,
                    y: motion != nil ? CGFloat(motion!.gravity.y * 10) : 0)
            .rotation3DEffect(motion != nil ? .degrees(Double(motion!.attitude.pitch) * 5 / .pi) : .degrees(0), axis: (
                x: motion != nil ? -motion!.gravity.y : 0,
                y: motion != nil ? -motion!.gravity.x : 0,
                z: 0))
        }
        .onAppear {
            if motionManager.isDeviceMotionAvailable {
                self.motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
                self.motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                    if let validData = data {
                        self.motion = validData
                    }
                }
            }
        }
    }
}

struct UkraineView_Previews: PreviewProvider {
    static var previews: some View {
        UkraineView()
    }
}
