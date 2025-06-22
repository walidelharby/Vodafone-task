import Foundation
import Alamofire

struct NetworkService {
    static func fetchData<T: Decodable>(router: APIRouter,
                                        decoder: JSONDecoder = JSONDecoder(),
                                        completion: @escaping(Result<T, Error>) -> Void) {
        AF.request(router)
            .validate()
            .responseData { response in
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
