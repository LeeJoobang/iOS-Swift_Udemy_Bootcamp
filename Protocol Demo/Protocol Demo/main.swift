protocol CanFly{
    func fly() // 비행을 정의하는 중괄호가 없다. 만약, 중괄호를 넣게 되면 Protocol methods must not have bodies.라는 메세지가 발생한다.
}
// 정의된 fly 메소드를 우선 가지고 있는다. 그리고 bird class 내 정의된 fly를 삭제한다.
// 그리고 해당 fly메소도를 각 클래스에서 사용하되 그게 맞게 적절히 수정하여 이용한다. 미쳤다,,,,,,
class Bird {
    var isfemale = true
    
    func layEgg(){
        if isfemale {
            print("the bird makes a new bird in a shell")
        }
    }
}

class Eagle: Bird, CanFly{
    func fly() {
        print("the eagle can fly")
    }
    
    func soar(){
        print("the eagle glides in the air using currents.")
    }
}
//eagle은 bird의 메소드를 상속받고 있다.

class Penguin: Bird{
    func swim(){
        print("the penguin paddles through the water")
    }
    
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly){
        flyingObject.fly()
    }
}


struct Airplane: CanFly{ // struct는 프로토콜의 상속을 받을 수 있다!
    func fly() { // 상속을 받은 메소드를 가져다 쓸 때 override를 통해 내용을 수정할 수 있다. struct로 fly를 쓰는 것은 불가하다. class만 가능하다.
        print("the ariplane can fly")
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = Airplane()

// 그러나 펭귄은 bird의 속성을 받았지만, 실제로 날 수 없다!
// 문제1. 실제로 펭귄이 할 수 없는 기능까지도 상속받게 되는 문제가 발생된다.(bird를 상속받음으로써)


let museum = FlyingMuseum()

// 이렇게 작성할 수 있다. 그러나 이렇게 되면 상속과 서브클래싱에 너무 많이 의존하게 된다.
// 그렇기 때문에 비행행동에 대해 새클래스와 먼저 분리를 해야하고
// 분리된 비행행동을 새들과 비행기에 적용해야 한다.
// 그렇다면 상속은 클래스만 된다는 사실을 기억한다면?

myEagle.fly()
myPlane.fly()
museum.flyingDemo(flyingObject: myEagle) // flyingObject는 canfly를 채택하고 있기 때문에, 동일하게 canfly를 채택하고 있는 클래스 또는 구조체를 적용할 수 있다.
museum.flyingDemo(flyingObject: myPlane)

