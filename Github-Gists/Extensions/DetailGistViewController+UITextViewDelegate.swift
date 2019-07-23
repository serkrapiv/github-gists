//
//  DetailGistViewController+UITextViewDelegate.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 23/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension DetailGistViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange")
        heightConstraintOfContentGistTextView.constant = textView.contentSize.height
        textView.sizeToFit()
    }
}
