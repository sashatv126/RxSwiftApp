import RxDataSources
import RxSwift
import RxCocoa
import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    //MARK: Properties
    
    private let disposeBag = DisposeBag()
    
    var viewModel : MainViewModelProtocol!
    
    private let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    private let tableView = UITableView.init(frame: .zero)
    
    private lazy var datasource = RxTableViewSectionedReloadDataSource<CellSections>(configureCell: {
        datasource,tableView,indexPth,item  in
        
        print(item.name)
        
        switch item.name {
        case "hz":
            let cell = tableView.dequeueReusableCell(withIdentifier: HzCell.cellIdHz, for: indexPth) as? HzCell
            cell?.configureCell(from: item.data)
            return cell ?? UITableViewCell()
        case "selector":
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectorCell.cellIdSelector, for: indexPth) as? SelectorCell
            let variant = item.data.variants?.randomElement()
            guard let variant = variant else { return UITableViewCell() }
            cell?.configureCell(from: variant)
            return cell ?? UITableViewCell()
        case "picture":
            let cell = tableView.dequeueReusableCell(withIdentifier: PictureCell.cellIdPicture, for: indexPth) as? PictureCell
            cell?.configureCell(from: item.data)
            return cell ?? UITableViewCell()
        default:
            break
        }
        
       return UITableViewCell()
    })
    
    //MARK: LifeCircle
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.updateLayout(size: size)
        }, completion : nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        updateLayout(size: view.frame.size)
        bind()
        delegate()
    }
    
    //MARK: Private methods
    
    private func updateLayout(size : CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
    
    private func bind() {
        view.addSubview(activity)
        activity.center = view.center
        self.activity.startAnimating()
        let output = viewModel.transform()
        
        output
            .cell
            .drive(tableView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)
        
        self.activity.stopAnimating()
    }
}

//MARK: -Extension for configure

extension MainViewController {
    
    private func configureView() {
        view.addSubview(tableView)
        self.tableView.register(PictureCell.self,
                                forCellReuseIdentifier: PictureCell.cellIdPicture)
        self.tableView.register(HzCell.self,
                                forCellReuseIdentifier: HzCell.cellIdHz)
        self.tableView.register(SelectorCell.self,
                                forCellReuseIdentifier: SelectorCell.cellIdSelector)
    }
    
    func delegate() {
        tableView.rx.modelSelected(CellViewModel.self)
          .subscribe(onNext: { [weak self] model in
              self?.aleartController(title: "Object", message: model.name, action: "OK")
          }).disposed(by: disposeBag)
    }
}

