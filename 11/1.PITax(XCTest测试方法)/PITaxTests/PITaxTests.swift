//
//  PITaxTests.swift
//  PITaxTests
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


import XCTest
import PITax

class PITaxTests: XCTestCase {
    
    var bl: TaxRevenueBL!
    
    override func setUp() {
        super.setUp()
        self.bl = TaxRevenueBL()
    }
    
    override func tearDown() {
        self.bl = nil
        super.tearDown()
    }
    
    // 用例1:月收入不超过5000
    func testCalculateLevel1() {
        let dbRevenue = 3000.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 0, "用例1测试失败")
    }
    
    // 用例2:月应纳税额不超过3000元
    func testCalculateLevel2() {
        let dbRevenue = 5500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 15, "用例2测试失败")
    }
    
    // 用例3:月应纳税额在3000元至12000元之间
    func testCalculateLevel3() {
        let dbRevenue = 8500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 140, "用例3测试失败")
    }
    
     // 用例4:月应纳税额在12000元至25000元之间
    func testCalculateLevel4() {
        let dbRevenue = 12500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 540, "用例4测试失败")
    }
    
    // 用例5:月应纳税额在25000元至35000元之间
    func testCalculateLevel5() {
        let dbRevenue = 30000.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 3590, "用例5测试失败")
    }
    
    // 用例6:月应纳税额在35000元至55000元之间
    func testCalculateLevel6() {
        let dbRevenue = 40000.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 6090, "用例6测试失败")
    }
    
    // 用例7:月应纳税额在55000元至80000元之间
    func testCalculateLevel7() {
        let dbRevenue = 70000.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 15590, "用例7测试失败")
    }
    
    // 用例8:测试月应纳税额超过80000元
    func testCalculateLevel8() {
        let dbRevenue = 100000.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 27590, "用例8测试失败")
    }
    
}
