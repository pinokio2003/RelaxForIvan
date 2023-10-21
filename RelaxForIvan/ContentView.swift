//
//  ContentView.swift
//  RelaxForIvan
//
//  Created by Anatolii Kravchuk on 21.10.2023.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    @State var motion: CMDeviceMotion? = nil
    let motionManager = CMMotionManager()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 300, height: 300)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 0)

            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 250, height: 250)
                .foregroundColor(Color("G1"))
                .offset(x: motion != nil ? CGFloat(motion!.gravity.x * 20) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 20) : 0)
                .rotation3DEffect(motion != nil ? .degrees(Double(motion!.attitude.pitch) * 5 / .pi) : .degrees(0), axis: (
                    x: motion != nil ? -motion!.gravity.y : 0,
                    y: motion != nil ? motion!.gravity.x : 0,
                    z: 0))
                .shadow(color: .black.opacity(0.3), radius: 1,
                        x: motion != nil ? CGFloat(-motion!.gravity.x * 3) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 3) : 0)
            //New rectangle
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 200, height: 200)
                .foregroundColor(Color("G2"))
                .offset(x: motion != nil ? CGFloat(motion!.gravity.x * 27) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 27) : 0)
                .rotation3DEffect(motion != nil ? .degrees(Double(motion!.attitude.pitch) * 5 / .pi) : .degrees(0), axis: (
                    x: motion != nil ? -motion!.gravity.y : 0,
                    y: motion != nil ? motion!.gravity.x : 0,
                    z: 0))
                .shadow(color: .black.opacity(0.35), radius: 1,
                        x: motion != nil ? CGFloat(-motion!.gravity.x * 5) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 5) : 0)
            
            //Enother one rectangle
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 165, height: 165)
                .foregroundColor(Color("G3"))
                .offset(x: motion != nil ? CGFloat(motion!.gravity.x * 40) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 40) : 0)
                .rotation3DEffect(motion != nil ? .degrees(Double(motion!.attitude.pitch) * 5 / .pi) : .degrees(0), axis: (
                    x: motion != nil ? -motion!.gravity.y : 0,
                    y: motion != nil ? motion!.gravity.x : 0,
                    z: 0))
                .shadow(color: .black.opacity(0.5), radius: 1,
                        x: motion != nil ? CGFloat(-motion!.gravity.x * 7) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 7) : 0)
            
            //Image
            
                .overlay(alignment: .center) {
                    Image("LogoOne")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                }
                .offset(x: motion != nil ? CGFloat(motion!.gravity.x * 40) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 40) : 0)
                .rotation3DEffect(motion != nil ? .degrees(Double(motion!.attitude.pitch) * 5 / .pi) : .degrees(0), axis: (
                    x: motion != nil ? -motion!.gravity.y : 0,
                    y: motion != nil ? motion!.gravity.x : 0,
                    z: 0))
                .shadow(color: .black.opacity(0.5), radius: 1,
                        x: motion != nil ? CGFloat(-motion!.gravity.x * 9) : 0,
                        y: motion != nil ? CGFloat(motion!.gravity.y * 9) : 0)
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
