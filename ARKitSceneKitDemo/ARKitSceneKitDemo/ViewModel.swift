//
//  ViewModel.swift
//  ARKitSceneKitDemo
//
//  Created by 张晓珊 on 2018/10/12.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

import UIKit

class ViewModel {
    
    var models:[ResidentialAreaInfomationModel] = []
    
    func loadData(success: @escaping () -> Swift.Void ) {
//        let model0 = ResidentialAreaInfomationModel(id: "0000", name: "马连洼北路1号院社区", description: "北京市海淀区上地街道马连洼北路1号院社区", longitude: 116.312961771, latitude: 40.0425312144, distance: "约1公里")
//        let model1 = ResidentialAreaInfomationModel(id: "0001", name: "宣海家园", description: "北京市海淀区安宁庄西路11号", longitude: 116.3284552088, latitude: 40.0477298036, distance: "约2公里")
//        let model2 = ResidentialAreaInfomationModel(id: "0002", name: "怡美家园", description: "北京市海淀区安宁庄西路15号", longitude: 116.3264811030, latitude: 40.0465141612, distance: "约2公里")
//        let model3 = ResidentialAreaInfomationModel(id: "0003", name: "锦顺佳园", description: "中国北京市海淀区安宁庄西路与安宁庄西三条交叉口西250米", longitude: 116.3200879097, latitude: 40.0379979639, distance: "约1公里")
//        let model4 = ResidentialAreaInfomationModel(id: "0004", name: "和韵家园", description: "中国北京市海淀区安宁庄上地桥东北向", longitude: 116.3284019393, latitude: 40.0437577072, distance: "约2.4公里")
//        let model5 = ResidentialAreaInfomationModel(id: "0005", name: "融泽嘉园2期2号院", description: "中国北京市昌平区龙域北街与龙域西二路交汇处", longitude: 116.3112453615, latitude: 40.0736736335, distance: "约4.6公里")
//        let model6 = ResidentialAreaInfomationModel(id: "0006", name: "融泽嘉园一号院", description: "中国北京市昌平区龙域中路1号", longitude: 116.3137886866, latitude: 40.0745034914, distance: "约4.9公里")
//        let model7 = ResidentialAreaInfomationModel(id: "0007", name: "融泽嘉园", description: "中国北京市昌平区龙域中路与龙域北街交叉口西北100米", longitude: 116.3167386866, latitude: 40.0740114914, distance: "约5.2公里")
//        let model8 = ResidentialAreaInfomationModel(id: "0008", name: "金域华府", description: "中国北京市昌平区龙域中路5号", longitude: 116.3155586866, latitude: 40.0715314914, distance: "约4.2公里")
//        let model9 = ResidentialAreaInfomationModel(id: "0009", name: "融泽嘉园中期", description: "中国北京市昌平区龙域中路", longitude: 116.3182386866, latitude: 40.0717914914, distance: "约4.9公里")
//        models = [model0, model1, model2, model3, model4, model5, model6, model7, model8, model9]
        
        let model0 = ResidentialAreaInfomationModel(id: "0000", name: "方正大厦", description: "中国北京市北京市海淀区信息路甲9号", longitude: 116.3138226651, latitude: 40.0469244252, distance: "约100米")
        let model1 = ResidentialAreaInfomationModel(id: "0001", name: "昊海大厦", description: "中国北京市北京市海淀区信息路甲9号", longitude: 116.3149491929, latitude: 40.0472858335, distance: "约100米")
        let model2 = ResidentialAreaInfomationModel(id: "0002", name: "中关村发展大厦", description: "北京市海淀区安宁庄西路15号", longitude: 116.3155392789, latitude: 40.0464644483, distance: "约100米")
        let model3 = ResidentialAreaInfomationModel(id: "0003", name: "华盛大厦", description: "中国北京市海淀区安宁庄西路与安宁庄西三条交叉口西250米", longitude: 116.3138333940, latitude: 40.0463699884, distance: "约100米")
        let model4 = ResidentialAreaInfomationModel(id: "0004", name: "奎科大厦", description: "中国北京市海淀区安宁庄上地桥东北向", longitude: 116.3131574773, latitude: 40.0478238354, distance: "约200米")
        let model5 = ResidentialAreaInfomationModel(id: "0005", name: "南天大厦", description: "中国北京市昌平区龙域北街与龙域西二路交汇处", longitude: 116.3144985818, latitude: 40.0480127511, distance: "约200米")
        let model6 = ResidentialAreaInfomationModel(id: "0006", name: "联想大厦", description: "中国北京市昌平区龙域中路1号", longitude: 116.3163975858, latitude: 40.0481975594, distance: "约300米")
        let model7 = ResidentialAreaInfomationModel(id: "0007", name: "联想三标大厦", description: "中国北京市昌平区龙域中路与龙域北街交叉口西北100米", longitude: 116.3172076129, latitude: 40.0467971105, distance: "约300米")
        let model8 = ResidentialAreaInfomationModel(id: "0008", name: "彩虹大厦", description: "中国北京市昌平区龙域中路5号", longitude: 116.3148740911, latitude: 40.0452200310, distance: "约400米")
        let model9 = ResidentialAreaInfomationModel(id: "0009", name: "福道大厦", description: "中国北京市昌平区龙域中路", longitude: 116.3120953225, latitude: 40.0462139239, distance: "约400米")
        models = [model0, model1, model2, model3, model4, model5, model6, model7, model8, model9]

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            success()
        }
    }

}


struct ResidentialAreaInfomationModel {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var longitude: Double = 0
    var latitude: Double = 0
    var distance: String = ""
    
}
