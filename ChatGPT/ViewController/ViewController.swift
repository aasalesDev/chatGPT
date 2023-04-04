//
//  ViewController.swift
//  ChatGPT
//
//  Created by Anderson Sales on 03/04/23.
//

import UIKit
import OpenAISwift

class ViewController: UIViewController {
    
    var openAIModelType: OpenAIModelType = .gpt3(.davinci)
    var token: OpenAISwift?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        token = OpenAISwift(authToken: API.authToken)
    }
    
    func submitOpenAIRequest(text: String, completion: @escaping (Result<String, OpenAIError>) -> Void) {
        token?.sendCompletion(with: text, model: openAIModelType, completionHandler: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    print(model)
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}

