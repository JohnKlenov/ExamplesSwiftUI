//
//  TimerCHN№2.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 22.09.24.
//

import SwiftUI


///Добавляет модификатор onReceive, который подписывается на события таймера. Каждый раз, когда таймер публикует новое значение, это значение передается в замыкание, и currentTime обновляется.
///Создает таймер, который публикует событие каждую секунду (every: 1). Таймер работает на главном потоке (on: .main) и автоматически подключается (autoconnect()).


struct TimerCHN_2: View {
    
    @State var currentTime:Date = Date()
    private var timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    var body: some View {
        Text("CurrentTime - \(currentTime)")
            .onReceive(timer) { time in
                currentTime = time
            }
    }
}

#Preview {
    TimerCHN_2()
}




// MARK: - manual start


//timer
//    .sink { secondsLeft in
//        print(secondsLeft)
//    }
//    .store(in: &bag)
//timer.connect()



// MARK: - autoconect

//timer
//    .autoconnect()
//    .sink { secondsLeft in
//        print(secondsLeft)
//    }
//    .store(in: &bag)

