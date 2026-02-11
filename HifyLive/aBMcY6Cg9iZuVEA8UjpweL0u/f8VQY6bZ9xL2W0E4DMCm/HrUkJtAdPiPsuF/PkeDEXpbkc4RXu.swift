
import Combine
import StoreKit

@MainActor
final class PkeDEXpbkc4RXu: ObservableObject {

    static let shared = PkeDEXpbkc4RXu()

    @Published var jbGuJZqVg5X: [Product] = []

    private var kS4zGWFzLwy: Task<Void, Never>?
    
    var i03CT778BY: (() async -> Void)?

    init() {
        pSluNQyOocDOk()
    }

    deinit {
        kS4zGWFzLwy?.cancel()
    }


    func r1roySzHMIN(ids: [String]) async {
        do {
            jbGuJZqVg5X = try await Product.products(for: ids)
        } catch {
            print(error)
        }
    }


    func mZ6DqgRigNqO(productId: String) async {
        EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
        guard let c6oH9eL7U = jbGuJZqVg5X.first(where: { $0.id == productId }) else {
           
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("9iAqOoev7u+Hb7ijU+sP4I2HtgPqdR9tyb5KqXs4D8I=",type: 1)
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            return
        }

        do {
            let tkKGG1Qo = try await c6oH9eL7U.purchase()

            switch tkKGG1Qo {

            case .success(let verification):
                let transaction = try verification.payloadValue
                await jq2fbQgRa0hTZ4(transaction)

            case .userCancelled:
               
                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("ughEnrHH8idFaI0NbZK2QA==",type: 1)
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            case .pending:
                print("pending")

            @unknown default:
                break
            }

        } catch {
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            print(error)
        }
    }

    // MARK: - 监听交易更新（🔥 关键）
    private func pSluNQyOocDOk() {
        kS4zGWFzLwy = Task {
            for await result in Transaction.updates {
                do {
                    let transaction = try result.payloadValue
                    await jq2fbQgRa0hTZ4(transaction)
                    
                } catch {
                    EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                    
                }
            }
        }
    }

    private func jq2fbQgRa0hTZ4(_ transaction: Transaction) async {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        
        if transaction.revocationDate != nil {
            return
        }
        axsAs4xvtJg4Pd(productId: transaction.productID)
        await transaction.finish()
        
    }

    private func axsAs4xvtJg4Pd(productId: String) {
        let sn9RRYi99 = PUiSN9Hnxm9ZJ.nrDS82DJMap[productId] ?? 0
        Task{
           let xS2bi4lIs = try await k8VJeG1rEJh4(ovlkoBKType: sn9RRYi99)
            if(xS2bi4lIs){
                if let callback = i03CT778BY {
                                   await callback()
                               }
                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("2Z8gUUr8Jm2yOKyEhm4P66gcqYnxUwQictDLBEJoU08=")
            }
        }
    }
}

