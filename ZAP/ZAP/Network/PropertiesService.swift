//
//  PropertiesServiceInterface.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol PropertiesServiceInterface: AnyObject {
    func requestProperties(completion: @escaping (Result<Properties>) -> Void)
}

final class PropertiesService {
    private enum Constants: String {
        case propertiesURL = "http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-1.json"
    }

    let urlSession: URLSession = URLSession(configuration: .default)
}

extension PropertiesService: PropertiesServiceInterface {
    func requestProperties(completion: @escaping (Result<Properties>) -> Void) {
        guard let url = URL(string: Constants.propertiesURL.rawValue) else {
            completion(
                .failure(
                    URLMisstypingError()
                )
            )
            return
        }

        let request = URLRequest(url: url)

        let task = urlSession.dataTask(with: request) { [weak self] (data, reponse, error) in
            guard let self = self else { return }
            self.handlePropertiesDataTask(data: data,
                                     response: reponse,
                                     error: error,
                                     completion: completion)
        }
        task.resume()
    }

    private func handlePropertiesDataTask(data: Data?,
                                          response: URLResponse?,
                                          error: Error?,
                                          completion: @escaping (Result<Properties>)  -> Void) {
        if let error = error {
            completion(
                .failure(GenericError(error: error))
            )
            return
        }

        if let _ = response,
            let data = data {

            let decoder = JSONDecoder()

            do {
                let result = try decoder.decode(Properties.self, from: data)
                completion(
                    .success(result.filter(MinimumRequirementsFilter()))
                )
            } catch {
                completion(
                    .failure(GenericError(error: error))
                )
            }
        }
    }
}
