//
//  ViewController.swift
//  ScrollMeOut
//
//  Created by Pedro Pereirinha on 07/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var mainScrollView: UIScrollView!
	
	var images = [UIImageView]()
	var MAX_PAGE: Int {
		return images.count - 1
	}
	let MIN_PAGE = 0
	var CUR_PAGE = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		// mainScrollView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
		
		mainScrollView.clipsToBounds = false
		
		for x in 0...2 {
			let image = UIImage(named: "icon\(x).png")
			let imageView = UIImageView(image: image)
			images.append(imageView)
			
			let newX: CGFloat = mainScrollView.frame.width * (1/2.0 + CGFloat(x))
			
			mainScrollView.addSubview(imageView)
			
			imageView.frame = CGRect(x: newX - 75, y: (mainScrollView.frame.height / 2) - 75 , width: 150, height: 150)
		}
		
		let contentWidth = mainScrollView.frame.width * CGFloat(images.count)
		let contentHeight = mainScrollView.frame.height
		let contenSize = CGSize(width: contentWidth, height: contentHeight)
		
		mainScrollView.contentSize = contenSize
	}

	@IBAction func detectSwipe(_ sender: UISwipeGestureRecognizer) {
		
		if CUR_PAGE < MAX_PAGE && sender.direction == .left {
			moveScrollView(direction: 1)
		}
		
		if CUR_PAGE > MIN_PAGE && sender.direction == .right {
			moveScrollView(direction: -1)
		}
	}

	func moveScrollView(direction: Int) {
		CUR_PAGE = CUR_PAGE + direction
		let newOffSet = CGPoint(x: mainScrollView.frame.width * CGFloat(CUR_PAGE), y: 0)
		mainScrollView.setContentOffset(newOffSet, animated: true)
	}
	
}

