//
//  TaxRevenueBL.swift
//  PITax
//
//  Created by 关东升 on 2016-11-18.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//


import UIKit

public class TaxRevenueBL: NSObject {
    
    //计算个人所得税
    public func calculate(_ revenue: Double) -> Double {
        
        //月应纳个人所得税税额
        var tax = 0.0
        
        //月应纳税所得额
        let dbTaxRevenue = revenue - 5000
                
        if (dbTaxRevenue >= 0 && dbTaxRevenue <= 3000) { //月应纳税所得额不超过3000元
            tax = dbTaxRevenue * 0.03
        } else if (dbTaxRevenue > 3000 && dbTaxRevenue <= 12000) { //月应纳税所得额超过3000元至12000元
            tax = dbTaxRevenue * 0.1 - 210
        } else if (dbTaxRevenue > 12000 && dbTaxRevenue <= 25000) { //月应纳税所得额超过12000元至25000元
            tax = dbTaxRevenue * 0.2 - 1410
        } else if (dbTaxRevenue > 25000 && dbTaxRevenue <= 35000) { //月应纳税所得额超过25000元至35000元
            tax = dbTaxRevenue * 0.25 - 2660
        } else if (dbTaxRevenue > 35000 && dbTaxRevenue <= 55000) { //月应纳税所得额超过35000元至55000元
            tax = dbTaxRevenue * 0.3 - 4410
        } else if (dbTaxRevenue > 55000 && dbTaxRevenue <= 80000) { //月应纳税所得额超过55000元至80000元
            tax = dbTaxRevenue * 0.35 - 7160
        } else if (dbTaxRevenue > 80000) { //月应纳税所得额超过80000元
            tax = dbTaxRevenue * 0.45 - 15160
        }
        
        return tax
    }
}
