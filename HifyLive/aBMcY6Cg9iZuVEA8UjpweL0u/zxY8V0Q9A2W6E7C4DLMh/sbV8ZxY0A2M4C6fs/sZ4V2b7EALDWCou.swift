//搜索组件
import SwiftUI
struct sZ4V2b7EALDWCou: View {

    @Binding var q2C4Mtl3iNa: String
    @Binding var i6L2M4Yai0s: Bool
    @FocusState private var arquilbreFocu: Bool
    var on8M9xY6Q0: (String) -> Void

    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if q2C4Mtl3iNa.isEmpty {
                    Text("JALs87f+I/wMwfTm2r+TlJfbhkEz0nolhjb7HMhztjg="
                        .bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            size: 16,
                            weight: .regular,
                            color: .white.opacity(0.4)
                        )
                        .padding(.leading, 16)
                }

                TextField("", text: $q2C4Mtl3iNa)
                    .foregroundColor(.white)
                    .padding(16)
                    .focused($arquilbreFocu)
                    .submitLabel(.search)
                                        .onSubmit {
                                            oiserformeSear()
                                        }
                    .onChange(of: arquilbreFocu) { i6L2M4Yai0s = $0 }
            }
            if q2C4Mtl3iNa != "" {
                ZJ7h766mz(tMmEWWlfgUag: "c0Z8b7M9V6A4lo")
                    .frame(width: 20, height: 20)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        q2C4Mtl3iNa = ""
                    }.padding(.trailing,8)
            }
            
            ZJ7h766mz(tMmEWWlfgUag: "Zq7S9M2C18L4A3t")
                .frame(width: 36, height: 36)
                .onTapGesture {
                    
                    oiserformeSear()
                    
                    
                }
        }
        .padding(.horizontal, 4)
        .frame(height: 46)
        .background(Color(red: 34/255, green: 34/255, blue: 38/255))
        .cornerRadius(24)
        .onChange(of: i6L2M4Yai0s) { arquilbreFocu = $0 }
    }
    private func oiserformeSear() {
            guard !q2C4Mtl3iNa.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            arquilbreFocu = false
            on8M9xY6Q0(q2C4Mtl3iNa)
        }
}
