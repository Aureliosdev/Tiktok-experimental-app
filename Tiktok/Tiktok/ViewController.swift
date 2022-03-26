//
//  ViewController.swift
//  Tiktok
//
//  Created by Aurelio Le Clarke on 24.03.2022.
//

import UIKit

class ViewController: UIViewController {
    private var collectioView: UICollectionView?
    private var data = [VideoModel]()


    
    
    
    func PresentVideo() {
    for _ in 1...1 {
let model = VideoModel(caption: "@AureliosDev",
                                   username: "🎶Arash ft Helena - Broken Angel",
                                   audioTrackName: "JISOO crash😍😍😍",
                                   videoFileName:"JISOO",
                                   videoFormat:"mp4")
            
let secondModel = VideoModel(caption: "@AureliosDev",
                                         username: "🎶Weeknd = Often remix(slowed)",
                                         audioTrackName: "My current mood🔥🔥",
                                         videoFileName: "91video",
                                         videoFormat: "mp4")

                         
                         
            data.append(model)
            data.append(secondModel)

}
}
    func CollectionViewLayout() {
        
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .vertical
          layout.itemSize = CGSize(width: view.frame.size.width,
                                   height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
          collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collectioView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.indetifier)
        collectioView?.isPagingEnabled = true
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        PresentVideo()
      CollectionViewLayout()
       collectioView?.dataSource = self
        collectioView?.delegate = self
        view.addSubview(collectioView!)
       
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectioView?.frame = view.bounds
        
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                            VideoCollectionViewCell.indetifier, for: indexPath) as! VideoCollectionViewCell
        cell.configure(with: model)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let nextScreen = cell as? VideoCollectionViewCell {
            nextScreen.player?.pause()
        }

        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
}
