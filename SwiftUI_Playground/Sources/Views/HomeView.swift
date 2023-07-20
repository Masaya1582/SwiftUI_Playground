//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var bluetoothManager = BluetoothManager()

    var body: some View {
        NavigationView {
            List(bluetoothManager.discoveredDevices, id: \.self) { device in
                Text(device.name ?? "No Device Found")
            }
            .navigationBarTitle("Bluetooth Devices")
        }
        .onAppear {
            bluetoothManager.startScanning()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
