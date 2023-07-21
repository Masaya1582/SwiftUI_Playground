//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ReminderViewModel()
    @State private var newReminderTitle = ""
    @State private var selectedDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.notificationStatus == .notDetermined {
                    Button("Ask for Permission") {
                        viewModel.requestNotificationPermission()
                    }
                } else if viewModel.notificationStatus == .denied {
                    Text("Please enable notification permissions in Settings to use the reminder feature.")
                        .padding()
                } else {
                    List {
                        Section(header: Text("Reminders")) {
                            ForEach(viewModel.reminders) { reminder in
                                HStack {
                                    Text(reminder.title)
                                    Spacer()
                                    Text(formattedDate(reminder.date))
                                        .font(.subheadline)
                                }
                            }
                            .onDelete(perform: deleteReminder)
                        }
                        Section {
                            TextField("Enter reminder", text: $newReminderTitle)
                            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                        }

                        Section {
                            Button("Add Reminder") {
                                let newReminder = Reminder(title: newReminderTitle, date: selectedDate)
                                viewModel.scheduleNotification(for: newReminder)
                                newReminderTitle = ""
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Reminder App")
        }
    }

    private func deleteReminder(at offsets: IndexSet) {
        viewModel.reminders.remove(atOffsets: offsets)
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
