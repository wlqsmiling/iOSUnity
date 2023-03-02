//
//  ViewController.swift
//  iOSUnity
//
//  Created by Nreal on 2023/3/2.
//

import UIKit

class ViewController: UIViewController {

    let helper = UnityHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func OpenUnity(_ sender: Any) {
        
        helper.initUnity(CommandLine.argc, argV: CommandLine.unsafeArgv,launchOptions: [:])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {[weak self] in
            if let scene = UIApplication.shared.connectedScenes.first,
                  let sceneDelegate = scene.delegate as? UIWindowSceneDelegate,
               let window = sceneDelegate.window {
                window?.makeKeyAndVisible()
            }
        }
    }
    
}

