//
//  PkeDEXpbkc4RXu.swift
//  HifyLive
//
//  Created by yangyang on 2026/2/10.
//

import Combine
import StoreKit

@MainActor
final class PaymentManager: ObservableObject {

    static let shared = PaymentManager()

    @Published var products: [Product] = []

    private var updateTask: Task<Void, Never>?
    
    var onCoinsGranted: (() async -> Void)?

    init() {
        startListeningForTransactions()
    }

    deinit {
        updateTask?.cancel()
    }

    // MARK: - 加载商品
    func loadProducts(ids: [String]) async {
        do {
            products = try await Product.products(for: ids)
        } catch {
            print("加载商品失败:", error)
        }
    }

    // MARK: - 发起购买
    func purchase(productId: String) async {
        EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
        guard let product = products.first(where: { $0.id == productId }) else {
           
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("9iAqOoev7u+Hb7ijU+sP4I2HtgPqdR9tyb5KqXs4D8I=",type: 1)
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            return
        }

        do {
            let result = try await product.purchase()

            switch result {

            case .success(let verification):
                let transaction = try verification.payloadValue
                await handle(transaction)

            case .userCancelled:
               
                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("ughEnrHH8idFaI0NbZK2QA==",type: 1)
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            case .pending:
                print("等待确认")

            @unknown default:
                break
            }

        } catch {
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            print("支付失败:", error)
        }
    }

    // MARK: - 监听交易更新（🔥 关键）
    private func startListeningForTransactions() {
        updateTask = Task {
            for await result in Transaction.updates {
                do {
                    let transaction = try result.payloadValue
                    await handle(transaction)
                    
                } catch {
                    EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                    print("交易校验失败:", error)
                }
            }
        }
    }

    // MARK: - 统一处理交易

    private func handle(_ transaction: Transaction) async {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        print("处理交易:", transaction.productID)

        // ⚠️ 防止重复发放
        if transaction.revocationDate != nil {
            print("交易被撤销")
            return
        }
        
        print("交易成功")
        grantCoins(productId: transaction.productID)

        await transaction.finish()
        
    }

    private func grantCoins(productId: String) {
        let coin = PUiSN9Hnxm9ZJ.nrDS82DJMap[productId] ?? 0
        
        print("发放金币:", coin)
        // 本地加金币 + 请求服务器
        
        Task{
           let xS2bi4lIs = try await k8VJeG1rEJh4(ovlkoBKType: coin)
            if(xS2bi4lIs){
                if let callback = onCoinsGranted {
                                   await callback()
                               }
                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("2Z8gUUr8Jm2yOKyEhm4P66gcqYnxUwQictDLBEJoU08=")
            }
        }
    }
}

