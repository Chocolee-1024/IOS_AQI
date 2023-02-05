//
//  NetworkManager.swift
//  CallAPIExample
//
//  Created by imac-1763 on 2023/2/3.
//

import Foundation

class NetWorkManager{
    static let shared = NetWorkManager()
    
    func requestData<D: Decodable>(offset: Int, limit: Int, finish: @escaping(Result<D, NetworkConstants.APIError>) -> Void){
        let path = NetworkConstants.baseUrl + NetworkConstants.APIPath.aqi.rawValue
        let apiKey = NetworkConstants.apiKey
        guard let url = URL(string: path + "?offset=\(offset)" + "&limit=\(limit)" + "&api_key=" + apiKey) else {
            finish(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            //確認是否有錯誤
            guard error == nil else{
                finish(.failure(.unknownError(error!)))
                return
            }
            //確認是否為200
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode == 200 else{
                finish(.failure(.invalidResponse))
                return
            }
            //確認是否成功後用 JSONDecoder 解碼
            let decoder = JSONDecoder()
            guard let data = data,
                  let results = try? decoder.decode(D.self, from: data) else {
                finish(.failure(.jsonDecodeFailed))
                return
            }
            //將資料用閉包傳回
            finish(.success(results))
        }.resume()
    }
}


