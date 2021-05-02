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
        NavigationView {
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack(alignment: .leading, spacing: 16) {
//
//                    Text("Let us see what the data about climate change says")
//                        .font(.custom("SF Compact Rounded", size: 25))
//                        .fontWeight(.semibold)
//                        .lineSpacing(3)
//                    // Bar Chart
//                    Group {
//                        Divider()
//                        Text("Emission of CO2 Over Year in Tonnes")
//                            .font(.title2)
//                            .bold()
//                            .padding(.top,15)
//
//                        Text("As we now know that greenhouse gas emissions result in an increase in climatic temperature, you can see from the below chart on how much greenhouse gases are we emitting in Melbourne every year.")
//                            .font(.custom("SF Compact Rounded", size: 20))
//                            .lineSpacing(3)
//
//                        BarChartView(data: ChartData(values: chart1data), title: "", form: ChartForm.extraLarge,dropShadow: false)
//                    }
//
//
//                    // Pie Chart
//                    /*
//                    Group {
//                        Divider()
//                        Text("Pie Chart")
//                            .font(.title2)
//                            .bold()
//                            .padding(.top,15)
//
//
//                        Text("You can see in the below pie chart that CO2 emissions by our cars is almost more than half of the total emissions.")
//                            .font(.custom("SF Compact Rounded", size: 20))
//                            .lineSpacing(3)
//                    }*/
//
//
//                    // MultiLine Chart
//                    Group {
//                        Divider()
//                        Text("Change in Sealand Temperature Over Years")
//                            .font(.title2)
//                            .bold()
//                            .padding(.top,15)
//
//                        Text("Which results in an increase in climatic temperature like, temperature of the air and temperature of the sea water. You can see that climatic temperature change in the below chart.")
//                            .font(.custom("SF Compact Rounded", size: 20))
//                            .lineSpacing(3)
//                        MultiLineChartView(data: [(chart3data1,GradientColors.blue), (chart3data2,GradientColors.orange)], title: "", form: ChartForm.extraLarge,dropShadow: false)
//                    }
//
//
//                    // Line Chart
//                    Group {
//                        Divider()
//                        Text("Average Daily Rainfall Over Years")
//                            .font(.title2)
//                            .bold()
//                            .padding(.top,15)
//
//                        Text("Which results in extreme weather conditions like increased daily temperature and increased rainfall as in the charts below over the years.")
//                            .font(.custom("SF Compact Rounded", size: 20))
//                            .lineSpacing(3)
//                        LineChartView(data: chart4data, title: "", form: ChartForm.extraLarge,dropShadow: false)
//                    }
//
//                    Group {
//                        Divider()
//                        Text("Average Daily Temperature Over Years")
//                            .font(.title2)
//                            .bold()
//                            .padding(.top,15)
//
//                        Text("Having these extreme conditions for a prolonged period will cause floods and droughts.")
//                            .font(.custom("SF Compact Rounded", size: 20))
//                            .lineSpacing(3)
//
//                        LineChartView(data: chart5data, title: "", form: ChartForm.extraLarge, dropShadow: false)
//                    }
//                }
//                .padding()
//
//            }
            
            List {
                Section(header: Text("Let us see what the data about climate change says").font(.custom("SF Compact Rounded", size: 25)).fontWeight(.semibold).foregroundColor(.primary).textCase(.none)) {}
                
                Section(header: Text("Emission of CO2 Over Year in Tonnes").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("As we now know that greenhouse gas emissions result in an increase in climatic temperature, you can see from the below chart on how much greenhouse gases are we emitting in Melbourne every year.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        BarChartView(data: ChartData(values: chart1data), title: "", form: ChartForm.extraLarge,dropShadow: false)
                            .padding(.leading, -13)
                    }
                    .padding(.vertical, 8)
                }
                
                Section(header: Text("Change in Sealand Temperature Over Years").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("Which results in an increase in climatic temperature like, temperature of the air and temperature of the sea water. You can see that climatic temperature change in the below chart.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        MultiLineChartView(data: [(chart3data1,GradientColors.blue), (chart3data2,GradientColors.orange)], title: "", form: ChartForm.extraLarge,dropShadow: false)
                            .padding(.leading, -13)
                            .padding(.bottom, -25)
                    }
                    .padding(.vertical, 8)
                }
                
                Section(header: Text("Average Daily Rainfall Over Years").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("Which results in extreme weather conditions like increased daily temperature and increased rainfall as in the charts below over the years.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        LineChartView(data: chart4data, title: "", form: ChartForm.extraLarge,dropShadow: false)
                            .padding(.leading, -13)
                    }
                    .padding(.vertical, 8)
                }
                
                Section(header: Text("Average Daily Temperature Over Years").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("Having these extreme conditions for a prolonged period will cause floods and droughts.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        LineChartView(data: chart5data, title: "", form: ChartForm.extraLarge, dropShadow: false)
                            .padding(.leading, -13)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Story")
            .onAppear(perform: {
                if od?.avgRainfallTemperture == nil{
                    self.getOpenData()
                }
            })
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
            
            
            //let jsonData = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            let opendata = try! decoder.decode(openData.self, from: data!)
            od = opendata
            
            
            chart1data = []
            for item in opendata.emissions{
                chart1data.append((String(item.year),item.totalEmissions))
            }
            
            chart3data1 = []
            chart3data2 = []
            for item in opendata.seaLandTemp{
                chart3data1.append(Double(item.seaTemp))
                chart3data2.append(Double(item.landTemp))
            }
            
            chart4data = []
            chart5data = []
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


