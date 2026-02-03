//下方弹出用户信息
import SwiftUI
import SwiftfulRouting
import NIMSDK

struct QZ4A0M84C7WL9: View {
    let sBb3SaType : Int //0 userId 1 yxAccid
    let uZQx7MId : Int //用户userId
    let hN9EY2BId : String //用户yxAccid
    @Binding var isW9YQ6C8L: Bool
    @State private var isZ7E4xA0M2 = false
    @State private var info9M0Q2A6: [String: Any] = [:] //用户数据
    @State private var is7A0Y4W6ECL: Int = -1 //是否关注
    @Environment(\.router) var rM9Z8S7A1ql
    
    var exFkPlIB : Bool { //是否当前用户
        if (sBb3SaType == 0){
            return uZQx7MId == IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")
        }else{
            return hN9EY2BId == IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.string("yxAccid")
        }
    }
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    isW9YQ6C8L = false
                }
            VStack{
                Spacer()
                
                    ZStack{
                        ZJ7h766mz(tMmEWWlfgUag: "TW9o1s4228")
                                        .frame(height: 305)
                                        .frame(maxWidth: .infinity)
                        if  !exFkPlIB  {
                            ZJ7h766mz(tMmEWWlfgUag: "jyC6M4Z0A8Q7E2")
                                            .frame(width: 57, height: 33)
                                            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                                            .padding(.top,10)
                                            .padding(.trailing,16)
                        }
                        
                    }.frame(height: 305)
                        .frame(maxWidth: .infinity)
                        .scaleEffect(1.01)
                
                
                                
            }.ignoresSafeArea()
                .offset(y: isZ7E4xA0M2 ? 0 : 300)
            VStack(spacing:0){
                Spacer()
                ZStack{
                    Circle()
                        .fill(Color.white.opacity(0.2))
                            .frame(width: 88, height: 88)
                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: info9M0Q2A6.string("icon"))
                        .frame(width: 80,height: 80)
                        .clipShape(Circle())
                        .allowsHitTesting(false)
                    
                    
                }.frame(width: 88, height: 88)
                    .onTapGesture {
                        isW9YQ6C8L = false
                        rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                            WUjfoptOKs8pZfhSAH0duplG {
                                zQIRqHb1rSOJJ0wopZa8qxCs(areoloaUid: info9M0Q2A6.int("userId"))
                            }
                        }
                    }
                Spacer().frame(height: 8)
                Text(info9M0Q2A6.string("nickname"))
                                .g0LIIcoZQsOjyND9(
                                    size: 18,
                                    weight: .semibold
                                )
                Spacer().frame(height: 4)
                HStack{
                    ZJ7h766mz(tMmEWWlfgUag: info9M0Q2A6.int("gender") == 1 ? "h8bx8HHiJD1BodEG8Zfzl" :  "aSUqulEy").frame(width: 24, height: 24)
                    Text("\(info9M0Q2A6.int("age"))")
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular
                                    )
                    Text("|")
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular,
                                        color: .white.opacity(0.4)
                                    )
                                    .padding(.horizontal,4)
                    //改成国家图标
                    CountryFlagView(countryCode: info9M0Q2A6.string("countryId"))
                    Text("|")
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular,
                                        color: .white.opacity(0.4)
                                    ).padding(.horizontal,4)
                    Text("ID：\(String(info9M0Q2A6.int("userId")))")
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular,
                                    )
                    
                    ZJ7h766mz(tMmEWWlfgUag: "gnuwJqMH3sA8Hce5wxEX").frame(width: 16, height: 16)
                        .onTapGesture{
                            let turestompoPvX = String(info9M0Q2A6.int("userId"))
                            UIPasteboard.general.string = turestompoPvX
                            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("REb1QH5U5jRdbMUtHMwvWQ==")
                        }
                }
                Spacer().frame(height: 12)
//                HStack{
//                    ZJ7h766mz(tMmEWWlfgUag: "Q9C2YbA8Lk").frame(width: 32, height: 16)
//                    ZJ7h766mz(tMmEWWlfgUag: "6E7C0Q8WxLv").frame(width: 44, height: 15)
//                }
                Spacer().frame(height: 16)
                Spacer().frame(height: 16)
                HStack{
                    Spacer()
                    HStack(spacing:83){
                        VStack(spacing:4){
                            Text("\(info9M0Q2A6.int("upsNum"))")
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .black
                                            )
                            Text("Following")
                                            .g0LIIcoZQsOjyND9(
                                                size: 14,
                                                weight: .regular,
                                                color: .white.opacity(0.4)
                                            )
                        }
                        VStack(spacing:4){
                            Text("\(info9M0Q2A6.int("fansNum"))")
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .black
                                            )
                            Text("Followers")
                                            .g0LIIcoZQsOjyND9(
                                                size: 14,
                                                weight: .regular,
                                                color: .white.opacity(0.4)
                                            )
                        }
                    }
                    Spacer()
                }
                Spacer().frame(height: 28)
                if  !exFkPlIB  {
                    HStack{
                        Spacer()
                        HStack(spacing:16){
                            
                            ZJ7h766mz(tMmEWWlfgUag: "li9QY0x2EWL")
                                               .frame(width: 46, height: 46)
                                               .onTapGesture {
                                                   openP2PChatScreen(userId: info9M0Q2A6.string("yxAccid"), avatarUrl: info9M0Q2A6.string("icon"), using: rM9Z8S7A1ql)
                                               }
                            
                            Button(action: {
                                Task{
                                   
                                    let isA2C6WEL =  try await fol6W9ZQ4xC2(uY2M8A4E7C0xL: info9M0Q2A6.int("userId"), iA6M7W9EYL0: is7A0Y4W6ECL)
                                    if(isA2C6WEL){
                                        haptempLoad()
                                 
                                        
                                    }
                                }
                            }) {
                                HStack(spacing:4){
                                    if is7A0Y4W6ECL == 1 {
                                        ZJ7h766mz(tMmEWWlfgUag: "q0M9xW2C7AL")
                                            .frame(width: 16, height: 16)
                                    }
                                    
                                    Text(is7A0Y4W6ECL == 1 ? "Follow" : "Following").g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .medium,
                                        color: .white.opacity(0.8)
                                    )
                            }
                            }.frame(width: 227,height: 46)
                                            .background(
                                                
                                                LinearGradient(
                                                    colors: [
                                                        is7A0Y4W6ECL == 1 ?
                                                        Color(red: 217 / 255,green: 28 / 255,blue: 255 / 255,opacity: 0.72) :
                                                            Color(red: 120 / 255,green: 223 / 255,blue: 255 / 255,opacity: 0.32)
                                                        ,is7A0Y4W6ECL == 1 ?
                                                        Color(red: 28 / 255,green: 215 / 255,blue: 255 / 255,opacity: 0.1) :
                                                            Color(red: 84 / 255,green: 105 / 255,blue: 199 / 255,opacity: 0.1)
                                                    ], startPoint: .leading, endPoint: .trailing)
                                            )
                                            .cornerRadius(325)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 325)
                                                    .stroke(
                                                        LinearGradient(
                                                            colors: [
                                                                Color(red: 187 / 255, green: 68 / 255, blue: 219 / 255),
                                                                Color(red: 43 / 255, green: 93 / 255, blue: 117 / 255)
                                                            ],
                                                            startPoint: .leading,
                                                            endPoint: .trailing
                                                        ),
                                                        lineWidth:is7A0Y4W6ECL == 1 ? 1 : 0
                                                    )
                                            )
                        }
                        Spacer()
                    }
                }else{
                    Spacer().frame(height: 46)
                }
                
                
                Spacer().frame(height: 8)
            }.offset(y: isZ7E4xA0M2 ? 0 : 300)
        }
        
        .onAppear {
            isZ7E4xA0M2 = false
            DispatchQueue.main.async {
                withAnimation(.easeOut(duration: 0.25)) {
                    isZ7E4xA0M2 = true
                }
            }
            
            haptempLoad()
        }
    }
    //加载用户数据
    func haptempLoad(){
        Task {
            
            if (sBb3SaType == 0){
                info9M0Q2A6 = await T0viKk.wSremNeLspPkPRHBJnlVCs5w.ngI7E4C9A0xWML6xL(wTEEJpZz0iGVK: uZQx7MId)
            }else{
                info9M0Q2A6 = await T0viKk.wSremNeLspPkPRHBJnlVCs5w.ngI7Y2A8C4E0ZQ9W6xL(wTEEJpZz0iGVK: hN9EY2BId)
            }
                     
                         
                           withAnimation{
                               is7A0Y4W6ECL = info9M0Q2A6.int("followed") == 0 ? 1 : 2
                           }
                        
                       
        }
    }
 
}
