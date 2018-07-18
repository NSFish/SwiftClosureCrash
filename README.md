## Question: Weird crash when calling closure with generic parameters in Swift 3

here I have a Protocol:

```Swift
protocol CrashProtocol {
    associatedtype T

    static func tryCrash(_ dummyInt: Int,
                         with closure: ((T) -> Void))
}
```

A Base class that implements it:

```Swift
class Crash<M>: CrashProtocol {
    typealias T = M

    class func tryCrash(_ dummyInt: Int,
                        with closure: ((M) -> Void)) {
        print("Crash tryCrash")
    }
}
```

And a derived class inherit the base class:

```Swift
class DerivedCrash: Crash<DummyObject> {

    override class func tryCrash(_ dummyInt: Int, with closure: ((DummyObject) -> Void)) {
        super.tryCrash(dummyInt, with: closure)

        print("Derived tryCrash")
        let obj = DummyObject.init()
        closure(obj)
    }
}
```

Now whenever I try

```Swift
DerivedCrash.tryCrash(1) { _ in
            print("Never reach here")
}
I get a "EXC_BAD_ACCESS" crash. You can find my testing code here. I've done my share of debugging, but only find out that the memory address causing the crash points to a Swift.Int instance, which I do not use.. And if I change the calling code a little bit, the code would crash after the closure being executed..

DerivedCrash.tryCrash(1) { (obj: DummyObject) in
    //print("Never reach here")
    print("print as expected and then crash")
}
```

If anyone could shred in some light, I would be highly appreciated..

## [Answer on SO](https://stackoverflow.com/a/45813759/2135264)
I have added NSObject to associatedtype and now it doesn't crash. It doesn't answer your question, but maybe this temp solution will help you

```Swift
protocol CrashProtocol {
    associatedtype T: NSObject

    static func tryCrash(_ dummyInt: Int,
                         with closure: ((T) -> Void))
}

class Crash<M:NSObject>: CrashProtocol {
    typealias T = M

    class func tryCrash(_ dummyInt: Int,
                        with closure: ((M) -> Void)) {
        print("Crash tryCrash")
    }
}
```
