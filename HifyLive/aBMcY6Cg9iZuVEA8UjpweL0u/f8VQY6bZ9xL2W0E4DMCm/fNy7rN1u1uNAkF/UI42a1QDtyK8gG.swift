
//反馈页
import SwiftUI
import _PhotosUI_SwiftUI
import UIPilot

struct UI42a1QDtyK8gG: View {
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    let pqeKSo0y1Col: [GridItem] = [
        GridItem(.flexible(), spacing: 17),
        GridItem(.flexible(), spacing: 17)
    ]
    @State private var uTTt3GAWH = ["Nudity","Harassment","Content including \nminors","Illegal content"]
    @State private var zl2SSqI7hK = 0 //当前选中
    @State private var descriptionText: String = ""
    let maxLength: Int = 200 // 最大字符数限制
    @FocusState private var iseUA9AeUS: Bool
    @State private var selectedPhotos: [PhotosPickerItem] = [] // 原生 PickerItem
    @State private var images: [UIImage] = [] // 转成 UIImage
    @State private var showPicker = false
    @State private var showCamera = false
    @State private var cameraImage: UIImage? = nil
    @State private var oiqJtAPU = false //显示上传相册弹框
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            ZJ7h766mz(tMmEWWlfgUag: "e6W4Zx7QYbEL")
                .scaledToFill()
                .frame(height: 462)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button {
                        pilot.pop()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24, height: 24)
                            .padding(.trailing,12)
                    }
                    Text("Report")
                                    .g0LIIcoZQsOjyND9(
                                        size: 20,
                                        weight: .semibold
                                    )
                    Spacer()
                }
                ScrollView(showsIndicators: false){
                    VStack(alignment:.leading,spacing: 24){
                        Text("Tip: You will no longer see this person after reporting them.")
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .semibold
                                        )
                        VStack(alignment:.leading,spacing:12){
                            Text("Report reason:")
                                            .g0LIIcoZQsOjyND9(
                                                size: 16,
                                                weight: .medium
                                            )
                            LazyVGrid(columns: pqeKSo0y1Col, spacing: 8) {
                                ForEach(0..<uTTt3GAWH.count,id: \.self) { index in
                                    GBxH1epyC6po(eZK8laAnIndex: zl2SSqI7hK == index, mIy6KBQ6cStr: uTTt3GAWH[index])
                                        .onTapGesture {
                                            withAnimation{
                                                zl2SSqI7hK = index
                                            }
                                        }
                                
                                }
                            }
                        }
                        VStack(alignment:.leading,spacing:12){
                            Text("Detailed description:")
                                            .g0LIIcoZQsOjyND9(
                                                size: 16,
                                                weight: .semibold
                                            )
                            // TextField
                            ZStack(alignment: .topLeading) {
                                if descriptionText.isEmpty {
                                    HStack(spacing:0){
                                        Text("Input report reason")
                                            .g0LIIcoZQsOjyND9(
                                                size: 14,
                                                weight: .regular,
                                                color: .white.opacity(0.4)
                                            )
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 12)
                                        
                                        ZJ7h766mz(tMmEWWlfgUag: "miBJ0M3Fpuv")
                                                           .frame(width: 12, height: 12)
                                        Spacer()
                                    }
                                }

                                ZStack(alignment: .bottomTrailing) {
                                    TextEditor(text: $descriptionText)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                        .frame(height: 112)
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal, 4)
                                        .padding(.vertical, 5)
                                        .scrollContentBackground(.hidden)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                        )
                                        .focused($iseUA9AeUS)
                                        .onChange(of: descriptionText) { newValue in
                                            if newValue.count > maxLength {
                                                descriptionText = String(newValue.prefix(maxLength))
                                            }
                                        }

                                    // 👇 右下角字数提示
                                    Text("\(descriptionText.count)/\(maxLength)")
                                        .font(.system(size: 11))
                                        .foregroundColor(
                                            descriptionText.count >= maxLength
                                            ? .red
                                            : .gray
                                        )
                                        .padding(.trailing, 10)
                                        .padding(.bottom, 12)
                                }
                            }
                        }
                        VStack(alignment:.leading,spacing:12){
                            Text("Add picture")
                                            .g0LIIcoZQsOjyND9(
                                                size: 16,
                                                weight: .semibold
                                            )
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    if images.count < 6 {
                                        ZJ7h766mz(tMmEWWlfgUag: "aXo1EDsWsqHJ")
                                                           .frame(width: 96, height: 96)
                                                           .onTapGesture {
                                                               withAnimation{
                                                                   oiqJtAPU = true
                                                               }
                                                           }
                                    }
                                    
                                    // 展示已选图片
                                                ForEach(images.indices, id: \.self) { index in
                                                    ZStack(alignment: .topTrailing) {
                                                        // 图片
                                                        Image(uiImage: images[index])
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 96, height: 96)
                                                            .clipped()
                                                            .cornerRadius(12)

                                                        // 删除按钮
                                                        Button(action: {
                                                            images.remove(at: index)
                                                        }) {
                                                            ZJ7h766mz(tMmEWWlfgUag: "pD8K1Q5tB6R9Lh")
                                                                
                                                                .frame(width: 24, height: 24)
                                                                .background(Color.black.opacity(0.5))
                                                                .clipShape(Circle())
                                                        }.padding(.top,4)
                                                            .padding(.trailing,4)
                                                        
                                                    }
                                                    .frame(width: 96, height: 96)
                                                }
                                }
                               
                            }
                        }
                        ZJ7h766mz(tMmEWWlfgUag: "Qlc6iRNfrw71")
                                           .frame(width: 262, height: 46)
                                           .frame(maxWidth: .infinity,alignment: .center)
                                           .onTapGesture {
                                               if !Yi9m02SYzI7dI.shared.isConnected {
                                                   QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("K0e4tAjTJcHU6EUVZUTWoNwIwhkclCvfsmmek2Z5efk=",type: 1)
                                                   return
                                               }
                                               
                                               if(zl2SSqI7hK != -1 ){
                                                   EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                                                   
                                                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                                                       
                                                                        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("lJjLBJiZZo0QtTGrUm7tagx9NHD5bjuEKsfuukH+JMQ=")
                                                       EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                       LiveSessionManager.shared.selectedTab = .lonaranpeH
                                                       pilot.popTo(.lsoFZyn41MiKHome)
                                                   }
                                               }else{
                                                   QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("xnyswHR1AgUmKQ2sYl5pA50bRnPpa5dqnovKeoJzXv3wlikYkM/cxmVc5911mWjp")
                                               }
                                           }
                    }
                }
            }.padding(.horizontal,16)
            
            if oiqJtAPU {
                JD5bDC8yFXT7UL(bDAxsMgfM: $oiqJtAPU, tfYmBPP: {wS93HoType in
                    if wS93HoType == 0 {
                             // 相册
                             showPicker = true
                         } else if wS93HoType == 1 {
                             // 拍照
                             showCamera = true
                         }
                })
            }
        }.onTapGesture {
          
            iseUA9AeUS = false
        }.photosPicker(
            isPresented: $showPicker,
            selection: $selectedPhotos,
            maxSelectionCount: 6,
            matching: .images
        ).fullScreenCover(isPresented: $showCamera) {
            CameraPicker(image: $cameraImage)
                .ignoresSafeArea()
        }
        .onChange(of: selectedPhotos) { newItems in
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        await MainActor.run {
                            if images.count < 6 {
                                images.append(uiImage)
                            }
                        }
                    }
                }
            }
        }.onChange(of: cameraImage) { img in
            guard let img else { return }

            if images.count < 6 {
                images.append(img)
            }

            cameraImage = nil
        }
    }
}

//反馈小组件
struct GBxH1epyC6po: View {
    let eZK8laAnIndex : Bool
    let mIy6KBQ6cStr : String

    var body: some View {
        ZStack{
            Text(mIy6KBQ6cStr)
                .g0LIIcoZQsOjyND9(
                    size: 16,
                    weight: .regular,
                    color: .white.opacity(0.6)
                )
        }
        .frame(height: 78)
        .frame(maxWidth: .infinity)
        .background(
            Color(red: 254/255, green: 54/255, blue: 31/255)
                .opacity(eZK8laAnIndex ? 0.15 : 0)
                
        )
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    LinearGradient(
                        colors: [
                            eZK8laAnIndex ?  Color(red: 203/255, green: 15/255, blue: 255/255) : .white.opacity(0.15),
                            eZK8laAnIndex ?  Color(red: 255/255, green: 55/255, blue: 28/255) : .white.opacity(0.15),
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 1
                )
        )
       
    }
}
