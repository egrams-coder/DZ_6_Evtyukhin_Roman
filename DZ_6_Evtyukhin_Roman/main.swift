//
//  main.swift
//  DZ_6_Evtyukhin_Roman
//
//  Created by Роман on 14.09.2020.
//  Copyright © 2020 Nebo. All rights reserved.
//
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


import Foundation

protocol Pass {
    var pass: Bool { get set }
}

class PassPerson: Pass {
    var pass: Bool
    var russian: Int
    var foreigner: Int
    
    func addPerson () -> Int {
        return russian + foreigner
    }
    
    init(russian: Int, foreigner: Int, pass: Bool) {
        self.russian = russian
        self.foreigner = foreigner
        self.pass = pass
    }
}

class PassCar: Pass {
    var pass: Bool
    var car: Int
    var sportCar: Int
    
    func addCar () -> Int {
        return car + sportCar
    }
    
    init(car: Int, sportCar: Int, pass: Bool) {
        self.car = car
        self.sportCar = sportCar
        self.pass = pass
    }
}

struct Stack<T: Pass> {
    private var queues: [T] = []
    
    mutating func push (_ queue: T) {
        queues.append(queue)
    }
    mutating func pop () ->T {
        return queues.removeLast()
    }
}

var stackPassPersone = Stack<PassPerson>()
var stackPassCar = Stack<PassCar>()

stackPassPersone.push(PassPerson(russian: 5, foreigner: 4, pass: true))
stackPassPersone.push(PassPerson(russian: 10, foreigner: 20, pass: true))
stackPassPersone.push(PassPerson(russian: 12, foreigner: 6, pass: true))
stackPassPersone.push(PassPerson(russian: 4, foreigner: 10, pass: true))

stackPassPersone.pop()
stackPassPersone.pop()
stackPassPersone.pop()
stackPassPersone.pop()

stackPassCar.push(PassCar(car: 4, sportCar: 1, pass: true))
stackPassCar.push(PassCar(car: 28, sportCar: 3, pass: true))
stackPassCar.push(PassCar(car: 45, sportCar: 2, pass: true))

stackPassCar.pop()
stackPassCar.pop()
stackPassCar.pop()






