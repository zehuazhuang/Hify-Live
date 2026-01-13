import SwiftUI
import SwiftfulRouting

struct QsS1CqA9M8tL2fs: View {
    @State private var q2C4Mtl3iNa: String = ""
    @FocusState private var arquilbreFocu: Bool
    @State private var tsteadySelect: Bool = true
    @Environment(\.router) var rM9Z8S7A1ql
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                            .ignoresSafeArea()
                            .onTapGesture {
                                        arquilbreFocu = false
                                    }
            VStack{
                HStack(spacing:0){
                    Button {
                        rM9Z8S7A1ql.dismissScreen()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    .padding(.trailing,12)
                    .contentShape(Rectangle())
                    HStack{
                        ZStack(alignment: .leading) {
                                                        if q2C4Mtl3iNa.isEmpty {
                                                            Text("JALs87f+I/wMwfTm2r+TlJfbhkEz0nolhjb7HMhztjg=".bFHEatcgE4zzU9TCfDonsu())
                                                                            .g0LIIcoZQsOjyND9(
                                                                                size: 16,
                                                                                weight: .regular,
                                                                                color: .white.opacity(0.4)
                                                                            ).padding(.leading, 16)
                                                        }
                                                        TextField("", text: $q2C4Mtl3iNa)
                                                            .foregroundColor(.white)
                                                            .padding(16)
                                                            .focused($arquilbreFocu)
                                                    }
                        
                        ZJ7h766mz(tMmEWWlfgUag: "Zq7S9M2C18L4A3t")
                            .frame(width: 36, height: 36)
                    }.padding(.horizontal,4)
                    .frame(height: 46)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 34/255, green: 34/255, blue: 38/255))
                        .cornerRadius(24)
                }
                HStack(){
                    ZStack{
                        Text("H0mDYXXNCqE/eka4W9EdDg==".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(
                                            size: 18,
                                            weight: tsteadySelect ? .black : .semibold,
                                            color: tsteadySelect ?  .white : .white.opacity(0.4)
                                        ).frame(maxHeight: .infinity,alignment:.top)
                        if tsteadySelect {
                            ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                .frame(width: 28, height: 12)
                                .frame(maxHeight: .infinity,alignment:.bottom)
                        }
                        
                    }
                    .frame(width: 102,height: 34)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation{
                            tsteadySelect = true
                        }
                    }
                    Spacer()
                    ZStack{
                        Text("WWLXeMc2FstL2loM2FhSVg==".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(
                                            size: 18,
                                            weight: !tsteadySelect ? .black : .semibold,
                                            color: !tsteadySelect ?  .white : .white.opacity(0.4)
                                        ).frame(maxHeight: .infinity,alignment:.top)
                        
                        if !tsteadySelect {
                            ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                .frame(width: 28, height: 12)
                                .frame(maxHeight: .infinity,alignment:.bottom)
                        }
                    }
                    .frame(width: 102,height: 34)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation{
                            tsteadySelect = false
                        }
                    }
                }.padding(.top,15)
                 .padding(.horizontal,47)
                ScrollView{
                    VStack{
                        
                    }
                }
            }.padding(.horizontal,16)
        }
    }
}
