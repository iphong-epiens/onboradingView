//
//  ViewController.swift
//  onboarding
//
//  Created by Inpyo Hong on 2020/12/21.
//

import UIKit
import CHIPageControl

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
//    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet weak var pageControl: CHIPageControlChimayo!
    var guidePageNum: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configGuideView()
    }

    func configGuideView() {
        pageControl.tintColor = UIColor(white: 170.0 / 255.0, alpha: 1.0)
        pageControl.numberOfPages = guidePageNum
//        self.pageControl.delegate = self
        
        for index in 0..<guidePageNum {
            let guidePageView = GuidePageView(frame: UIScreen.main.bounds)
            guidePageView.frame = UIScreen.main.bounds
            // RBG, 투명도 값 설정
//            subView.backgroundColor = UIColor(
//                red: CGFloat(index * 50) / 255.0,
//                green: CGFloat(index * 50) / 255.0,
//                blue: CGFloat(index * 50) / 255.0,
//                alpha: 1
//            )
            // subView의 x좌표를 기기의 너비 * index만큼 주어 각 페이지의 시작 x좌표를 설정
            guidePageView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            scrollView.addSubview(guidePageView)
        }
        // scrollView에서 페이징이 가능하도록 설정
        scrollView.isPagingEnabled = true
        // scrollView의 contentSize를 5 페이지 만큼으로 설정
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.width * CGFloat(guidePageNum),
            height: UIScreen.main.bounds.height
        )
        scrollView.alwaysBounceVertical = false // 수직 스크롤 바운스 안되게 설정
        scrollView.bounces = false
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.x
        let index = currentOffset / UIScreen.main.bounds.width

        //페이징 스크롤이 완전히 끝나야 페이지 인덱스가 바뀜
        if (currentOffset.truncatingRemainder(dividingBy: UIScreen.main.bounds.width) == 0) {
            pageControl.set(progress: Int(index), animated: true)
        }
        
        //페이지의 경계를 기준으로 가까운 뷰의 인덱스로 바뀜
//        let currentOffset = scrollView.contentOffset.x/UIScreen.main.bounds.width * 10
//        var index = 0
//            if (currentOffset.truncatingRemainder(dividingBy: 10) < 5) {
//                index = Int(currentOffset/10)
//            } else{
//                index = Int(currentOffset/(10 + 1))
//            }
//        pageControl.set(progress: Int(index), animated: true)
    }
}

extension ViewController: CHIBasePageControlDelegate {
    func didTouch(pager: CHIBasePageControl, index: Int) {
        print(#function,index)
    }
}
