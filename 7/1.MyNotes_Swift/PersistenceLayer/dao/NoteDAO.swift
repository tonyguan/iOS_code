//
//  NoteDAO.swift
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

class NoteDAO {
    //保存数据列表
    var listData: NSMutableArray!

    static let sharedInstance: NoteDAO = {
        
        let instance = NoteDAO()
        
        //添加一些测试数据
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date1: Date = dateFormatter.date(from: "2017-01-01 16:01:03")!
        let note1: Note = Note(date: date1, content: "Welcome to MyNote.")

        let date2: Date = dateFormatter.date(from: "2017-01-02 8:01:03")!
        let note2: Note = Note(date: date2, content: "欢迎使用MyNote。")

        instance.listData = NSMutableArray()
        instance.listData.add(note1)
        instance.listData.add(note2)

        return instance
    }()


    //插入Note方法
    func create(_ model: Note) -> Int {
        self.listData.add(model)
        return 0
    }

    //删除Note方法
    func remove(_ model: Note) -> Int {
        for note in self.listData {
            let note2 = note as! Note
            //比较日期主键是否相等
            if note2.date == model.date {
                self.listData.remove(note2)
                break
            }
        }
        return 0
    }

    //修改Note方法
    func modify(_ model: Note) -> Int {
        for note in self.listData {
            let note2 = note as! Note
            //比较日期主键是否相等
            if note2.date == model.date {
                note2.content = model.content
                break
            }
        }
        return 0
    }

    //查询所有数据方法
    func findAll() -> NSMutableArray {
        return self.listData
    }

    //按照主键查询数据方法
    func findById(_ model: Note) -> Note? {
        for note in self.listData {
            let note2 = note as! Note
            //比较日期主键是否相等
            if note2.date == model.date {
                return note2
            }
        }
        return nil
    }

}
