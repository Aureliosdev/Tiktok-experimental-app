//
//  VideoCollectionViewCell.swift
//  Tiktok
//
//  Created by Aurelio Le Clarke on 25.03.2022.
//

import UIKit
import AVFoundation

protocol VideoCollectionViewCellDelegate: AnyObject {
    func didTapLikeButton(with: VideoModel)
    func didTapComment(with: VideoModel)
    func didTapShare(with: VideoModel)
    func didTapProfile(with: VideoModel)
}
class VideoCollectionViewCell: UICollectionViewCell {
    
    var  player: AVPlayer?
    static let indetifier = "VideoCollectionViewCell"
    private var model: VideoModel?
    
    weak var delegate: VideoCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        addSubviews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        videoContainer.frame = contentView.bounds
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height/1.1
        let size = contentView.frame.size.width/4.5
        
        
        shareButton.frame = CGRect(x: width-size, y: height-size, width: size, height: size)
        likeButton.frame = CGRect(x: width-size, y: height-(size*3), width: size, height: size)
        profileButton.frame = CGRect(x: width-size, y: height-(size*4), width: size, height: size)
        commentButton.frame = CGRect(x: width-size, y: height-(size*2), width: size, height: size)
        
        
        titleLable.frame = CGRect(x: 5, y: height-60, width: width-size-10, height: 50)
        audioLable.frame = CGRect(x: 5, y: height-size-10, width: width-size-10, height: 50)
        overviewLable.frame = CGRect(x: 5, y: height-size-50, width: width-size-10, height: 50)
    }
    
    private let videoContainer = UIView()
    
    private let audioLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
        
    }()
    private let titleLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
        
    }()
    private let overviewLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
        
    }()
    
    private var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.badge.plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .red
        return button
    }()
    private var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "text.bubble"), for: .normal)
        button.tintColor = .white
        return button
    }()
    private var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.turn.up.forward.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private func addSubviews() {
        contentView.addSubview(videoContainer)
        
        contentView.addSubview(overviewLable)
        contentView.addSubview(titleLable)
        contentView.addSubview(audioLable)
        
        contentView.addSubview(profileButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        commentButton.addTarget(self, action:#selector (didTapCommentButton), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        videoContainer.clipsToBounds = true
        contentView.sendSubviewToBack(videoContainer)
    }
     
    public func configure(with model: VideoModel) {
        self.model = model
        
      configureVideo()
        overviewLable.text = model.caption
        audioLable.text = model.audioTrackName
        titleLable.text = model.username
    }
    
    @objc private func didTapProfileButton() {
        guard let model = model else {return}
        delegate?.didTapLikeButton(with: model)
        
    }
    @objc private func didTapLikeButton() {
        guard let model = model else {return}
        delegate?.didTapLikeButton(with: model)
        
    }
    @objc private func didTapCommentButton() {
        guard let model = model else {return}
        delegate?.didTapLikeButton(with: model)
        
    }
    @objc private func didTapShareButton() {
        guard let model = model else {return}
        delegate?.didTapLikeButton(with: model)
        
    }
    override func prepareForReuse() {
        player?.pause()
        overviewLable.text = nil
        audioLable.text = nil
        titleLable.text = nil
    }
    
    private func configureVideo() {
        guard let model = model else {return}
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFormat) else {return}
       let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        videoContainer.layer.addSublayer(playerView)
        player?.volume = 4
        player?.play()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
