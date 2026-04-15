import Foundation
import SwiftUI
import StoreKit
import Combine
//支付代码
struct PendingTransaction: Codable {
    let transactionID: String
    let receiptData: String
    let orderCode: String
}

@MainActor
final class PkeDEXpbkc4RXu: NSObject, ObservableObject {

    static let shared = PkeDEXpbkc4RXu()

    @Published var jbGuJZqVg5X: [SKProduct] = []

    private var productsRequest: SKProductsRequest?
     var goGKj6Y2p4: RZ5EA4IPxfI4x? //支付实例
    
    
    
    var i03CT778BY: (() async throws -> Void)? //充值成功回调
    
    var wBFfm9P58PJF: (() async -> Void)?//取消支付回调
    
    @Published var q8R2T9vC5MZ: String = "" //key
    @Published var nN2B7Q5M9: Int = 0 //实际钻石数量
    @Published var pendingTransactions: [PendingTransaction] = [] //补单
    
    // 保存到 UserDefaults
     func savePendingTransactions() {
        if let data = try? JSONEncoder().encode(pendingTransactions) {
            UserDefaults.standard.set(data, forKey: "pendingTransactions")
        }
    }

    // 读取本地
     func loadPendingTransactions() {
        if let data = UserDefaults.standard.data(forKey: "pendingTransactions"),
           let saved = try? JSONDecoder().decode([PendingTransaction].self, from: data) {
            pendingTransactions = saved
        }
    }
    
    @objc private func networkLost() {
        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("K0e4tAjTJcHU6EUVZUTWoNwIwhkclCvfsmmek2Z5efk=",type: 1)
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
    }

    override init() {
        super.init()
        SKPaymentQueue.default().add(self)   // 监听交易
        checkUnfinishedTransactions()
        
        //网络监听
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkLost),
            name: .networkLost,
            object: nil
        )
    }

    deinit {
        SKPaymentQueue.default().remove(self)
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - 获取商品
    func r1roySzHMIN(ids: [String]) async {
      
        let request = SKProductsRequest(productIdentifiers: Set(ids))
        request.delegate = self
        request.start()
        productsRequest = request
    }

    // MARK: - 发起购买
    func mZ6DqgRigNqO(productId: String) async {

        if let callback = wBFfm9P58PJF {
            await callback()
        }
        EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt(nZ9V4xF6Qw:"Purchasing is in progress, please wait patiently")
        
        if !Yi9m02SYzI7dI.shared.isConnected {
            
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("K0e4tAjTJcHU6EUVZUTWoNwIwhkclCvfsmmek2Z5efk=",type: 1)
            return
        }
        
        print("传进来")
        print(productId)

        guard let product = jbGuJZqVg5X.first(where: { $0.productIdentifier == productId }) else {
           
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            //No product found
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q
                .m3nArFwdHhI82cPUmiqW8PtaaHz("9iAqOoev7u+Hb7ijU+sP4I2HtgPqdR9tyb5KqXs4D8I=", type: 1)
            
            
            return
        }

        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    // MARK: - 恢复购买
    func restore() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }

    // MARK: - 处理所有已存在未完成订单
    private func checkUnfinishedTransactions() {
       
        
        let transactions = SKPaymentQueue.default().transactions
        
        if transactions.isEmpty { return }
        
        print("检测到未完成订单，开始补单")
        
        for transaction in transactions {
            
            switch transaction.transactionState {
                
            case .purchased, .restored:
                jq2fbQgRa0hTZ4(transaction)
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                
            case .purchasing:
                break
                
            case .deferred:
                break
                
            @unknown default:
                break
                
            }
            
            
        }
        
    }
    
}
extension PkeDEXpbkc4RXu: SKPaymentTransactionObserver {

    nonisolated func paymentQueue(_ queue: SKPaymentQueue,
                                   updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            switch transaction.transactionState {
                
            case .purchased:
                Task { @MainActor in
                    self.jq2fbQgRa0hTZ4(transaction)
                }

            case .restored:
                Task { @MainActor in
                    self.jq2fbQgRa0hTZ4(transaction)
                }

            case .failed:
                
                // 🔥 区分是否是用户主动取消
                if let error = transaction.error as? SKError {
                    Task { @MainActor in
                        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q
                            .m3nArFwdHhI82cPUmiqW8PtaaHz("keKanlrl/Y+CpZ3rb2tMYQ==", type: 2,
                                                         )
                        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                        print("支付失败: \(error.localizedDescription)")
                    }
//                    if error.code == .paymentCancelled {
//                        
//                        // ✅ 用户主动取消
//                        Task { @MainActor in
//
//                            
//                            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
//                            
//                            if let callback = wBFfm9P58PJF {
//                                await callback()
//                            }
//                           
//                        }
//                        
//                    } else {
//                        
//                        
//                    
//                    }
                }

                SKPaymentQueue.default().finishTransaction(transaction)

            case .purchasing:
                break

            case .deferred:
                print("pending")

            @unknown default:
                break
            }
        }
    }
}

extension PkeDEXpbkc4RXu {

    @MainActor
    private func jq2fbQgRa0hTZ4(_ transaction: SKPaymentTransaction) {
       
      
        let purchaseID = transaction.transactionIdentifier ?? ""
                let serverVerificationData: String
                if let receiptURL = Bundle.main.appStoreReceiptURL,
                  let receiptData = try? Data(contentsOf: receiptURL)
                {
                  serverVerificationData = receiptData.base64EncodedString()
                } else {
                  serverVerificationData = ""
                }
        
       
        
        let cousde = "{\"orderCode\":\"\(q8R2T9vC5MZ)\"}"
        
        
        let pending = PendingTransaction(
            transactionID: purchaseID,
            receiptData: serverVerificationData,
            orderCode: cousde
        )
        pendingTransactions.append(pending)
        savePendingTransactions()
       
        Task {
            do {
                defer {
                                
                                SKPaymentQueue.default().finishTransaction(transaction)
                                
                      }

                
     
               let result = try await n3Qw6R9Xb1K(kL2Q7ZxM8R: purchaseID, z8Y1QxL4Z8v: serverVerificationData, x8V6N2kL9MZ: cousde)
              
             
                if(result){
                    
                    if let index = pendingTransactions.firstIndex(where: { $0.transactionID == purchaseID }) {
                        pendingTransactions.remove(at: index)
                        savePendingTransactions()
                    }
                                   
                        try await i03CT778BY?()
                                    
                       
                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q
                        .m3nArFwdHhI82cPUmiqW8PtaaHz("/peQucgR05RwJN5sSZK/MpLhSTA/SbkaTLxc0PtIk1A=",
                                                     subFontText: "You have received \(nN2B7Q5M9) diamonds.",)
                    
                    
                }
             
                
               
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            } catch {
                print("服务器校验失败，下次补单")
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            }
        }
    }
}

extension PkeDEXpbkc4RXu: SKProductsRequestDelegate {

    nonisolated func productsRequest(_ request: SKProductsRequest,
                                     didReceive response: SKProductsResponse) {

        Task { @MainActor in
            self.jbGuJZqVg5X = response.products
        }
    }
}
