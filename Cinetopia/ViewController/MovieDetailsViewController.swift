//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Douglas Gomes on 30/09/25.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var movieTitleLabel : UILabel = {
        let label = UILabel()
        label.text = movie.title
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        let url = URL(string: movie.image)
        imageView.kf.setImage(with: url)
        return imageView
    }()
    
    private lazy var movieRateLabel : UILabel = {
        let label = UILabel()
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var synopsisLabel : UILabel = {
        let label = UILabel()
        label.text = movie.synopsis
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        [movieTitleLabel, movieImage, movieRateLabel, synopsisLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                movieTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                
                movieImage.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 16),
                movieImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                movieImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                movieImage.heightAnchor.constraint(equalToConstant: 200),
                
                movieRateLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 16),
                movieRateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                synopsisLabel.topAnchor.constraint(equalTo: movieRateLabel.bottomAnchor, constant: 16),
                synopsisLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                synopsisLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ]
        )
    }
}
