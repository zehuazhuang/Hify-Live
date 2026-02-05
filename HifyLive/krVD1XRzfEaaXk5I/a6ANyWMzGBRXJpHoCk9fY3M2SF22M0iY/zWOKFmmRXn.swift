//获取当前用户信息（无参数、token获取）
func aYTO7iD() async -> [String:Any]? {
    do {
        let xsq1a9QJATbk: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
            xH0OPzEYR4M5ewWkZQAveq6Vy7: "/api/user/newLive/getUserInfo",
            tD5tEJZTT0NlaIX7eMREG92BhO3n: [String: String](),
        )
       
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

//修改个人信息接口（头像、名字、生日）
struct p0vDQI0Dp0NwLzG4vFVG1avm: Codable {
    let zsLObZP: String? // icon
    let rApHcKdL9XnxIAcFk5Z8aah: String? // nickname
    let ha3AaH63DwF0M0XyK1q8AREsVw: String? // birthday

    func encode(to encoder: Encoder) throws {
        var zpPv1taTv8nkfL1wEyu9VVP8JTGabKsy = encoder.container(keyedBy: bonDyqD2YnaVJW.self)

        // 只 encode 非 nil
        if let zsLObZP {
            try zpPv1taTv8nkfL1wEyu9VVP8JTGabKsy.encode(zsLObZP, forKey: bonDyqD2YnaVJW("epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu()))
        }
        if let rApHcKdL9XnxIAcFk5Z8aah {
            try zpPv1taTv8nkfL1wEyu9VVP8JTGabKsy.encode(rApHcKdL9XnxIAcFk5Z8aah, forKey: bonDyqD2YnaVJW("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu()))
        }
        if let ha3AaH63DwF0M0XyK1q8AREsVw {
            try zpPv1taTv8nkfL1wEyu9VVP8JTGabKsy.encode(ha3AaH63DwF0M0XyK1q8AREsVw, forKey: bonDyqD2YnaVJW("r9m4DBfC1PJPAxrJqUKxjw==".bFHEatcgE4zzU9TCfDonsu()))
        }
    }
}

func zMfGchIhPuhjVeifVgq2pBi6XtmHd8(o5xi4gYSKKtKesOv4h6Qqmq5Gm7xaqV: String? = nil, fFJXbBAYX64Bd9TNTWYYIxykCGFjcDKb: String? = nil, jLCfyATGXvVMlhRsH3mEw: String? = nil) async -> Bool {
    do {
        let qKoRH8NX8Vj6SzCvR: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
            xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6jbUK0pmSQjPW95tmyhBOCVPGjGjPyN/Y+033ze9jtAq".bFHEatcgE4zzU9TCfDonsu(),
            tD5tEJZTT0NlaIX7eMREG92BhO3n: p0vDQI0Dp0NwLzG4vFVG1avm(zsLObZP: o5xi4gYSKKtKesOv4h6Qqmq5Gm7xaqV, rApHcKdL9XnxIAcFk5Z8aah: fFJXbBAYX64Bd9TNTWYYIxykCGFjcDKb, ha3AaH63DwF0M0XyK1q8AREsVw: jLCfyATGXvVMlhRsH3mEw)
        )
       
        if qKoRH8NX8Vj6SzCvR.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
            // 成功
            return true
        } else {
            return false
        }
    } catch {
        return false
    }
}
