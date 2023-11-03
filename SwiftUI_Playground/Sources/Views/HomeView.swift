//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UserNotifications

struct HomeView: View {

    var body: some View {
        Button("Show Notification") {
            scheduleLocalNotification()
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                if success {
                    print("Notification permission granted.")
                } else if let error = error {
                    print("Error requesting notification permission: \(error)")
                }
            }
        }
    }

    private func scheduleLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.body = "This is the notification body."
        content.sound = UNNotificationSound.default

        // Define the trigger for the notification (e.g., show it after 5 seconds).
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        // Create a unique identifier for the notification.
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // Add the notification request to the notification center.
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully.")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
