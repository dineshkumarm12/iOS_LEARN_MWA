//
//  UsersView.swift
//  MWA
//
//  Created by Dinesh Kumar.M on 05/01/25.
//
import SwiftUI
struct UsersView: View {
    @StateObject private var vm: UserDetailVM = UserDetailVM()
    var body: some View {
        VStack {
            if let users = vm.userData {
                ForEach(users, id: \.self) { user in
                    Text("Name: \(user.username)")
                    Text("Address: \(user.address)")
                }
            } else {
                Text("Loading...")
            }
        }
        .padding()
        .onAppear() {
            vm.fetchUserDetail()
        }
        .onReceive(vm.$userData) { value in
            print("vm updated")
        }
    }
}

#Preview {
    UsersView()
}
