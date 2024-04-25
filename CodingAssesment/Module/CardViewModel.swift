//
//  CardsViewModel.swift
//  CodingInterviewSampleProject2022
//
//  Created by Sujal Shrestha on 23/03/2024.
//

import Foundation
import Combine

class CardViewModel {
    var cancellables = [AnyCancellable]()
    let cardsData = CurrentValueSubject<[CardModel], Never>([])
    let apiClient = NetworkClient()
    let apiUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    func getCardList() {
        apiClient.makeCardAPICall(url: apiUrl) { result in
            switch result {
            case .success(let data):
                print("Data received: \(data)")
                self.cardsData.send(data)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

