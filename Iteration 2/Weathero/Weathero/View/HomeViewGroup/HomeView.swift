//
//  HomeView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI
import SwiftUICharts


struct HomeView: View {
    @Binding var selection: Int
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    LoopVideoPlayerView()
                        .scaledToFill()
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    Text("Hi, I am weathero your weather hero. I am on mission to save the world from floods and droughts. \n\nHow about you help me do that?")
                    Text("This is a journey to become a weather hero")
                    Text("All you must do is watch a few videos, take a quiz, and get ready to implement it in your daily life. I need you. Come help me!")
                    
                    
                }
                .padding(.init(top: 16, leading: 32, bottom: 0, trailing: 32))
                
                VStack{
                    Button(action: {self.selection = 1}) {
                        Text("Let's Get Started")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Rectangle().fill(Color.blue))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                    
                    Spacer()
                        .frame(width: 100, height: 20)
                }
                .padding(.top)
                
                
                
            }
            .navigationTitle("Welcome")
        }
    }
}

func getOpenData(){
    let urlComp = NSURLComponents(string: "https://7gdpsmuu74.execute-api.ap-southeast-2.amazonaws.com/iteration2/opendata")!
    
    let params = [
        "Content-Type": "application/json",
        "Accept": "application/json",
        "x-api-key": "bFZsTHexQ59k2WsFWODRF7QuI0d23p4m7HRCc925"
    ]
    
    
    
    var urlRequest = URLRequest(url: urlComp.url!)
    urlRequest.httpMethod = "GET"
    urlRequest.allHTTPHeaderFields = params
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    
    let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
        //let responseString = String(data: data!, encoding: .utf8)
        //print(responseString as Any)
        
        
        let jsonData = String(data: data!, encoding: .utf8)
        let decoder = JSONDecoder()
        let beer = try! decoder.decode(openData.self, from: data!)
        
        print(beer.avgRainfallTemperture.count)
        
    })
    task.resume()

}



// preview of current view
#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selection: .constant(0))
    }
}
#endif
