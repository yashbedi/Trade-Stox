//
//  ChartHandling.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit
import Charts

extension ViewController
{
    open func chartSetup()
    {
        chartView.chartDescription?.enabled = false
        chartView.rightAxis.labelTextColor = .clear
        for _ in 0..<2
        {
            chartView.zoomIn()
        }
    }
}

