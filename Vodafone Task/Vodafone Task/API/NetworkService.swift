import Foundation
import Alamofire

struct NetworkService {
    static func fetchData<T: Decodable>(router: APIRouter,
                                        decoder: JSONDecoder = JSONDecoder(),
                                        completion: @escaping(Result<T, Error>) -> Void) {
        do {
            let request = try router.asURLRequest()
            let urlString = request.url?.absoluteString ?? "Unknown URL"
            var parametersDescription = ""
            if let httpBody = request.httpBody,
               let bodyString = String(data: httpBody, encoding: .utf8) {
                parametersDescription = bodyString
            } else if let url = request.url,
                      let query = URLComponents(url: url, resolvingAgainstBaseURL: false)?.query {
                parametersDescription = query
            }
            debugPrint("[NetworkService] URL: \(urlString)")
            debugPrint("[NetworkService] Parameters: \(parametersDescription)")
        } catch {
            debugPrint("[NetworkService] Failed to build request: \(error)")
        }

        AF.request(router)
            .validate()
            .responseData { response in
                debugPrint("[NetworkService] Status Code: \(response.response?.statusCode ?? -1)")
                if let data = response.data,
                   let bodyString = String(data: data, encoding: .utf8) {
                    debugPrint("[NetworkService] Response Body: \(bodyString)")
                }
                switch response.result {
                case .success(let data):
                    do {
                        let object = try decoder.decode(T.self, from: data)
                        completion(.success(object))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
