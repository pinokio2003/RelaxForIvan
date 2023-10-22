//
//  CubeTransitionView.swift
//  RelaxForIvan
//
//  Created by Anatolii Kravchuk on 22.10.2023.
//

import SwiftUI

struct CubeTransitionView <Content: View, Detail: View>: View {
    var content: Content
    var detail: Detail
    
        //Mark: show view
    @Binding var show: Bool
    
    
    init(show: Binding<Bool>, @ViewBuilder content: @escaping ()-> Content, @ViewBuilder detail: @escaping ()-> Detail) {
        self.content = content()
        self.detail = detail()
        self._show = show
    }
    
    //MARK: animation properies
    
    @State var animateView: Bool = false
    @State var showView: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            
            let size = proxy.size
            
            HStack {
                
                content
                    .frame(width: size.width, height: size.height)
                //MARK: Rotation:
                    .rotation3DEffect(.init(degrees: animateView ? -85 : 0),
                                      axis: (x: 0, y: 1, z: 0), anchor: .trailing, anchorZ: 0, perspective: 1)
                ZStack {
                    if showView {
                        detail
                            .frame(width: size.width, height: size.height)
                            .transition(.move(edge: .trailing))
                            .onDisappear {
                                print("close")
                            }
                    }
                }
                .rotation3DEffect(.init(degrees: animateView ? 0 : 85),
                                  axis: (x: 0, y: 1, z: 0), anchor: .trailing, anchorZ: 0, perspective: 1)
            }
            .offset(x: animateView ? -size.width : 0)
        }
        .onChange(of: show) { newValue in
            if show {showView = true}
            
            else {
                //Clouse prev.view after 0.35 sec
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    showView = false
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation(.easeInOut(duration: 0.35)){
                    animateView.toggle()
                }
            }
        }
    }
}

struct CubeTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
