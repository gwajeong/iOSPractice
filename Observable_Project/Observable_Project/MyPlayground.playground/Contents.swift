import UIKit
import RxSwift

var str = "Hello, playground"

example(of: "just, of, from") {
    
    // 첫번째 부분
    let one = 1
    let two = 2
    let three = 3
    
    // 두번째 부분
    let observable: Observable<Int> = Observable<Int>.just(one)
    let observable2: Observable<Int> = Observable<Int>.of(one,two,three)
    let observable3: Observable<Int> = Observable<Int>.from([one,two,three])
}
//
//    observable2.subscribe { event in
//        if let element = event.element {
//            print(element)
//        }
//    }
//
//    observable2.subscribe(onNext: { element in
//        print(element)
//    })
//
//}
//
//example(of: "empty") {
//
//    let observable = Observable<Void>.empty()
//
//    observable
//        .subscribe(
//
//            // 1
//            onNext: { element in
//                print(element)
//            },
//
//            // 2
//            onCompleted: {
//                print("Completed")
//            }
//        )
//}
//
//
//example(of: "never") {
//
//    let observable = Observable<Any>.never()
//
//    observable
//        .subscribe(
//            onNext: { element in
//                print(element)
//            },
//            onCompleted: {
//                print("Completed")
//            }
//        )
//}
//
//example(of: "range") {
//
//    // 1
//    let observable = Observable<Int>.range(start: 1, count: 10)
//    var fibonacci = 0
//    observable.subscribe(onNext: { i in
//
//        // 2
//        let n = Double(i)
//        fibonacci = Int(((pow(1.61803, n) - pow(0.61803, n)) / 2.23606).rounded())
//
//        print(fibonacci)
//    })
//
//}


example(of: "create") {
     let disposeBag = DisposeBag()
     
     Observable<String>.create({ (observer) -> Disposable in
         // 1
         observer.onNext("1")
         
         // 2
         observer.onCompleted()
         
         // 3
         observer.onNext("?")
         
         // 4
         return Disposables.create()
     })
         .subscribe(
             onNext: { print($0) },
             onError: { print($0) },
             onCompleted: { print("Completed") },
             onDisposed: { print("Disposed") }
     ).disposed(by: disposeBag)
 }


public func example(of description: String,
                    action: () -> Void) {
    print("\n— Example of:", description, "—")
    action()
}
