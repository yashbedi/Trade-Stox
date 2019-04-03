//
//  ViewController.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit
import Charts
import SocketIO

class ViewController: BaseViewController
{
    // MARK : IBOutlets
    
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var upstoxTableView: UITableView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var dynamicLabel: UILabel!
    
    // MARK : Public Properties
    
    public var leftArray = [Double]()
    public var rightArray = [Double]()
    
    public var socket : SocketIOClient?
    public let manager = SocketManager(socketURL: URL(string: Constants.BaseURL)!,
                                       config: [.log(false), .compress,.forcePolling(true)])
    
    // MARK : View Hierarchy Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        socket = manager.socket(forNamespace: "/watch")
        addHandlers()
        socket?.connect()
        chartSetup()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        fetchHistoricData()
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        setUpTableView()
    }
    
    // MARK : IBActions
    
    @IBAction func buyButtonClicked(_ sender: Any)
    {
        socket?.emit("ping", with: [])
    }
    
    @IBAction func sellButtonClicked(_ sender: Any)
    { }
}

