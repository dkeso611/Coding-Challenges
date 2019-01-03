import UIKit

class Node {
    var value: Int
    var next: Node?
    weak var previous: Node?
    
    init(value: Int) {
        self.value = value
    }
}

struct LinkedList {
    var head: Node?
    var isEmpty: Bool
    
    init(node: Node) {
        self.head = node
       isEmpty = false
    }
    
    mutating func checkIsEmpty() -> Bool {
        if head != nil {
            isEmpty = false
        } else {
            isEmpty = true
        }
        
        return isEmpty
    }
    
    mutating func append(node: Node){
        guard head != nil else {
            head = node
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
            
        }
        
        currentNode?.next = node
        node.previous = currentNode
    }
    
    //insert node by value in sorted linked list
    mutating func insert(node: Node){
        var currentNode = head?.next
        if (head?.value)! > node.value {
            node.next = head
            head = node
        } else {
            print(currentNode?.value, node.value)
            while (currentNode?.value)! < node.value {
            currentNode = currentNode?.next
            }
//            var prev = currentNode?.previous
//            currentNode?.previous = node
//            prev?.next = currentNode?.previous
            
            currentNode?.previous?.next = node
            currentNode?.previous = node
        

        }
    }
}

var list = LinkedList(node: Node(value: 5))
list.isEmpty
list.append(node: Node(value: 7))
list.append(node: Node(value: 10))

list.insert(node: Node(value: 9))
list.head?.next?.next?.value

list.head = nil
list.head?.value
list.isEmpty
list.checkIsEmpty()

