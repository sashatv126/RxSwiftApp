import RxDataSources

typealias CellSections = SectionModel<Int,CellViewModel>

protocol CellSectionsProtocol {
    
    var name : String { get }
    var data : DataClass { get }
}

struct CellViewModel : CellSectionsProtocol {
    
    var name : String
    var data : DataClass
}

extension CellViewModel {
    
    init(model : Datum) {
        self.name = model.name
        self.data = model.data
    }
}
