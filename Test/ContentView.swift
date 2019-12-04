import SwiftUI

struct ContentView: View {
    
    @ObservedObject var coursesViewModel = CoursesViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 5){
                    ForEach(coursesViewModel.courses){course in
                        Text(course.name)
                            .frame(width: UIScreen.main.bounds.width-50, alignment: .center)
                            .padding([.leading,.top,.bottom,.trailing], 12)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .cornerRadius(5)
                    }
                }
            }
                
            .navigationBarTitle("Courses")
            .navigationBarItems(trailing:
                Button(action: {
                    self.coursesViewModel.fetch()
                }) {
                    Text("Fetch Courses")
                        .padding([.leading,.bottom,.trailing,.top], 10)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                }
            )
        }
    }
}
