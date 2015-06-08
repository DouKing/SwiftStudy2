//
//  main.swift
//  SwiftStudy2
//
//  Created by Paney on 14-6-8.
//  Copyright (c) 2014年 secoo. All rights reserved.
//

import Foundation

println("Hello, World!")

//定义结构体
struct Reslution {
    var width = 0.0
    var height = 0.0
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

//定义类
class VideoMode {
    var reslution = Reslution(width:1080, height:720)//使用结构体创建一个实例
    var frameRate = 0.1
}

var reslution1 = Reslution(width:1080, height:720)//如果结构体在创建的时候没有初始值，那么在实例化的时候必须要初始化

var videoMode = VideoMode()//使用类创建一个实例

videoMode.frameRate = 0.2//可以赋值
videoMode.reslution.width = 1280


struct Point {
    var x = 0
    var y = 0
}
struct Size {
    var width = 0
    var height = 0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point{
        set{
            //newValue 是默认的值
            self.origin = Point(x: newValue.x - self.size.width/2, y:newValue.y - self.size.height/2)
        }
        get{
            return Point(x:self.origin.x + self.size.width/2, y:self.origin.y + self.size.height/2)
        }
    }
    
    //改变属性的值，需要加 mutating
    mutating func changeCenter(center:Point){
        self.center = center
    }
}

var origin = Point(x: 0, y: 0)
var size = Size(width: 100, height: 100)
var frame = Rect()
frame.origin = origin
frame.size = size
println("frame center: x = \(frame.center.x), y = \(frame.center.y)")

frame.center = Point(x: 100, y:100)
println("frame center: x = \(frame.center.x), y = \(frame.center.y)")


class Person {
    //类型属性
    class var star:String {
        set{
            
    }
        get{
            return "earth"
    }
    }
    var identify = ""
    let someValue: Int
    var name: String?
    var sex: String
    init(sex: String, name:String) {
        self.name = name
        self.sex = sex
        someValue = 1   //在构造器中初始化
    }
    func description()-> String {
        return "name = \(self.name), sex = \(self.sex)"
    }
//    class func description()-> String {  //在结构体中使用static
//        return "name = \(self.name), sex = \(self.sex)"
//    }
    
    
    //析构器, 实例销毁时会自动调用
    deinit {
        
    }
}

var personA = Person(sex:"man",name:"zhangsan")
println(personA.description())
println(Person.star)

var personB = Person(sex:"man",name:"lisi")
println(personB.description())
println(Person.star)

/*   类的继承   */
class Student: Person {
    override init(sex:String, name:String) {
        super.init(sex:sex, name:name)
        self.identify = "student"
    }
    
    //重写父类的方法
    override func description()-> String {
        return "I am a student and " + super.description()
    }
}

var student: Person = Student(sex: "man", name: "wangwu")
println("student: \(student.description())")

if student is Student {
    println("student: \(student.description())")
} else {
    println("not instance if student!")
}

/*     协议  可以声明属性和方法      可以作为一种类型      */
protocol aProtocol {   //如果声明为@objc protocol, 只能是类遵守的协议， 不能有mutating
    static func typeFunc();//类型方法
    mutating func changeValueFunc()
}

struct aStruct: aProtocol {
    static func typeFunc() {
        
    }
    
    func changeValueFunc() {
        
    }
}

class aClass: aProtocol {
    class func typeFunc() {
        
    }
    
    func changeValueFunc() {
        
    }
}

var aProtocolInstance: aProtocol = aClass()









