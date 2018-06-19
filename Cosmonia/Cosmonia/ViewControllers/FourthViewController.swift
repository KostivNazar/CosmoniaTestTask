//
//  FourthViewController.swift
//  Cosmonia
//
//  Created by Mac on 12.06.18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    var timer: Timer?
    var progress: Float = 0
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonLoad: UIButton!
    @IBAction func pushButtonLoadAction(_ sender: Any) {
        progress = 0
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(tik), userInfo: nil, repeats: true)
        timer?.fire()
        
        progressView.isHidden = false
       // imageView.downloadedFrom(link: textField.text!)

    }

    @objc func tik() {
        progress += 0.1
        progressView.progress = progress
        if progress >= 1 {
            timer?.invalidate()
            progressView.isHidden = true
            imageView.downloadedFrom(link: textField.text!)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.isHidden = true
    }
    
}
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

    
extention FourthViewController: UITextFieldDelegate {
    
}















