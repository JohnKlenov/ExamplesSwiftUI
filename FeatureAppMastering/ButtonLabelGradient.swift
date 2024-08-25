//
//  ButtonLabelGradient.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 29.07.24.
//

import SwiftUI

struct ButtonLabelGradient: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Group {
                    CustomBtn(textBtn: "Share", systemImg: "square.and.arrow.up")
                    CustomBtn(textBtn: "Delete", systemImg: "trash")
                    CustomBtn(textBtn: "Edit", systemImg: "square.and.pencil")
                }
                .buttonStyle(.bordered)
                .tint(.purple)
                .controlSize(.large)
//                .buttonBorderShape(.roundedRectangle(radius: 40))
            }
        }
    }
}

struct ButtonLabelGradient_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabelGradient()
    }
}



// MARK: - Library Button
    

struct GradientBackgroundStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
        .frame(minWidth: 0, maxWidth: .infinity)
        
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .padding(.horizontal, 20)
        .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
//        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
//        .rotationEffect(configuration.isPressed ? .degrees(-90) : .degrees(0))

    }
    
}


struct BtnGradient: View {
    var body: some View {
        Button(action: {
            print("Нажал кнопку удаления")
        }) {
            Label(
                title: {
                    Text("Удалить")
                        .fontWeight(.semibold)
                        .font(.title)
                }, icon: {
                    Image(systemName: "trash")
                        .font(.title)
                } )
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .leading, endPoint: .trailing))
            
                .cornerRadius(40)
                .padding(.horizontal, 20)
                .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
        }
        
    }
}

struct BtnDoublePadding: View {
    var body: some View {
        Button {
            print("Button DidTap")
        } label: {
            Text("Press my")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(.gray)
                .foregroundStyle(.black)
                .cornerRadius(20)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.gray, lineWidth: 10)
                    //                        .border(.gray, width: 10)
                }
        }
    }
}

struct BtnHStack: View {
    var body: some View {
        Button {
            print("Did tap")
        } label: {
            HStack {
                Group {
                    Text("Delete")
                    Image(systemName: "trash")
                }
                .font(.title)
            }
            .padding()
            .background(.red)
            .foregroundStyle(.white)
            .cornerRadius(20)
        }
    }
}

struct BtnImage: View {
    var body: some View {
        Button {
            print("DidTap")
        } label: {
            Image(systemName: "trash")
            
        }
        .padding()
        .font(.largeTitle)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
    }
}

struct CustomBtn: View {
    var textBtn:String
    var systemImg:String
    
    var body: some View {
        Button {
            print("Did tap Button \(textBtn)")
        } label: {
            Label {
                Text(textBtn)
                    .font(.title)
            } icon: {
                Image(systemName: systemImg)
                    .font(.title)
            }
        }
    }
}
