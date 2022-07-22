//
//  HomeInteractor.swift
//  QPlay
//
//  Created by Apple on 23/06/22.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire
import ObjectMapper

protocol HomeInteractorProtocol {
    func makeRequest() -> Observable<[Game]>
}

class HomeInteractor: HomeInteractorProtocol {
    private let apiServices: String = "https://gamestream-api.herokuapp.com/api/games"
    
    func makeRequest() -> Observable<[Game]> {
        return Observable.create { observer in
            AF.request(self.apiServices).responseJSON { response in
                guard let json = response.value as? [[String: Any]] else {
                    observer.on(.error(RxError.noElements))
                    return
                }
                let games = Mapper<Game>().mapArray(JSONArray: json)
                
                observer.on(.next(games))
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
