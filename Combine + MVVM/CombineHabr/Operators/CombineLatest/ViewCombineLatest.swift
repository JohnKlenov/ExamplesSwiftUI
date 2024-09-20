//
//  ViewCombineLatest.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 16.09.24.
//

import SwiftUI

//struct ViewCombineLatest: View {
//    
//    @StateObject var viewModel = ViewModelCombineLatest()
//    
//    
//    var body: some View {
//        VStack {
//            TextField("Text 1", text: $viewModel.text1)
//                .textFieldStyle(.roundedBorder)
//                .padding()
//            
//            TextField("Text 2", text: $viewModel.text2)
//                .textFieldStyle(.roundedBorder)
//                .padding()
//            
//            Text(viewModel.combinedText)
//                .padding()
//        }
//    }
//}

struct ViewCombineLatest: View {
    
    @StateObject var viewModel = ViewModelZip()
    @State private var text1:String = ""
    @State private var text2:String = ""
    
    
    var body: some View {
        VStack {
            TextField("Text 1", text: $text1, onCommit: {
                viewModel.pub1.send(text1)
            })
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("Text 2", text: $text2, onCommit: {
                viewModel.pub2.send(text2)
            })
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Text(viewModel.combinedText)
                .padding()
        }
    }
}

#Preview {
    ViewCombineLatest()
}


//@StateObject var viewModel = ViewModelZip()



// MARK: - Example


//combineLatest отлично подходит для такого сценария. Когда данные из двух разных сетевых запросов поступают в разное время, combineLatest гарантирует, что подписчик получит обновленные данные только тогда, когда оба издателя отправят свои значения. Это позволяет вам обновлять UI только тогда, когда все необходимые данные доступны.
//Вот пример, как это может выглядеть:

//import Combine
//
//let publisher1 = PassthroughSubject<Data, Never>()
//let publisher2 = PassthroughSubject<Data, Never>()
//
//let combined = Publishers.CombineLatest(publisher1, publisher2)
//
//let cancellable = combined.sink { data1, data2 in
//    // Обновляем UI с данными из обоих запросов
//    updateUI(with: data1, and: data2)
//}
//
//// Представим, что это данные из первого сетевого запроса
//let dataFromFirstRequest = Data()
//publisher1.send(dataFromFirstRequest)
//
//// Представим, что это данные из второго сетевого запроса
//let dataFromSecondRequest = Data()
//publisher2.send(dataFromSecondRequest)

// Output: updateUI(with: dataFromFirstRequest, and: dataFromSecondRequest)

//В этом примере updateUI будет вызван только тогда, когда оба издателя отправят свои данные. Если данные на сервере изменяются, и издатели отправляют новые значения, combineLatest снова вызовет подписчика с обновленными данными, что позволит вам поддерживать UI в актуальном состоянии.
