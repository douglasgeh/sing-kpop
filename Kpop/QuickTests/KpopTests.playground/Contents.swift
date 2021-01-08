import UIKit

//PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://dbkpop.com/db/k-pop-girlgroups")!

let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
    guard let data = data else { return }
    print(String(data: data, encoding: .utf8)!)
}

task.resume()
