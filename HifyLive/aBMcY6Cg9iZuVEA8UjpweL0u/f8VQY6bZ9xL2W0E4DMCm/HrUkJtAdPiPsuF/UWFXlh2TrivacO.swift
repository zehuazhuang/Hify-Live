//
//  UWFXlh2TrivacO.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/3.
//

import Combine

//订单信息
struct YCvhZ4Vfa4MJdE {
    var i3YwF3f4X49cAp: Int //skuInfoId
    var pLKw7yh8607EVU: Int //templateId
    var yIUCmFJntFv:String //paymentMethodType
    var jKfHX18l05KgyJ: String //productId
    var xKlB9DEqrKHOL: String //frontCallbackUrl
    var lzqk3YEs2k0oF: Int //countryTypeId
    var s3ioMtTk4vEw: Int //vipFlag
    var u2jZGt1Jno4: String //chainName
    var vFuf48ZH70M: String //diamondDetail
    var b42PKWDu57JAxR:Int //skuId
    var uyJwEpTa8Rje: String //paymentToken
    var sQCV629SO6J: String //sessionKey
    var xhiy7qgXun:Int //showType
}

@MainActor
class RZ5EA4IPxfI4x: ObservableObject {

    @Published var eEqatzcKSu6VB: YCvhZ4Vfa4MJdE?

    func save(
        i3YwF3f4X49cAp: Int,
        pLKw7yh8607EVU: Int,
        yIUCmFJntFv:String,
        jKfHX18l05KgyJ: String,
        xKlB9DEqrKHOL:String,
        lzqk3YEs2k0oF:Int,
        s3ioMtTk4vEw:Int,
        u2jZGt1Jno4:String,
        vFuf48ZH70M:String,
        b42PKWDu57JAxR:Int,
        uyJwEpTa8Rje:String,
        sQCV629SO6J:String,
        xhiy7qgXun:Int,
    ) {
        eEqatzcKSu6VB = YCvhZ4Vfa4MJdE(
            i3YwF3f4X49cAp: i3YwF3f4X49cAp,
            pLKw7yh8607EVU: pLKw7yh8607EVU,
            yIUCmFJntFv:yIUCmFJntFv,
            jKfHX18l05KgyJ: jKfHX18l05KgyJ,
            xKlB9DEqrKHOL:xKlB9DEqrKHOL,
            lzqk3YEs2k0oF:lzqk3YEs2k0oF,
            s3ioMtTk4vEw:s3ioMtTk4vEw,
            u2jZGt1Jno4:u2jZGt1Jno4,
            vFuf48ZH70M:vFuf48ZH70M,
            b42PKWDu57JAxR:b42PKWDu57JAxR,
            uyJwEpTa8Rje:uyJwEpTa8Rje,
            sQCV629SO6J:sQCV629SO6J,
            xhiy7qgXun:xhiy7qgXun,
        )
    }

    func clear() {
        eEqatzcKSu6VB = nil
    }
}
