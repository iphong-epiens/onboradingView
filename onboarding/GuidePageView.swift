//
//  streamOnboardingView.swift
//  ShallWeShop
//
//  Created by Inpyo Hong on 2020/07/22.
//  Copyright © 2020 Epiens Corp. All rights reserved.
//

import UIKit
import CHIPageControl

class GuidePageView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: CHIPageControlChimayo!
    @IBOutlet weak var closeButton: UIButton!

    override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      commonInit()
    }

    func commonInit() {
      let bundle = Bundle.init(for: GuidePageView.self)
      if let viewsToAdd = bundle.loadNibNamed("GuidePageView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
      }
    }
}
