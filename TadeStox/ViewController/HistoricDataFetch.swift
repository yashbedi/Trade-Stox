//
//  HistoricDataFetch.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit
import Alamofire
import Charts

extension ViewController
{
    open func fetchHistoricData()
    {
        Alamofire.request(URL(string: "\(Constants.BaseURL)\(Constants.FetchHistory)?interval=1")!).responseJSON { response in
            switch response.result
            {
            case .success(let history):
                guard let historyArray = history as? Array<NSString> else {
                    super.showAlert(title: Constants.Error, message: Constants.ApiFailErrorMessage)
                    return
                }
                
                let setOpen = LineChartDataSet(values: nil, label: Constants.kOpen)
                let setHigh = LineChartDataSet(values: nil, label: Constants.kHigh)
                let setLow = LineChartDataSet(values: nil, label: Constants.kLow)
                let setClose = LineChartDataSet(values: nil, label: Constants.kClose)
                
                //var dateArray = [Double]()
                var openArray = [Double]()
                var highArray = [Double]()
                var lowArray = [Double]()
                var closeArray = [Double]()
                var volumeArray = [Double]()
                
                for (index,object) in historyArray.enumerated(){
                    let historyObject = object.components(separatedBy: ",")
                    //let date = historyObject[0] as NSString
                    let open = historyObject[1] as NSString
                    let high = historyObject[2] as NSString
                    let low = historyObject[3] as NSString
                    let close = historyObject[4] as NSString
                    let volume = historyObject[5] as NSString
                    
                    volumeArray.append(volume.doubleValue)
                    highArray.append(high.doubleValue)
                    lowArray.append(low.doubleValue)
                    openArray.append(open.doubleValue)
                    closeArray.append(close.doubleValue)
                    
                    // O
                    let openEntry = ChartDataEntry(x: Double(index), y: open.doubleValue)
                    setOpen.lineWidth = 4
                    setOpen.setCircleColor(NSUIColor.clear)
                    setOpen.circleHoleColor = .clear
                    setOpen.colors = [.green]
                    _ = setOpen.addEntry(openEntry)
                    // H
                    let highEntry = ChartDataEntry(x: Double(index), y: high.doubleValue)
                    setHigh.lineWidth = 4
                    setHigh.setCircleColor(NSUIColor.clear)
                    setHigh.circleHoleColor = .clear
                    setHigh.colors = [.red]
                    _ = setHigh.addEntry(highEntry)
                    // L
                    let lowEntry = ChartDataEntry(x: Double(index), y: low.doubleValue)
                    setLow.lineWidth = 4
                    setLow.setCircleColor(NSUIColor.clear)
                    setLow.circleHoleColor = .clear
                    setLow.colors = [.lightGray]
                    _ = setLow.addEntry(lowEntry)
                    // C
                    let closeEntry = ChartDataEntry(x: Double(index), y: close.doubleValue)
                    setClose.lineWidth = 4
                    setClose.setCircleColor(NSUIColor.clear)
                    setClose.circleHoleColor = .clear
                    setClose.colors = [.yellow]
                    _ = setClose.addEntry(closeEntry)
                }
                
                let data = LineChartData(dataSets: [setOpen,setHigh,setLow,setClose])
                self.chartView.data = data
                self.chartView.notifyDataSetChanged()
                
                self.leftArray.append(highArray.last!)
                self.leftArray.append(openArray.last!)
                self.leftArray.append(super.getAvg(volumeArray))
                self.leftArray.append(super.getAvg(highArray))
                
                self.rightArray.append(lowArray.last!)
                self.rightArray.append(closeArray.last!)
                self.rightArray.append(volumeArray.last!)
                self.rightArray.append(super.getAvg(lowArray))
                self.upstoxTableView.reloadData()
            case .failure(let error):
                super.showAlert(title: Constants.Error, message: error.localizedDescription)
            }
        }
    }
}
