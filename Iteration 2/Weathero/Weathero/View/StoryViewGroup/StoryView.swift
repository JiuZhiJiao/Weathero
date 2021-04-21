//
//  StoryView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 21/4/21.
//

import SwiftUI
import SwiftUICharts

struct StoryView: View {
    @State var od: openData?
    @State var chart1data: [(String,Int)] = []
    @State var chart3data1: [Double] = []
    @State var chart3data2: [Double] = []
    @State var chart4data: [Double] = []
    @State var chart5data: [Double] = []
    var body: some View {
        ScrollView(.vertical){
            VStack{
                BarChartView(data: ChartData(values: chart1data), title: "Emission of CO2 over yaer in tonnes", form: ChartForm.extraLarge,dropShadow: false)
                
                MultiLineChartView(data: [(chart3data1,GradientColors.blue), (chart3data2,GradientColors.orange)], title: "Change in sea land temperature over years", form: ChartForm.extraLarge,dropShadow: false)
                
                LineChartView(data: chart4data, title: "Average daily rainfall over the years", form: ChartForm.extraLarge,dropShadow: false)
                
                LineChartView(data: chart5data, title: "Average daily Temperature over the years", form: ChartForm.extraLarge,dropShadow: false)
                
                
            }
            
        }.onAppear(perform: {
            self.getOpenData()
        })
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
            
            
            //let jsonData = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            let opendata = try! decoder.decode(openData.self, from: data!)
            od = opendata
            
            for item in opendata.emissions{
                chart1data.append((String(item.year),item.totalEmissions))
            }
            
            for item in opendata.seaLandTemp{
                chart3data1.append(Double(item.seaTemp))
                chart3data2.append(Double(item.landTemp))
            }
            
            for item in opendata.avgRainfallTemperture{
                chart4data.append(Double(item.rainfall))
                chart5data.append(Double(item.temperture))
            }
            
        })
        task.resume()

    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}


