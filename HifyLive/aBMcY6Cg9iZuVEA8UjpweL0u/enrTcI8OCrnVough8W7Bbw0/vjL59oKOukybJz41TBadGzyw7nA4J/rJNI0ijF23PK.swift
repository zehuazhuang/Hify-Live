import GoogleSignIn
import UIKit

//Google登录配置
struct RbqBb46vxbGKGmsnZWA1R9Vx3M {
    let c5O9meXEy5dOelOBZ3QpElqG: String      // google / apple / facebook
    let qG9OYdC: String       //userid
    let tjtC42pBBkamD3FpPFfVWz: String?     //niackname
    let dtmb7EAgpLBXhoNSdI: String?     //avatorurl
    let sI9ab2lfhqbpaKAkkJ18gYAi: String?       //email
    let ocl2SJadHjn67BFo7Gd9deM2Mc4hF: String?      // 🔹 Google idToken
}

final class MNcU5G2d5lovPsrWsZR {
    
    static let qmeyXuu0AeNRHIjoVH8WkPZTOKbDpgVv = MNcU5G2d5lovPsrWsZR()
    private init() {}
    
    func uN4EYG5707zDhAdkPqw(
        x32VMaqCadHB: UIViewController,
        hDOsS75RkSohRjdLbqacl3HZOsNOzj1N: @escaping (Result<RbqBb46vxbGKGmsnZWA1R9Vx3M, Error>) -> Void
    ) {
        
        guard let sNPExaQqH = GIDSignIn.sharedInstance.configuration?.clientID else {
            return
        }
        
        let hK4r3WKlmXL8R5Qb = GIDConfiguration(clientID: sNPExaQqH)
        GIDSignIn.sharedInstance.configuration = hK4r3WKlmXL8R5Qb
        
        GIDSignIn.sharedInstance.signIn(withPresenting: x32VMaqCadHB) { rzo6JTOSe, kITBKFnqW0U9iWn in
            
            if let drTjFQ1lBMLEfCUoueq2HkdI = kITBKFnqW0U9iWn as NSError? {
                if drTjFQ1lBMLEfCUoueq2HkdI.code == GIDSignInError.canceled.rawValue {
                    hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.failure(NSError(domain: "AuthService", code: drTjFQ1lBMLEfCUoueq2HkdI.code, userInfo: [NSLocalizedDescriptionKey: "用户取消登录"])))
                } else  {
                    hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.failure(drTjFQ1lBMLEfCUoueq2HkdI))
                }
                return
            }
            
            guard let gEQnzUY3w9grTyQ = rzo6JTOSe?.user else {
                hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.failure(NSError(domain: "AuthService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Google 登录失败"])))
                return
            }
            
            let gfcXRzBcytB = gEQnzUY3w9grTyQ.profile
            
            // 🔹 拿 idToken 和 accessToken
            let frtlzycHHBAArUcpSdILJNiXD = gEQnzUY3w9grTyQ.idToken?.tokenString
            
            let fD9AGwutIqNX75LyEHHSiokcL1g = RbqBb46vxbGKGmsnZWA1R9Vx3M(
                c5O9meXEy5dOelOBZ3QpElqG: "GvLdksIxbN40IeWj8FLE6A==".bFHEatcgE4zzU9TCfDonsu(),
                qG9OYdC: gEQnzUY3w9grTyQ.userID ?? "",
                tjtC42pBBkamD3FpPFfVWz: gfcXRzBcytB?.name,
                dtmb7EAgpLBXhoNSdI: gfcXRzBcytB?.imageURL(withDimension: 200)?.absoluteString,
                sI9ab2lfhqbpaKAkkJ18gYAi: gfcXRzBcytB?.email,
                ocl2SJadHjn67BFo7Gd9deM2Mc4hF: frtlzycHHBAArUcpSdILJNiXD
            )
            
            hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.success(fD9AGwutIqNX75LyEHHSiokcL1g))
        }
    }
}
