import SwiftUI

struct zpPt6HEcUfuVXHI2CXtIaD1P: View {
    
    @State private var pbPeJ: String = ""
    @FocusState private var dJ6wwhY5aezAaUY7ATD2: Bool
    
    var body: some View {
        ZStack(){
            Color(red: 13/255, green: 13/255, blue: 18/255)
            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                    Text("IIcD4XUcyOX7TLBvuArCSA==".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                }
                .padding(.top,58)
                .padding(.leading,16)
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        Color(red: 34/255, green: 34/255, blue: 38/255)
                    )
                    .overlay {
                        HStack(spacing: 0) {
                            ZStack(alignment: .leading) {
                                if pbPeJ.isEmpty {
                                    Text("5RcmlzkDxZCW74E2DPoqwQ==".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            color: Color.white.opacity(0.4)
                                        )
                                        .padding(.horizontal,16)
                                }
                                TextField("", text: $pbPeJ)
                                    .font(.custom("gz4QHFqRS4dH1OeOv3Zirg==".bFHEatcgE4zzU9TCfDonsu(), size: CGFloat(16)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal,16)
                                    .tint(Color.white)
                                    .focused($dJ6wwhY5aezAaUY7ATD2)
                            }
                            HStack(spacing: 14) {
                                if !pbPeJ.isEmpty {
                                    Button{
                                        pbPeJ = ""
                                    }label:{
                                        ZJ7h766mz(tMmEWWlfgUag: "zFOucRMExHz70IQ9HN054")
                                            .frame(width: 20,height: 20)
                                    }
                                }
                                ZJ7h766mz(tMmEWWlfgUag: "dISVC2NZGVkMSRHxkVy2")
                                    .frame(width: 36,height: 36)
                            }
                            .padding(.trailing,4)
                        }
                    }
                    .frame(height: 46)
                    .padding(.top,23)
                    .padding(.bottom,3)
                    .padding(.horizontal,16)
                ScrollView {
                    VStack(spacing: 0) {
                        
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            dJ6wwhY5aezAaUY7ATD2 = false
        }
    }
}

#Preview {
    zpPt6HEcUfuVXHI2CXtIaD1P()
}
