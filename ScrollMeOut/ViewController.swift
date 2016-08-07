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
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		// mainScrollView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
		mainScrollView.clipsToBounds = false
		mainScrollView.frame.size.width = 235
		
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


}

