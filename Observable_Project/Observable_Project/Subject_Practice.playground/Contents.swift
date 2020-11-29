import UIKit
import RxSwift


var str = "Hello, playground"



public func example(of description: String,
                    action: () -> Void) {
    print("\n— Example of:", description, "—")
    action()
}

//
//example(of: "PublishSubject"){
//    let subject = PublishSubject<String>()
//    //subject.onNext("Is anyone listening?")
//
//    let subscriptionOne = subject.subscribe(onNext: { string in print(string)})
//
//
//    subject.onNext("1")
//    subject.onNext("2")
//
//    let subscriptionTwo = subject.subscribe { event in print("2)", event.element ?? event)}
//    subject.onNext("3")
//}
////
//
//
//example(of: "BehaviorSubject"){
//    let subject = BehaviorSubject<String>(value: "안녕")
//    //subject.onNext("Is anyone listening?")
//
//    let subscriptionOne = subject.subscribe(onNext: { string in print(string)})
//
//
//    subject.onNext("1")
//    subject.onNext("2")
//
//    let subscriptionTwo = subject.subscribe { event in print("2)", event.element ?? event)}
//    subject.onNext("3")
//}


enum MyError:Error {
    case anError
}

func print<T: CustomStringConvertible>(label: String, event: Event<T>)
{
    print(label, event.element ?? event)
}
//
//example(of: "Behavior Subject")
//{
//    let subject = BehaviorSubject(value: "Initial value")
//    let disposeBag = DisposeBag()
//
//    subject.subscribe {
//        print(label: "1)", event: $0)
//    }.disposed(by: disposeBag)
//
//    subject.onNext("X")
//
//    subject.onError(MyError.anError)
//    //error 이벤틀를 subject에 추가해 주었습니다.
//
//    subject.subscribe {
//        print(label: "2)", event: $0)
//    }.disposed(by: disposeBag)
//
//}

//
//example(of : "ReplaySubject") {
//
//    let subject = ReplaySubject<String>.create(bufferSize: 3)
//
//    // created new replay subject with a buffer size of 2. Replay subjects are initialized using the type method create(bufferSize: )
//
//    let disposeBag = DisposeBag()
//
//    subject.onNext("1")
//    subject.onNext("2")
//    subject.onNext("3")
//    subject.onNext("4")
//    subject.onNext("5")
//    //add three elements onto the subjects
//
//    subject.subscribe{
//        print(label: "1)", event: $0)
//    }.disposed(by: disposeBag)
//
//    subject.onNext("a")
//    subject.onError(MyError.anError)
//    subject.onNext("b")
//
//    subject.subscribe{
//        print(label: "2)", event: $0)
//    }.disposed(by: disposeBag)
//    //create twi subscriptions to the subject
//
//    subject.onNext("6")
//    subject.onNext("7")
//}
//
//example(of : "ReplaySubject") {
//
//    let subject = ReplaySubject<String>.create(bufferSize: 2)
//
//    // created new replay subject with a buffer size of 2. Replay subjects are initialized using the type method create(bufferSize: )
//
//    let disposeBag = DisposeBag()
//
//    subject.onNext("1")
//    subject.onNext("2")
//    subject.onNext("3")
//    //add three elements onto the subjects
//
//    subject.subscribe{
//        print(label: "1)", event: $0)
//    }.disposed(by: disposeBag)
//
//    subject.subscribe{
//        print(label: "2)", event: $0)
//    }.disposed(by: disposeBag)
//
//    subject.onNext("4")
//
//    subject.onError(MyError.anError)
//
//    subject.dispose()
//
//    // This may surprise you
//    // And if so, that's OK Life's full surprises
//
//    subject.subscribe{
//        print(label: "3)", event: $0)
//    }.disposed(by: disposeBag)
//
//    //create two subscriptions to the subject
//
//    // 최신의 두 elements 만 subscribers에 replay 된다. 1은 방출되지 않는다. 왜냐하면 2 와 3은 replay subject에 buffer size 2 로 더해진다.
//
//    // 그동안 방출된 이벤트 중 최근의 것들을 특정 사이즈만큼 캐시(버퍼)시켜 놓는다.
//    //이것을 새로운 구독자들에게 재방출한다.
//}
//




//
//
//    subject.onCompleted()
//    subject.onNext("5")
//    subscriptionTwo.dispose()
//    let disposeBag = DisposeBag()
//
//    subject.subscribe {
//        print("3)", $0.element ?? $0)
//
//    }.disposed(by: disposeBag)
//
//    subject.onNext("?")
//}
//    subject.on(.next("1"))
//    subject.on(.next("2"))
//
//    subscriptionOne.dispose()
//    subject.on(.next("4"))

