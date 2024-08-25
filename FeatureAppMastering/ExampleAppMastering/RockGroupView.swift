//
//  RockGroupView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 10.08.24.
//

import SwiftUI

struct RockGroupView: View {
    
    @Environment(\.dismiss) var dismiss
    var rockGroup: RockGroup
    
    var body: some View {
        VStack {
            /// Модификаторы resizable() и aspectRatio(contentMode: .fit) изменяют размер изображения так, чтобы оно подходило по ширине и высоте, сохраняя пропорции.
            Image(rockGroup.groupImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(rockGroup.groupName)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading ) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "swift")
                        Text("BackButton")
                    }
                    
                }

            }
        }
    }
}

struct RockGroupView_Previews: PreviewProvider {
    static var previews: some View {
        RockGroupView(rockGroup: RockGroupData.data.first!)
    }
}
