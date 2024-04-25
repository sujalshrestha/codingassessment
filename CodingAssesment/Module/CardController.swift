//
//  ViewController.swift
//  CodingInterviewSampleProject2022
//
//

import UIKit

class CardsController: UIViewController {
    var currentView = CardView()
    let viewModel = CardViewModel()
    var allcardModel = [CardModel]()
    var displayedcardModel = [CardModel]()
    let itemsPerPage = 20
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        getCardsData()
        observeViewModelEvents()
    }
    
    private func setupTable(){
        currentView.cardTable.register(CardCell.self, forCellReuseIdentifier: CardCell.identifier)
        currentView.cardTable.delegate = self
        currentView.cardTable.dataSource = self
    }
    
    private func getCardsData() {
        viewModel.getCardList()
    }
    
    private func observeViewModelEvents() {
        viewModel.cardsData.sink { [weak self] cardModel in
            guard let self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.allcardModel = cardModel
                self.loadNextPage()
            }
        }.store(in: &viewModel.cancellables)
    }
    
    override func loadView() {
        super.loadView()
        view = currentView
    }
}

//MARK: - TableView Delegates
extension CardsController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedcardModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.configCell(data: displayedcardModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == displayedcardModel.count - 1 && displayedcardModel.count < allcardModel.count{
            currentPage += 1
            loadNextPage()
        }
    }
    
    func loadNextPage() {
        let startIndex = (currentPage - 1) * itemsPerPage
        let endIndex = min(startIndex + itemsPerPage, allcardModel.count)
        displayedcardModel.append(contentsOf: Array(allcardModel[startIndex..<endIndex]))
        currentView.cardTable.reloadData()
    }
}



