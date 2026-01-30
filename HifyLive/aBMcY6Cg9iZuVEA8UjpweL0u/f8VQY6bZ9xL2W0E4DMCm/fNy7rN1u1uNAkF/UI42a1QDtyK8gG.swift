
//反馈页
import SwiftUI
import SwiftfulRouting
import _PhotosUI_SwiftUI

struct UI42a1QDtyK8gG: View {
    @Environment(\.router) var rM9Z8S7A1ql
    let pqeKSo0y1Col: [GridItem] = [
        GridItem(.flexible(), spacing: 17),
        GridItem(.flexible(), spacing: 17)
    ]
    @State private var uTTt3GAWH = ["Nudity","Harassment","Content including \nminors","Illegal content"]
    @State private var zl2SSqI7hK = -1 //当前选中
    @State private var descriptionText: String = ""
    let maxLength: Int = 200 // 最大字符数限制
    @FocusState private var iseUA9AeUS: Bool
    @State private var selectedPhotos: [PhotosPickerItem] = [] // 原生 PickerItem
    @State private var images: [UIImage] = [] // 转成 UIImage
    @State private var showPicker = false
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
                        rM9Z8S7A1ql.dismissScreen()
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

                                TextEditor(text: $descriptionText)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .frame(height: 112, alignment: .top)
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
                                    ZJ7h766mz(tMmEWWlfgUag: "aXo1EDsWsqHJ")
                                                       .frame(width: 96, height: 96)
                                                       .onTapGesture {
                                                           showPicker = true
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
                                                        }
                                                        .offset(x: 4, y: -4) // 调整到右上角
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
                                               if(zl2SSqI7hK != -1 && descriptionText != "" ){
                                                   EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                                                   
                                                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                                                       
                                                                        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("jQf/6nEO7LJdZsoZo87j9q8hoeuGa1fekQCSFzrOfek8l1cB2IONpwkfNEcsBnomIStfkgspztU6ncVlhaWoWQ==")
                                                       EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                       rM9Z8S7A1ql.dismissScreen()
                                                   }
                                               }else{
                                                   QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("xnyswHR1AgUmKQ2sYl5pA50bRnPpa5dqnovKeoJzXv3wlikYkM/cxmVc5911mWjp")
                                               }
                                           }
                    }
                }
            }.padding(.horizontal,16)
        }.onTapGesture {
          
            iseUA9AeUS = false
        }.photosPicker(
            isPresented: $showPicker,
            selection: $selectedPhotos,
            maxSelectionCount: 3,
            matching: .images
        )
        .onChange(of: selectedPhotos) { newItems in
            
            images.removeAll()
            
            for item in newItems {
                // 异步加载 UIImage
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        await MainActor.run {
                            images.append(uiImage)
                        }
                    }
                }
            }
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
