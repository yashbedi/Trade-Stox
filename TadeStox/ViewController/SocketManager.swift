//
//  SocketManager.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit
import SocketIO

extension ViewController
{
    func addHandlers()
    {
        manager.handleQueue.async{
            
            self.socket?.on(clientEvent: .connect) {[weak self] data, ack in
                print("Socket Connected : ",data)
                let param : [[String:Any]] = [["state":true]]
                let arr : [Any] = param as [Any]
                self?.socket?.emit("sub", with: arr)
            }
            
            self.socket?.on("data", callback: { [weak self] data, ack in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                    ack.with(1)
                })
                
                guard
                    //let dataAsArr = data as? Array<Any>,
                    data.count > 0,
                    let dataAsNSStr = data.first as? NSString else{
                        return
                }
                
                let Object = dataAsNSStr.components(separatedBy: ",")
                let index = 2
                let isIndexValid = Object.indices.contains(index)
                if isIndexValid {
                    self?.dynamicLabel.text = "$\(Object[index]).00"
                }
                return
            })
            
            self.socket?.on("error", callback: {error, ack in
                print("Error : ",error)
                return
            })
            
            self.socket?.onAny {_ in 
                //print("Got event: \($0.event), with items: \($0.items!)")
            }
        }
    }
    
    @objc func sendUnSubButtonClicked(_ sender : UIButton)
    {
        let param : [[String:Any]] = [["state":false]]
        let arr : [Any] = param as [Any]
        socket?.emit("unsub", with: arr)
    }
}
