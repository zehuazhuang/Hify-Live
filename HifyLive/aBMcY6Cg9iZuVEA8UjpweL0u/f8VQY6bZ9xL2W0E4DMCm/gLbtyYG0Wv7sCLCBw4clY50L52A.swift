import SwiftUI

//用户昵称修改
struct gLbtyYG0Wv7sCLCBw4clY50L52A: View {
    @Binding var eVulY4gOzp0: Bool
    let iL0NKgp4pke7ysRjBfAm2JfaRY4gSmr: String
    var lCxJiMKZtg1hoPRLD0YDp9: (String) -> Void
    
    @State private var hBI7bFivrdmASi: String = ""
    @FocusState private var o8CfJNzcNNz: Bool
    let mgGUbAYkNKRGh5cKByI: Int = 24
    @State private var isZ7E4xA0M2 = false
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    eVulY4gOzp0 = false
                }
            VStack{
                Spacer()
                VStack(spacing: 24) {
                    VStack(spacing: 20) {
                        Text("VOtKGpZBlCH3EC4QBRk4LA==".bFHEatcgE4zzU9TCfDonsu())
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: .semibold
                            )
                        ZStack(alignment: .bottomTrailing) {
                            // 背景
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white.opacity(0.15))
                                .frame(height: 76)
                            
                            // 多行输入框
                            TextEditor(text: $hBI7bFivrdmASi).tint(.white)
                                .focused($o8CfJNzcNNz)
                                .scrollContentBackground(.hidden) // ✅ 隐藏白色背景
                                .background(Color.clear)
                                .foregroundColor(.white)
                                .padding(.horizontal,16)
                                .padding(.vertical,12)
                                .frame(height: 76)
                                .onChange(of: hBI7bFivrdmASi) { qa1XyTOGMIf4veFojadk10GaDN in
                                    if qa1XyTOGMIf4veFojadk10GaDN.count > mgGUbAYkNKRGh5cKByI {
                                        hBI7bFivrdmASi = String(qa1XyTOGMIf4veFojadk10GaDN.prefix(mgGUbAYkNKRGh5cKByI))
                                    }
                                }
                            
                            // 字数限制
                            Text("\(hBI7bFivrdmASi.count)/\(mgGUbAYkNKRGh5cKByI)")
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    color: (hBI7bFivrdmASi.count >= 24 || hBI7bFivrdmASi.count == 0) ? .red : Color.white.opacity(0.4)
                                )
                                .padding(.bottom,8)
                                .padding(.horizontal,16)
                        }
                        .onTapGesture {
                            o8CfJNzcNNz = true
                        }
                        .padding(.horizontal,16)
                    }
                    Button {
                        if hBI7bFivrdmASi.isEmpty {
                            return
                        }
                        lCxJiMKZtg1hoPRLD0YDp9(hBI7bFivrdmASi)
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "ovdsD4s27")
                            .frame(width: 262,height: 46)
                            .overlay(alignment: .center) {
                                Text("hZ5+j3VKZ8mtaGSA5ogSvw==".bFHEatcgE4zzU9TCfDonsu())
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: .semibold
                                    )
                            }
                    }
                }
                .padding(.top,24)
                .padding(.bottom,37)
                .background(
                    ZJ7h766mz(tMmEWWlfgUag: "xPW24mCd1SORVR56nr4UXuY")
                )
                .onTapGesture {
                    o8CfJNzcNNz = false
                }.offset(y: isZ7E4xA0M2 ? 0 : 253)
                .onAppear {
                    hBI7bFivrdmASi = iL0NKgp4pke7ysRjBfAm2JfaRY4gSmr
                    
                    isZ7E4xA0M2 = false
                    DispatchQueue.main.async {
                        withAnimation(.easeOut(duration: 0.25)) {
                            isZ7E4xA0M2 = true
                        }
                    }
                }
            }
        }
    }
}
