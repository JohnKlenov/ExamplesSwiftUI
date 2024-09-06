//
//  FormField.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 5.09.24.
//

import SwiftUI

struct FormField: View {
    
    var fieldName:String = ""

    @Binding var fieldValue:String
    var isSecure:Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height:1)
//                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .background(Color(uiColor: .opaqueSeparator))
                .padding(.horizontal)
            
        }
    }
}

//#Preview {
//    @State var tempFieldValue = ""
//    return FormField(fieldValue: $tempFieldValue)
//}


