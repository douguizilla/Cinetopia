//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Douglas Gomes on 21/09/25.
//

import UIKit

class MoviesViewController: UIViewController {
    var names = ["Ana", "Geovana", "Lucas", "Daniel", "Mariana", "Arthur", "Isabela", "Arthur", "Isabela"]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "nameCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigation()
        addSubviews()
        setupConstraints()
    }
    
    
    
    private func addSubviews(){
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupNavigation(){
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension MoviesViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = names[indexPath.row]
        configuration.textProperties.color = UIColor.white
        cell.contentConfiguration = configuration
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
