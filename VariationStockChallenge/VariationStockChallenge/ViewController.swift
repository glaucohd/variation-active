//
//  ViewController.swift
//  VariationStockChallenge
//
//  Created by Glauco on 21/03/23.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //@IBAction func openVariationStockModule(_ sender: Any) {}
    @IBAction func openVariationStockModule(_ sender: Any) {
        print("Abrindo modulo Flutter");
        //let value = "Glauco"
        
        let flutterEngine = ((UIApplication.shared.delegate as? AppDelegate)?.flutterEngine)!;
                let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
        
        
                guard let flutterView = flutterViewController.view else { return }
                flutterView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(flutterView)
                
                let constraints = [
                    flutterView.topAnchor.constraint(equalTo: view.topAnchor),
                    flutterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    flutterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    flutterView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ]

                NSLayoutConstraint.activate(constraints)
        
        
    }
}


