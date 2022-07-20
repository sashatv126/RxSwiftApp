import RxCocoa
import RxSwift

struct MainOutput {
    let cell : (Driver<[CellSections]>)
}

protocol MainViewModelProtocol {
    
    func transform() -> MainOutput
}

final class MainViewViewModel : MainViewModelProtocol {
    
    private var bag = DisposeBag()
    
    
    func transform() -> MainOutput {
        return MainOutput(cell: getCells())
    }
}

private extension MainViewViewModel {
    
    func getCells() -> Driver<[CellSections]> {
        
        let cells = APIManager
            .shared
            .getData()
            .map { model in
                model.view.compactMap { element in
                    model.data.first {$0.name == element}
                }
            }
            .map({ model in
                model.map { item in
                    CellViewModel(model: item)
                }
            })
            .map { model in
                [CellSections(model: 0, items: model)]
            }
            .asDriver(onErrorJustReturn: [])
        
        
        return cells
    }
}
