import GoogleSignIn
import AuthenticationServices
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
    private var a9J4y6CApple: hK4r3WKlmXL8R5Qb?
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
    
    func n8N7M9pQ2sApple(
        x32VMaqCadHB: UIViewController,
        hDOsS75RkSohRjdLbqacl3HZOsNOzj1N: @escaping (Result<RbqBb46vxbGKGmsnZWA1R9Vx3M, Error>) -> Void
    ) {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        let coordinator = hK4r3WKlmXL8R5Qb(
            x32VMaqCadHB: x32VMaqCadHB,
            hDOsS75RkSohRjdLbqacl3HZOsNOzj1N: hDOsS75RkSohRjdLbqacl3HZOsNOzj1N
        )
        
        coordinator.j3PAppleDidFinish = { [weak self] in
            self?.a9J4y6CApple = nil
        }
        controller.delegate = coordinator
        controller.presentationContextProvider = coordinator
        self.a9J4y6CApple = coordinator
        controller.performRequests()
    }
}

private final class hK4r3WKlmXL8R5Qb: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    private weak var x32VMaqCadHB: UIViewController?
    private let hDOsS75RkSohRjdLbqacl3HZOsNOzj1N: (Result<RbqBb46vxbGKGmsnZWA1R9Vx3M, Error>) -> Void
    var j3PAppleDidFinish: (() -> Void)?
    
    init(
        x32VMaqCadHB: UIViewController,
        hDOsS75RkSohRjdLbqacl3HZOsNOzj1N: @escaping (Result<RbqBb46vxbGKGmsnZWA1R9Vx3M, Error>) -> Void
    ) {
        self.x32VMaqCadHB = x32VMaqCadHB
        self.hDOsS75RkSohRjdLbqacl3HZOsNOzj1N = hDOsS75RkSohRjdLbqacl3HZOsNOzj1N
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        if let window = x32VMaqCadHB?.view.window {
            return window
        }
        
        if let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap(\.windows)
            .first(where: \.isKeyWindow) {
            return window
        }
        
        return ASPresentationAnchor()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        defer { j3PAppleDidFinish?() }
        
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.failure(NSError(domain: "AuthService", code: -2, userInfo: [NSLocalizedDescriptionKey: "Apple 登录失败"])))
            return
        }
        
        guard let identityToken = credential.identityToken,
              let tokenString = String(data: identityToken, encoding: .utf8),
              !tokenString.isEmpty else {
            hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.failure(NSError(domain: "AuthService", code: -3, userInfo: [NSLocalizedDescriptionKey: "Apple 登录凭证缺失"])))
            return
        }
        let authorizationCodeString: String?
        if let authorizationCode = credential.authorizationCode {
            authorizationCodeString = String(data: authorizationCode, encoding: .utf8)
        } else {
            authorizationCodeString = nil
        }
        print("Apple identityToken: \(tokenString)")
        print("Apple authorizationCode: \(authorizationCodeString ?? "nil")")
        
        let fullName = [credential.fullName?.familyName, credential.fullName?.givenName]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined()
        let appleEmail = credential.email ?? p8Q2rAppleEmail(from: tokenString)
        
        let result = RbqBb46vxbGKGmsnZWA1R9Vx3M(
            c5O9meXEy5dOelOBZ3QpElqG: "APPLE",
            qG9OYdC: credential.user,
            tjtC42pBBkamD3FpPFfVWz: fullName.isEmpty ? nil : fullName,
            dtmb7EAgpLBXhoNSdI: nil,
            sI9ab2lfhqbpaKAkkJ18gYAi: appleEmail,
            ocl2SJadHjn67BFo7Gd9deM2Mc4hF: tokenString
        )
        
        hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.success(result))
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        defer { j3PAppleDidFinish?() }
        
        let nsError = error as NSError
        if nsError.domain == ASAuthorizationError.errorDomain,
           nsError.code == ASAuthorizationError.canceled.rawValue {
            hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.failure(NSError(domain: "AuthService", code: nsError.code, userInfo: [NSLocalizedDescriptionKey: "用户取消登录"])))
            return
        }
        
        hDOsS75RkSohRjdLbqacl3HZOsNOzj1N(.failure(nsError))
    }
    
    private func p8Q2rAppleEmail(from tokenString: String) -> String? {
        let parts = tokenString.split(separator: ".")
        guard parts.count > 1 else { return nil }
        
        var payload = String(parts[1])
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        let remainder = payload.count % 4
        if remainder != 0 {
            payload += String(repeating: "=", count: 4 - remainder)
        }
        
        guard let data = Data(base64Encoded: payload),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        
        return json["email"] as? String
    }
}
