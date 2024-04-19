//
//  ViewController.swift
//  UsingJSONinStoryboards
//
//  Created by Sandra Gomez on 4/18/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextView: UITextView!

//    let jsonString = """
//    {
//        "name": "Frank",
//        "age": 48,
//        "gender": "male",
//    }
//"""
    struct Employee: Codable {
        var name: String
        var age: Int
        var gender: String
    }
    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loads the names.json file
        let url = Bundle.main.url(forResource: "names", withExtension: "json")
        guard let jsonData = url
        else {
            print("Data not found")
            return
        }
        
        guard let data = try? Data(contentsOf:jsonData) else { return }
        guard let json = try? JSONSerialization.jsonObject(with: data, options:[]) else {return}
        
        if let dictionary = json as? [String: Any] {
            if let name = dictionary["name"] as? String {
                message += "\(name) "
            }
            if let age = dictionary ["age"] as? Int {
                message += "is a \(age) year old"
            }
            if let gender = dictionary["gender"] as? String {
                message += " \(gender)."
            }
            myTextView.text = message
        }
        
        
        
        
//        let jsonStuff = jsonString.data(using: .utf8)!
//        let decoder = JSONDecoder()
//        let person = try! decoder.decode(Employee.self, from: jsonStuff)
//        let message = "\(person.name) is a \(person.age) year old \(person.gender)"
//        myTextView.text = message
    }
}

