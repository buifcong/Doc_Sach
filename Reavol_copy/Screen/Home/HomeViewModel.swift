//
//  HomeViewModel.swift
//  Reavol_copy
//
//  Created by bùi thành công on 08/10/2022.
//

import Foundation
import Alamofire

class HomeViewModel {
    var isLoading: Bool = false {
        didSet {
            isLoadingUpdated?(isLoading)
        }
    }
    var isLoadingUpdated: ((_ isLoading: Bool) -> Void)?
    
    var error: String? {
        didSet {
            errorUpdated?(error ?? "")
        }
    }
    var errorUpdated: ((_ error: String) -> Void)?
    
    var data = DetailBookResponse()
    var listBook: [Articles] = []
    var dataUpdate:(() -> Void)?
    func fetch(){
        getListDetailBook(page: 1)
    }
    
    func getListDetailBook(page:Int){
        isLoading = true
        let param = ["promotionId":"\(page)"]
        AF.request("https://api-dev.ungdungdocnhanh.com/api/v1/promotion/get-detail",method:.get,parameters: param,encoding: URLEncoding.default).responseJSON {[weak self] response in
            self?.isLoading = false
            if let response = response.value as? [String:Any] {
                if let result = response["data"] as? [String:Any] {
                    self?.data =  DetailBookResponse(JSON:result)!
                    if let dt = DetailBookResponse(JSON:result) {
                        if let article = dt.articles {
                            for article in article {
                                self?.listBook.append(article)
                                self?.dataUpdate?()
                            }
                        }
                    }
                }
            }
        }
    }
}
