//
//  StoryView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 21/4/21.
//

import SwiftUI
import SwiftUICharts

struct StoryView: View {
    @State var downloaded: Bool = false
    @State var od: openData?
    
    @State var pieData: PieChartData?
    @State var barData: BarChartData?
    @State var lineData1: LineChartData?
    @State var lineData2: LineChartData?
    @State var multiLineData: MultiLineChartData?
    
        
    @State var pieChartStyle = PieChartStyle(infoBoxPlacement: .floating)
    @State var lineChartStyle = LineChartStyle(infoBoxPlacement: InfoBoxPlacement.floating, globalAnimation: Animation.easeIn)
    @State var barChartStyle = BarChartStyle(infoBoxPlacement: .floating, globalAnimation: Animation.default)
    @State var barStyle = BarStyle(barWidth: 0.7, cornerRadius: CornerRadius(top: 10, bottom: 10), colourFrom: ColourFrom.barStyle, colour: ColourStyle(colour: .blue))
    
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
                
                Section(header: Text("Emission of CO2 Over Year (2013-2019)").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("As we now know that greenhouse gas emissions result in an increase in climatic temperature, you can see from the below chart on how much greenhouse gases are we emitting in Melbourne every year.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        if (barData != nil) {
                            BarChart(chartData: barData!)
                                .touchOverlay(chartData: barData!, specifier: "%.0f")
                                .floatingInfoBox(chartData: barData!)
                                .frame(minWidth: 300 ,maxWidth: 900, minHeight: 150, maxHeight: 400, alignment: .center)
                                .xAxisLabels(chartData: barData!)
                                .padding(.leading, -13)
                        }
                        
                    }
                    .padding(.vertical, 8)
                }
                
                
                Section(header: Text("Distribution of CO2 emissions in 2019").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("You can see in the pie chart below that CO2 emissions by our cars are almost more than half of the total emissions.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        if (pieData != nil) {
                            PieChart(chartData: pieData!)
                                .touchOverlay(chartData: pieData!, specifier: "%.0f")
                                .floatingInfoBox(chartData: pieData!)
                                .legends(chartData: pieData!, columns: [GridItem(.flexible()), GridItem(.flexible())])
                                .frame(minWidth: 300 ,maxWidth: 900, minHeight: 300, maxHeight: 400, alignment: .center)
                                .padding(.leading, -13)
                        }
                        
                    }
                    .padding(.vertical, 8)
                }
                
                
                Section(header: Text("Change in Sealand Temperature (2000-2015)").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("Which results in an increase in climatic temperature like, the temperature of the air and temperature of the sea water. You can see that climatic temperature change in the below chart.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        if (multiLineData != nil) {
                            MultiLineChart(chartData: multiLineData!)
                                .touchOverlay(chartData: multiLineData!, specifier: "%.2f")
                                .floatingInfoBox(chartData: multiLineData!)
                                .frame(minWidth: 300 ,maxWidth: 900, minHeight: 150, maxHeight: 400, alignment: .center)
                                .legends(chartData: multiLineData!, columns: [GridItem(.flexible()), GridItem(.flexible())])
                                .padding(.leading, -13)
                                .padding(.bottom, -15)
                        }
                        
                    }
                    .padding(.vertical, 8)
                }
                
                Section(header: Text("Average Daily Rainfall (2000-2020)").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("Which results in extreme weather conditions like increased daily temperature and increased rainfall as in the charts below over the years.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        if (lineData1 != nil) {
                            LineChart(chartData: lineData1!)
                                .touchOverlay(chartData: lineData1!, specifier: "%.0f")
                                .floatingInfoBox(chartData: lineData1!)
                                .frame(minWidth: 300 ,maxWidth: 900, minHeight: 150, maxHeight: 400, alignment: .center)
                                .legends(chartData: lineData1!, columns: [GridItem(.flexible()), GridItem(.flexible())])
                                .padding(.leading, -13)
                                .padding(.bottom, -15)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                Section(header: Text("Average Daily Temperature (2000-2020)").font(.title2).textCase(.none)) {
                    VStack(alignment:.leading) {
                        Text("Having these extreme conditions for a prolonged period will cause floods and droughts.")
                            .font(.custom("SF Compact Rounded", size: 20))
                            .lineSpacing(3)
                            .padding(.bottom, 8)
                            .padding(.leading, -5)
                        if (lineData2 != nil) {
                            LineChart(chartData: lineData2!)
                                .touchOverlay(chartData: lineData2!, specifier: "%.0f")
                                .floatingInfoBox(chartData: lineData2!)
                                .frame(minWidth: 300 ,maxWidth: 900, minHeight: 150, maxHeight: 400, alignment: .center)
                                .legends(chartData: lineData2!, columns: [GridItem(.flexible()), GridItem(.flexible())])
                                .padding(.leading, -13)
                                .padding(.bottom, -15)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("📊 Story")
            .onAppear(perform: {
                if !downloaded {
                    getOpenData()
                    downloaded = true
                }
            })
        }
    }
    
    
    
    func getOpenData(){
        //API
        let urlComp = NSURLComponents(string: "https://7gdpsmuu74.execute-api.ap-southeast-2.amazonaws.com/iteration2/opendata")!
        
        //Include api key in the header
        let params = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "x-api-key": "bFZsTHexQ59k2WsFWODRF7QuI0d23p4m7HRCc925"
        ]
        
        //Prepare Session
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
            //od = opendata
            
            //Prepare pie chart data
            let emi2016 = opendata.emissions[6]
            pieData = PieChartData(dataSets: PieDataSet(dataPoints: [
                                                            PieChartDataPoint(value: Double(emi2016.cgce), description: "Commer Gas Consumption",colour: .blue),
                                                            PieChartDataPoint(value: Double(emi2016.doge), description: "Distribution of Gas", colour: .yellow),
                                                            PieChartDataPoint(value: Double(emi2016.vehicularEmissions), description: "Vehicular", colour: .red),
                                                            PieChartDataPoint(value: Double(emi2016.solidWasteEmissions), description: "Solid Waste", colour: .green),
                                                            PieChartDataPoint(value: Double(emi2016.wasteWaterEmissions), description: "Waste Water", colour: .orange)],
                                                        legendTitle: "Examples"), metadata: ChartMetadata(),
                                   chartStyle: pieChartStyle)
            
            //Prepare line chart data
            var rainfall = [LineChartDataPoint]()
            var temp = [LineChartDataPoint]()
            
            for item in opendata.avgRainfallTemperture {
                rainfall.append(LineChartDataPoint(value: Double(item.rainfall), xAxisLabel: String(item.year), description: String(item.year)))
                temp.append(LineChartDataPoint(value: Double(item.temperture), xAxisLabel: String(item.year), description: String(item.year)))
            }
            lineData1 = LineChartData(dataSets: LineDataSet(dataPoints: rainfall, legendTitle: "Average Daily Rainfall"), chartStyle: lineChartStyle)
            lineData2 = LineChartData(dataSets: LineDataSet(dataPoints: temp, legendTitle: "Average Daily Temperature"), chartStyle: lineChartStyle)
            
            //Prepare bar chart data
            var totalEmi = [BarChartDataPoint]()
            for item in opendata.emissions {
                totalEmi.append(BarChartDataPoint(value: Double(item.totalEmissions) , xAxisLabel: String(item.year), description: String(item.year)))
            }
            barData = BarChartData(dataSets: BarDataSet(dataPoints: totalEmi, legendTitle: "Annual CO2 Emission"), metadata: ChartMetadata(title: "Emission of CO2 over years in tons"),barStyle: barStyle, chartStyle: barChartStyle)
            
            //Prepare multi line chart data
            var seaTemp = [LineChartDataPoint]()
            var landTemp = [LineChartDataPoint]()
            for item in opendata.seaLandTemp {
                seaTemp.append(LineChartDataPoint(value: Double(item.seaTemp), xAxisLabel: String(item.year), description: String(item.year)))
                landTemp.append(LineChartDataPoint(value: Double(item.landTemp), xAxisLabel: String(item.year), description: String(item.year)))
            }
            multiLineData = MultiLineChartData(dataSets:MultiLineDataSet(dataSets: [
                                                                    LineDataSet(dataPoints: seaTemp, legendTitle: "Sea Temperature", style: LineStyle(lineColour: ColourStyle(colour: .blue))),
                                                                    LineDataSet(dataPoints: landTemp, legendTitle: "Land Temperature", style: LineStyle(lineColour: ColourStyle(colour: .red)))]),
                                               chartStyle: lineChartStyle)
            
            

        })
        task.resume()
        
    }
    
}




struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}


