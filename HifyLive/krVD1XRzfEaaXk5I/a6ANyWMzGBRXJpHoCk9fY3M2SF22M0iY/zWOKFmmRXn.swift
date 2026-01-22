//获取当前用户信息（无参数、token获取）
func aYTO7iD() async -> [String:Any]? {
    do {
        let xsq1a9QJATbk: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
            xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6nqC3rKE3+qsHYeGVuBnHPc=".bFHEatcgE4zzU9TCfDonsu(),
            tD5tEJZTT0NlaIX7eMREG92BhO3n: [String: String](),
        )
        print(xsq1a9QJATbk.code)
        if xsq1a9QJATbk.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
            // 成功
            guard
                let qwrdDG2vGQibtoJlUoFlHcwR5 = xsq1a9QJATbk.result,
                !qwrdDG2vGQibtoJlUoFlHcwR5.isEmpty
            else {
                return nil
            }
            //解密
            let z2s0z63CUrTWy2w7aHU = qwrdDG2vGQibtoJlUoFlHcwR5.hL9dV3bQ2fK6sJ8p()
            //字符串转json
            if let hQded1fUY6ZxlT3fWy = z2s0z63CUrTWy2w7aHU.kPOR9FHwcEZJv9YDf4W01D() {
                return hQded1fUY6ZxlT3fWy
            } else {
                return nil
            }
        } else {
            return nil
        }
    } catch {
        return nil
    }
}



//更新相册接口(个人)
struct tazwp4rwTC8IFhOgzVHmbHgL: Codable {
    
    let y0FrQuXTLZ3I8uHlXeaBP2x: [String] //pics
    
    func encode(to encoder: Encoder) throws {
        var hXYJbkBjUJuGNmyLISXzqkc = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        try hXYJbkBjUJuGNmyLISXzqkc.encode(
            y0FrQuXTLZ3I8uHlXeaBP2x,
            forKey: bonDyqD2YnaVJW(
                "wCbPENqEhnhB6jyTBZwWnQ==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
    }
}
func a7wkluGHEiGGT3Zc1PbE7(_ teYPbSC: [String]) async -> JUsmLn3i59tKLD7RL294I0nAG? {
    do {
        let qKoRH8NX8Vj6SzCvR: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
            xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6v1xnpzOjxqkUO8KCshjk3hJrhGE00LH/qyyxjhK9RRY".bFHEatcgE4zzU9TCfDonsu(),
            tD5tEJZTT0NlaIX7eMREG92BhO3n: tazwp4rwTC8IFhOgzVHmbHgL(y0FrQuXTLZ3I8uHlXeaBP2x: teYPbSC)
        )
        print(qKoRH8NX8Vj6SzCvR.code)
        if qKoRH8NX8Vj6SzCvR.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
            // 成功
            return qKoRH8NX8Vj6SzCvR //直接返回接口返回数据，防止成功返回结果为null误导失败结果
        } else {
            return nil
        }
    } catch {
        return nil
    }
}
