protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport? // 자신을 대리자로 설정한 사람이 누구든지 모든 클래스 또는 구조체에 advancedLifeSupport 채택되어 있으므로, 해당 delegate는 방법을 알아야 한다.
    init(){
        
    }
    func assessSituation(){
        print("무슨 일 있었는지 말씀해주시겠습니까?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("초당 30초 흉부압박")
    }
}

class Doctor: AdvancedLifeSupport{
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("의사도 CPR")
    }
    
    func useStethescope() {
        print("심장 박동을 들어")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("노래를 부를게")
    }
    
    func usuElectricDrill(){
        print("드르릉")
    }
}

let emilio = EmergencyCallHandler()
print(emilio.delegate)

let angela = Surgeon(handler: emilio)

print(emilio.delegate)
print("----------------")

emilio.assessSituation()
print("----------------")
emilio.medicalEmergency()
print("----------------")
angela.performCPR()
