import UIKit

class Customer {
    
    struct ShippingAddress {
        var street: String
        var zipCode: UInt
        var phone: String
    }
    
    enum PaymentMethod {
        case VisaCard
        case ATM
        case CashOnDelivery
    }
    
    var id: String
    var firstName: String
    var lastName: String
    var paymentMethod: PaymentMethod?
    var shippingAddress: ShippingAddress?
    
    init(id: String, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
}

let customer1 = Customer(id: "8f179198-4cba-4bcc-a689-12ffae322b99", firstName: "Thao", lastName: "Nguyen")
let address = Customer.ShippingAddress(street: "Hanoi, Vietnam", zipCode: 100000, phone: "0123456789")
customer1.shippingAddress = address
customer1.paymentMethod = Customer.PaymentMethod.CashOnDelivery


// Optional method in protocol
protocol OptionalProtocol {
    func optionalFunc() -> Void
    func requiredFunc() -> Void
}

extension OptionalProtocol {
    func optionalFunc() {
        // do nothing
        print("default impl")
    }
}

class Test: OptionalProtocol {
    func requiredFunc() {
        print("test")
    }
}

let a = Test()
a.optionalFunc()
a.requiredFunc()
