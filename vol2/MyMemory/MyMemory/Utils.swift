//
//  Utils.swift
//  MyMemory
//
//  Created by Jonghwi Lee on 2018. 7. 16..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import Security
import Alamofire

class TokenUtils {
    func save(_ service: String, account: String, value: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false)!
        ]
        
        // 현재 저장된 값 삭제
        SecItemDelete(keyChainQuery)
        
        // 새로운 키체인 등록
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "토큰 값 저장에 실패했습니다.")
        NSLog("status = \(status)")
    }
    
    func load(_ service: String, account: String) -> String? {
        // 키체인 쿼리 정의
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        // 키체인에 저장된 값을 읽어옴
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
        
        // 처리 결과가 성공이라면 읽어온 값을 Data 타입으로 변환, 다시 String 타입으로 변환
        if (status == errSecSuccess) {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: String.Encoding.utf8)
            return value
        } else {
            print("Nothing was retrieved from the keychain, Status code \(status)")
            return nil
        }
    }
    
    func delete(_ service: String, account: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ]
        
        // 현재 저장되어 있는 값 삭제
        let status = SecItemDelete(keyChainQuery)
        assert(status == noErr, "토큰 값 삭제에 실패했습니다.")
        NSLog("status = \(status)")
    }
    
    func getAuthorizationHeader() -> HTTPHeaders? {
        let serviceID = "kr.co.rubypaper.MyMemory"
        if let accessToken = self.load(serviceID, account: "accessToken") {
            return ["Authorization" : "Bearer \(accessToken)"] as HTTPHeaders
        } else {
            return nil
        }
    }
}

extension UIViewController {
    var tutorialSB: UIStoryboard {
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }
    func instanceTutorialVC(name: String) ->UIViewController? {
        return self.tutorialSB.instantiateViewController(withIdentifier: name)
    }
    
    func alert(_ message: String, completion: (()->Void)? = nil) {
        // 메인 스레드에서 실행되도록 한다.
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                completion?() // completion 매개변수의 값이 nil이 아닐 때에만 실행되도록
            }
            alert.addAction(okAction)
            self.present(alert, animated: false)
        }
    }
}
