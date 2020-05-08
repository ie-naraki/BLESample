//
//  ViewController.swift
//  BLESample
//
//  Created by Naraki on 4/24/20.
//  Copyright © 2020 i-enter. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    private let centralManager = CBCentralManager()

    @IBOutlet weak var bluetoothStatusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        centralManager.delegate = self
    }
}

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            bluetoothStatusLabel.text = "ON"
            bluetoothStatusLabel.textColor = UIColor.green

        case .poweredOff:
            bluetoothStatusLabel.text = "OF"
            bluetoothStatusLabel.textColor = UIColor.red

        default:
            bluetoothStatusLabel.text = "Unknown"
            bluetoothStatusLabel.textColor = UIColor.gray
        }
    }
}
