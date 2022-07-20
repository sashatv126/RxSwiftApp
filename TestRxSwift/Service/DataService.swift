import Moya

enum DataService {
    case getData
}

extension DataService : TargetType {
    var baseURL: URL {
        return URL(string: "https://pryaniky.com")!
    }
    
    var path: String {
        switch self {
        case .getData:
           return "/static/json/sample.json"
        }
    }
    
    var method: Method {
        switch self {
        case .getData:
            return .get
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
}
