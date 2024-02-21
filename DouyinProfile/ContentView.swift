//
//  ContentView.swift
//  DouyinProfile
//
//  Created by 香饽饽zizizi on 2024/2/16.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                GeometryReader { geo in
                    let offsetY = geo.frame(in: .global).minY

                    Image(.bg)
                        .resizable()
                        .scaledToFill()
                        .frame(height: offsetY > 0 ? 240 + offsetY : 240)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .overlay(alignment: .bottomLeading) {
                            userInfoView
                                .offset(y: -20)
                        }
                        .offset(y: -offsetY)
                }
                .frame(height: 240)

                VStack(alignment: .leading) {
                    Text("作品")
                        .font(.subheadline.bold())
                        .padding(.horizontal)

                    videosView
                }
                .padding(.top, 20)
                .background(.white)
                .clipShape(.rect(cornerRadii: .init(topLeading: 15, bottomLeading: 0, bottomTrailing: 0, topTrailing: 15), style: .continuous))
                .offset(y: -20)
                .padding(.bottom, -20)
            }
        }
        .ignoresSafeArea()
    }

    var userInfoView: some View {
        HStack {
            Image(.avatar)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
                .clipShape(.circle)

            VStack(alignment: .leading) {
                Text("小兔子")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                Text("抖音号:138454111")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
        .padding()
    }

    var videosView: some View {
        Grid(horizontalSpacing: 1, verticalSpacing: 1) {
            ForEach(0 ..< 8) { _ in
                GridRow {
                    ForEach(0 ..< 3) { item in
                        Color.gray.opacity(0.3)
                            .aspectRatio(0.8, contentMode: .fill)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
