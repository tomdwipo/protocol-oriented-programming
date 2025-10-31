//
//  ViewController.swift
//  protocol
//
//  Created by Tommy-amarbank on 08/08/22.
//

import UIKit
protocol Vehicle {
    var hitPoints: Int { get set }
}

extension Vehicle {
    mutating func takeHit(amount: Int) {
        hitPoints -= amount
    }
    
    func hitPointsRemaining() -> Int {
        return hitPoints
    }
    
    func isAlive() -> Bool {
        return hitPoints > 0 ? true : false
    }
    
}

class ViewController: UIViewController, Vehicle {
    var hitPoints: Int = 43
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(hitPointsRemaining())
        network.call()
        // Do any additional setup after loading the view.
    }


}

struct ResponseModel: Decodable {
    var data: [ResponseData]
}

struct ResponseData: Decodable {
    var field: String?
}

struct network {
    static func call(){
        let url = URL(string: "https://dev-ruangkonstruksi-backend.herokuapp.com/field")
        guard let url = url else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
                print(data?.description)
                
            }
        }.resume()
    }
}
