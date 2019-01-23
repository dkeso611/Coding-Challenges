import UIKit

struct Item {
    var name: String
    var price: Float
    var quantity: Int
}

struct List {
    var itemsArray: [Item]
    var discountDict: [String: (Float, Int)] = ["apple": (2.0, 3), "pear":  (3.0, 4)]
    
    init(itemsArray: [Item]) {
        self.itemsArray = itemsArray
    }

    
    func getTotalCost() {
        var totalCost: Float = 0.0
        
        let totalPriceArray = itemsArray.compactMap{($0.price * Float($0.quantity))}
        totalCost = totalPriceArray.reduce(0, +)
        print("Cost without discount:", totalCost)
        
        }
    
    func getTotalDiscountCost() {
        var totalCost: Float = 0
        
        for item in itemsArray {
            if discountDict[item.name] != nil {

                let discountPrice = discountDict[item.name]?.0
                let discountQuantity = discountDict[item.name]?.1
                
                let totalDiscountPrice = Float(item.quantity % discountQuantity!) * item.price + Float(item.quantity/discountQuantity!) * discountPrice!
                
                totalCost += totalDiscountPrice
                print(item.name, totalDiscountPrice)
            } else {
                let cost = item.price * Float(item.quantity)
                totalCost += cost
                print(item.name, cost)
                
            }
        }
        
        print("Cost with discount:", totalCost)
    }
    
    
}

var list = List(itemsArray: [Item(name: "apple", price: 3, quantity: 6), Item(name: "orange", price: 3, quantity: 4), Item(name: "pear", price: 2, quantity: 5)])

list.getTotalCost()
list.getTotalDiscountCost()
