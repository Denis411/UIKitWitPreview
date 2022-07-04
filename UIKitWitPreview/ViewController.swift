//
//  ViewController.swift
//  UIKitWitPreview
//
//  Created by Dennis Loskutov on 04.07.2022.
//

import UIKit

final class ViewController: UIViewController {
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle( "New", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        view.backgroundColor = .yellow
        setButtonConstraints()
    }
    
    private func setButtonConstraints() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewControllerPreview<ViewController: UIViewController> {
    let vc: ViewController
    
    init(_ builder: @escaping () -> ViewController) {
        vc = builder()
    }
}

extension UIViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        vc
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
        return
    }
}

#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct Main_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview { ViewController() }
    }
}
#endif
