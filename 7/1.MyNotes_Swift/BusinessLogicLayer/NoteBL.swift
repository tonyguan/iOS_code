//
//  NoteBL.swift
//  MyNotes
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

import Foundation

class NoteBL {

    //插入Note方法
    func create(_ model: Note) -> NSMutableArray {
        let dao: NoteDAO = NoteDAO.sharedInstance
        dao.create(model)
        return dao.findAll()
    }

    //删除Note方法
    func remove(_ model: Note) -> NSMutableArray {
        let dao: NoteDAO = NoteDAO.sharedInstance
        dao.remove(model)
        return dao.findAll()
    }

    //查询所用数据方法
    func findAll() -> NSMutableArray {
        let dao: NoteDAO = NoteDAO.sharedInstance
        return dao.findAll()
    }

}
