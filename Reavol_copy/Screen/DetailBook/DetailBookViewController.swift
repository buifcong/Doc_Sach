//
//  DetailBookViewController.swift
//  Reavol_copy
//
//  Created by bùi thành công on 08/10/2022.
//

import UIKit

class DetailBookViewController: UIViewController {

    let viewModel = HomeViewModel()
    @IBOutlet weak var tableView: UITableView!
    var page:Int = 0 {
        didSet{
            viewModel.getListDetailBook(page: page)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib1 = UINib(nibName: "DetaiBookHeaderTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "DetaiBookHeaderTableViewCell")
        let nib2 = UINib(nibName: "DetailBookTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "DetailBookTableViewCell")
        viewModelBinding()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.navigationBar.isHidden = true
    }
    
    func viewModelBinding(){
        viewModel.isLoadingUpdated = {[weak self] isLoading in
            if isLoading == true {
                self?.showLoading(text: nil)
            } else {
                self?.hiddenLoading()
            }
        }
        viewModel.errorUpdated = {[weak self] error in
            self?.present(alertNoActionType(title: nil, message: error, titleAction: "Cancel"), animated: true)
        }
        viewModel.dataUpdate = {[weak self] in
            self?.tableView.reloadData()
        }
    }

}
extension DetailBookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listBook.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetaiBookHeaderTableViewCell", for: indexPath) as! DetaiBookHeaderTableViewCell
            cell.handleBack = {[weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
            cell.item = viewModel.data
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailBookTableViewCell") as! DetailBookTableViewCell
            cell.article = viewModel.listBook[indexPath.row - 1]
            return cell
        }
    }
}
