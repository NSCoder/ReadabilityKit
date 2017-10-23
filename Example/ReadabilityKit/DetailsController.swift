//
//  DetailsController.swift
//  ReadabilityKit
//
//  Copyright (c) 2016 Exyte http://www.exyte.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class DetailsController: UIViewController {

	@IBAction func onDone() {
		self.dismiss(animated: true, completion: .none)
	}

	@IBOutlet weak var titleView: UITextView?
	@IBOutlet weak var imageView: UIImageView?
	@IBOutlet weak var keywordsView: UITextView?
	@IBOutlet weak var descriptionView: UITextView?
	@IBOutlet weak var videoURLView: UITextView?

	var image: UIImage?
	var titleText: String?
	var desc: String?
	var keywords: [String]?
	var videoURL: String?

	override func viewDidLoad() {
		super.viewDidLoad()

		titleView?.text = titleText
		imageView?.image = image
		keywordsView?.text = keywords?.joined(separator: ", ")
		descriptionView?.text = desc

		if let videoURLVal = videoURL {
			videoURLView?.text = videoURLVal
			videoURLView?.isHidden = false

			let videoURLRecongnizer = UITapGestureRecognizer(target: self, action: #selector(DetailsController.openVideo))
			videoURLView?.addGestureRecognizer(videoURLRecongnizer)
		} else {
			videoURLView?.isHidden = true
		}
	}

    @objc func openVideo() {
		if let url = URL(string: self.videoURLView!.text) {
			UIApplication.shared.openURL(url)
		}
	}
}
