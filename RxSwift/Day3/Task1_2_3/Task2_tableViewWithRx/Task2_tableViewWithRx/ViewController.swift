//
//  ViewController.swift
//  Task2_tableViewWithRx
//
//  Created by Usef on 05/02/2025.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposedBag = DisposeBag()
    private let viewModel = Members()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        maketableViewWithSchedule()
    }
    private func bindTableView() {
        viewModel.members.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: MemberTableViewCell.self)) { (row,member,cell) in
            _ = IndexPath(row: row, section: 0)
            cell.textLabel?.text = member
            }.disposed(by: disposedBag)
            
        tableView.rx.modelSelected(String.self).subscribe(onNext: { item in
            print("SelectedMember: \(item)")
        }).disposed(by: disposedBag)
        tableView.isEditing = true
        tableView.rx.itemDeleted
                    .subscribe(onNext: { [unowned self] indexPath in
                        self.viewModel.membersArray.remove(at: indexPath.row)
                        viewModel.removeMember()
                    })
                    .disposed(by: disposedBag)
            
        viewModel.fetchMembers()
        viewModel.fetchNewMwmbers()
        }
    func maketableViewWithSchedule(){
        var membersArr = ["Esraa Eid","Mona Ahmed","Ali Gamal"]
        
        let observable = Observable<[String]>.create { observer in
            observer.onNext(membersArr)
            DispatchQueue.main.asyncAfter(deadline: .now()  + 2) {
                membersArr.append("Ahmed Essam")
                observer.onNext(membersArr)
            }
            return Disposables.create()
        }.observe(on: MainScheduler.instance)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        
        observable.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: MemberTableViewCell.self)) { (row,member,cell) in
                cell.textLabel?.text = member
                }.disposed(by: disposedBag)
        tableView.isEditing = true
        tableView.rx.itemDeleted
              .subscribe{
                  
              }
              .disposed(by: disposedBag)
    }
    

}


