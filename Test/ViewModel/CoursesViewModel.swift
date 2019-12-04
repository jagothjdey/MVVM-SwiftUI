import Foundation
import Combine

let apiURL = "https://api.letsbuildthatapp.com/static/courses.json"

struct Course : Identifiable,Decodable{
    let id = UUID()
    let name : String
}

class CoursesViewModel: ObservableObject{
    @Published var messages = "Messages inside observable object"
    @Published var courses : [Course] = [
        .init(name: "Course 1"),
        .init(name: "Course 2"),
        .init(name: "Course 3"),
        .init(name: "Course 4"),
        .init(name: "Course 5")
    ]
    
    func fetch(){
        guard let url = URL(string: apiURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.courses = try! JSONDecoder().decode([Course].self, from: data!)
            }
        }.resume()
    }
   
}
