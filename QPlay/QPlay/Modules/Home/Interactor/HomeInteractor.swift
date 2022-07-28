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
    func savedGameInUserDefaults(title: String)
    func searchSeenGames() -> [String]
}

class HomeInteractor: HomeInteractorProtocol {
    // MARK: Properties
    private let apiServices: String = "https://gamestream-api.herokuapp.com/api/games"
    private let storageKey = "seenGames"
    private let storage = UserDefaults.standard
    
    // MARK: Methods
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
    
    func savedGameInUserDefaults(title: String) {
        var savedTitles = storage.object(forKey: storageKey) as? [String] ?? [String]()
        
        if savedTitles.contains(title) {
            savedTitles.removeAll { $0 == title }
            savedTitles.insert(title, at: 0)
            storage.set(savedTitles, forKey: storageKey)
        } else {
            savedTitles.insert(title, at: 0)
            storage.set(savedTitles, forKey: storageKey)
        }
    }
    
    func searchSeenGames() -> [String] {
        let savedTitles = storage.object(forKey: storageKey) as? [String] ?? [String]()
        return savedTitles
    }
}
