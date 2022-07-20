import Moya
import RxSwift

struct APIManager {
    
    static let shared = APIManager()
        
    private let provider = MoyaProvider<DataService>()
    
    private init() {}
    
    func getData() -> Single<Welcome>  {
        return provider.rx
            .request(.getData)
            .filterSuccessfulStatusCodes()
            .map(Welcome.self)
            .catch { error in
                throw AppError.apiError
            }
    }
}
