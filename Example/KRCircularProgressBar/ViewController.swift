//
//  ViewController.swift
//  KRCircularProgressBar
//
//  Created by kamalraj.venkatesan on 08/31/2018.
//  Copyright (c) 2018 kamalraj.venkatesan. All rights reserved.
//

import UIKit
import KRCircularProgressBar

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var progressBar: KRCircularProgressBar!

  private let byteFormatter: ByteCountFormatter = {
    let formatter = ByteCountFormatter()
    formatter.allowedUnits = [.useKB, .useMB]
    return formatter
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    let url = URL(string: "https://photojournal.jpl.nasa.gov/jpeg/PIA08506.jpg")!

    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)

    session.downloadTask(with: url).resume()
  }
}

extension ViewController: URLSessionDownloadDelegate {

  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    let written = byteFormatter.string(fromByteCount: totalBytesWritten)
    let expected = byteFormatter.string(fromByteCount: totalBytesExpectedToWrite)

    print("Downloaded \(written) / \(expected)")

    DispatchQueue.main.async {
      let value = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)

//      let percentage = Int(value * 100)

      self.progressBar.progress = value

//      self.downloadProgressLabel.text = "\(percentage)%"

    }
  }

  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {

    if let data = try? Data(contentsOf: location), let image = UIImage(data: data) {
      DispatchQueue.main.async {
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.clipsToBounds = true
        self.imageView.image = image
      }
    } else {
      fatalError("Cannot load the image")
    }

  }

}

extension ViewController: KRCircularProgressBarDelegate {
  func processCompleted() {
    print("Process Completed")
    self.progressBar.isHidden = true
  }
}
