//
//  ViewController.swift
//  imageSlider
//
//  Created by soyounglee on 2020/10/03.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController {
    
    @IBOutlet var myImageSlide : ImageSlideshow!

    let imageResources = [
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1601625741156-d0549cee8991?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1593642532871-8b12e02d091c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1581428433377-e3d407991020?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1601626926386-190a379a5fa1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), renderingMode: .alwaysOriginal), options: .none)!
    ]
    
    let mySecondSlideShow : ImageSlideshow = {
        let slideShow = ImageSlideshow()
        // 터치가능 설정
        slideShow.isUserInteractionEnabled = true
        slideShow.slideshowInterval = 2.5
        slideShow.contentScaleMode = .scaleAspectFill
        slideShow.translatesAutoresizingMaskIntoConstraints = false
        return slideShow
    }()
    
    let labelBgView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9025835395, green: 0.8972183466, blue: 0.9067078233, alpha: 0.5429955051)
        view.layer.cornerRadius = 12
        // autolayout을 사용하여 view의 크기와 위치를 동적으로 계산하기 위해서 false로 지정
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let myLabelIndicator : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "그림이다그림"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        let labelPageIndicator = LabelPageIndicator()
        labelPageIndicator.textColor = .white
        mySecondSlideShow.pageIndicator = labelPageIndicator
        mySecondSlideShow.setImageInputs(imageResources)
        
        
        //view 추가
        self.view.addSubview(mySecondSlideShow)
        //오토레이아웃
        NSLayoutConstraint.activate([
            mySecondSlideShow.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mySecondSlideShow.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mySecondSlideShow.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mySecondSlideShow.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        mySecondSlideShow.addSubview(labelBgView)
        NSLayoutConstraint.activate([
            labelBgView.centerXAnchor.constraint(equalTo: labelPageIndicator.centerXAnchor),
            labelBgView.centerYAnchor.constraint(equalTo: labelPageIndicator.centerYAnchor),
            labelBgView.widthAnchor.constraint(equalTo: labelPageIndicator.widthAnchor, multiplier: 1.2),
            labelBgView.heightAnchor.constraint(equalTo: labelPageIndicator.heightAnchor, multiplier: 1.2)
        ])
        
        print("UIDevice.current.hasNotch: \(UIDevice.current.hasNotch)")
        
        // mySecondSlideShow에서 가장 앞에 두고 싶을 때
        mySecondSlideShow.bringSubviewToFront(labelPageIndicator)
        
        // 페이지 표시 위치 설정
        mySecondSlideShow.pageIndicatorPosition = .init(horizontal: .right(padding: 20), vertical: .customBottom(padding: UIDevice.current.hasNotch == true ? -10 : 20))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        mySecondSlideShow.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myImageSlide.setImageInputs(imageResources)
        myImageSlide.contentScaleMode = .scaleAspectFill
        
        //1초에 한번씩 자동으로 움직이게
        myImageSlide.slideshowInterval = 1
    }
    
    @objc func didTap(_ sender: UITapGestureRecognizer? = nil){
        print("ViewControlloer - didTap() called")
        let fullScreenController = mySecondSlideShow.presentFullScreenController(from: self, completion: nil)
        fullScreenController.view.addSubview(myLabelIndicator)
        
        //오토 레이아웃은 크기 + 위치 but 라벨은 폰트 크기가 때문에 크기를 정해주지 않아도 됨
        myLabelIndicator.topAnchor.constraint(equalTo: fullScreenController.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        myLabelIndicator.centerXAnchor.constraint(equalTo: fullScreenController.view.centerXAnchor).isActive = true
        let currentPageString = String(fullScreenController.slideshow.currentPage + 1)
        myLabelIndicator.text = currentPageString + " / \(fullScreenController.slideshow.images.count)"
        fullScreenController.slideshow.delegate = self
    }

}


extension ViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("ViewController - didChangeCurrentPageTo() called - page : \(page)")
        myLabelIndicator.text = String(page + 1) + " / " + String(imageSlideshow.images.count)
    }
}

extension UIDevice {
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            if UIApplication.shared.windows.count == 0 { return false }
            let top = UIApplication.shared.windows[0].safeAreaInsets.top
            return top > 20 // 노치가 있다는 뜻
        } else {
            return false
        }
    }
}
