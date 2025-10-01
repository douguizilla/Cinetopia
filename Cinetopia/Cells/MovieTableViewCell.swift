//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Douglas Gomes on 29/09/25.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.avatar)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.text = "Avatar"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        label.text = "Lançamento: 18/12/2009"
        return label
    }()
    
    func configureCell(with movie: Movie) {
        movieTitleLabel.text = movie.title
        moviePosterImageView.image = UIImage(named: movie.image)
        movieReleaseDateLabel.text = "Lançamento: \(movie.releaseData)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func addSubviews(){
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(movieReleaseDateLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate(
            [
                moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
                
                movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
                movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
                movieTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
                movieReleaseDateLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
                
            ]
        )
    }
    
    

}
