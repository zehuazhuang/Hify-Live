import SwiftUI

struct bviVhbptEhW0H38XWrfeY: View {
    
    @State private var h00RqGIatisYGH8aaaKHpjbkg143FTlr = Date()
    
    var body: some View {
        ZJ7h766mz(tMmEWWlfgUag: "xPW24mCd1SORVR56nr4UXuY")
            .frame(maxWidth: .infinity)
            .frame(height: 371)
            .overlay {
                VStack(spacing: 0) {
                    HStack(spacing: 4) {
                        ZJ7h766mz(tMmEWWlfgUag: "j1GtPWGpGXrkZWpZEifKWjZWaz2")
                            .frame(width: 24,height: 24)
                        Text("vySCbBGonoa5qd8IaXr4Iw==".bFHEatcgE4zzU9TCfDonsu())
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: .semibold
                            )
                        Spacer()
                    }
                    .padding(.top,24)
                    .padding(.leading,16)
                    Spacer()
                    D3M1wOe4Q3cZ(zXl7ztyWA0l0gyT1junrGU2QTsP: $h00RqGIatisYGH8aaaKHpjbkg143FTlr)
                        .padding(.horizontal,16)
                    Spacer()
                    Button{
                        print(h00RqGIatisYGH8aaaKHpjbkg143FTlr)
                    }label:{
                        ZJ7h766mz(tMmEWWlfgUag: "ovdsD4s27")
                            .frame(width: 262,height: 46)
                            .overlay(alignment: .center) {
                                Text("OsfHVPPKKXIHMyiwPxWJ2g==".bFHEatcgE4zzU9TCfDonsu())
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: .semibold
                                    )
                            }
                    }
                }
                .padding(.bottom,37)
            }
    }
}

#Preview {
    bviVhbptEhW0H38XWrfeY()
}


struct D3M1wOe4Q3cZ: View {
    @Binding var wHyz1GoO: Date

    @State private var ykVWsKRYCDJR5tqIrp: Int
    @State private var d1bEiDIqPDNV4yf8JPixIsTV: Int
    @State private var aqwug67kR15H8Z7tx3P: Int
    
    static let h3qIV7sYq = Calendar.current.component(.year, from: Date())
    
    let j1HMyJiE3EGQaDyWXz2G3BV5T9piSn = Array(1900...h3qIV7sYq)
    let eRz8WDOmX90c9 = Array(1...12)

    private var ecrR6JIGsQhjBc7h: [Int] {
        let p5Bwb3nFWOVLhiNAVM5LO = Calendar.current
        var kPblkgHtLgGcPfqTRtJF = DateComponents()
        kPblkgHtLgGcPfqTRtJF.year = ykVWsKRYCDJR5tqIrp
        kPblkgHtLgGcPfqTRtJF.month = d1bEiDIqPDNV4yf8JPixIsTV
        let sOW8ysEOXI = p5Bwb3nFWOVLhiNAVM5LO.date(from: kPblkgHtLgGcPfqTRtJF) ?? Date()
        let kySV4jpH8qQ64FAYHOACrwx = p5Bwb3nFWOVLhiNAVM5LO.range(of: .day, in: .month, for: sOW8ysEOXI) ?? 1..<32
        return Array(kySV4jpH8qQ64FAYHOACrwx)
    }

    init(zXl7ztyWA0l0gyT1junrGU2QTsP: Binding<Date>) {
        _wHyz1GoO = zXl7ztyWA0l0gyT1junrGU2QTsP
        let e1l3ZFEHDlyZGv6hZTkbPGX = Calendar.current
        let tUbWl2e6Wb55Yd2GGxv0uF3tUy = zXl7ztyWA0l0gyT1junrGU2QTsP.wrappedValue
        _ykVWsKRYCDJR5tqIrp = State(initialValue: e1l3ZFEHDlyZGv6hZTkbPGX.component(.year, from: tUbWl2e6Wb55Yd2GGxv0uF3tUy))
        _d1bEiDIqPDNV4yf8JPixIsTV = State(initialValue: e1l3ZFEHDlyZGv6hZTkbPGX.component(.month, from: tUbWl2e6Wb55Yd2GGxv0uF3tUy))
        _aqwug67kR15H8Z7tx3P = State(initialValue: e1l3ZFEHDlyZGv6hZTkbPGX.component(.day, from: tUbWl2e6Wb55Yd2GGxv0uF3tUy))
    }

    var body: some View {
        HStack(spacing: 0) {
            // 年
            Picker("", selection: $ykVWsKRYCDJR5tqIrp) {
                ForEach(j1HMyJiE3EGQaDyWXz2G3BV5T9piSn, id: \.self) { pbd5zpNP1B3L0ncIYYq in
                    Text(String(pbd5zpNP1B3L0ncIYYq))
                        .g0LIIcoZQsOjyND9(
                            size: 22,
                            weight: .semibold
                        )
                }
            }
            .pickerStyle(WheelPickerStyle())

            // 月
            Picker("", selection: $d1bEiDIqPDNV4yf8JPixIsTV) {
                ForEach(eRz8WDOmX90c9, id: \.self) { fLPBvCqotp1k6 in
                    Text("\(fLPBvCqotp1k6)")
                        .g0LIIcoZQsOjyND9(
                            size: 22,
                            weight: .semibold
                        )
                }
            }
            .pickerStyle(WheelPickerStyle())

            // 日
            Picker("", selection: $aqwug67kR15H8Z7tx3P) {
                ForEach(ecrR6JIGsQhjBc7h, id: \.self) { n2so8Od in
                    Text("\(n2so8Od)")
                        .g0LIIcoZQsOjyND9(
                            size: 22,
                            weight: .semibold
                        )
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        .onChange(of: ykVWsKRYCDJR5tqIrp) { _ in h5EAgwacfD3NY1SHj3xnYWI() }
        .onChange(of: d1bEiDIqPDNV4yf8JPixIsTV) { _ in h5EAgwacfD3NY1SHj3xnYWI() }
        .onChange(of: aqwug67kR15H8Z7tx3P) { _ in h5EAgwacfD3NY1SHj3xnYWI() }
    }

    private func h5EAgwacfD3NY1SHj3xnYWI() {
        var kK96lG5J3xBqKyNx = DateComponents()
        kK96lG5J3xBqKyNx.year = ykVWsKRYCDJR5tqIrp
        kK96lG5J3xBqKyNx.month = d1bEiDIqPDNV4yf8JPixIsTV
        kK96lG5J3xBqKyNx.day = aqwug67kR15H8Z7tx3P
        if let lOupzGxdE9nw8rK = Calendar.current.date(from: kK96lG5J3xBqKyNx) {
            wHyz1GoO = lOupzGxdE9nw8rK
        }
    }
}
