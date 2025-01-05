//
//  UserDetailVM.swift
//  MWA
//
//  Created by Dinesh Kumar.M on 05/01/25.
//
import Foundation
import Combine

final class UserDetailVM: ObservableObject {
    @Published var userData: [UserDetail]?
    @Published var errorMessage: String?
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(userData: [UserDetail]? = nil) {
        self.userData = userData
        self.errorMessage = nil
    }
    
    func fetchUserDetail() {
        print("Fetch User Detail Called")
        
        guard let url = URL(string: "http://localhost:3000/api/hello") else {
            errorMessage = "Invalid URL"
            return
        }
        
        NetworkManager.fetchData(url: url)
            .decode(type: [UserDetail].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
                    print(error)
                case .finished:
                    print("Finished")
                    break
                }
            },
                receiveValue: { [weak self] userDetail in
                print("userDetail:\(userDetail)")
                self?.userData = userDetail
            })
            .store(in: &cancellables)
        
        
    }
    
}
