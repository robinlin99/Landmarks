/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFdae: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 2 : 1.5)
                        .padding()
                        .animation(.spring(), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFdae)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                HikeView(hike: ModelData().hikes[0])
                    .padding()
                Spacer()
            }
            .preferredColorScheme(.dark)
            VStack {
                HikeView(hike: ModelData().hikes[0])
                    .padding()
                Spacer()
            }
            .preferredColorScheme(.dark)
        }
    }
}
