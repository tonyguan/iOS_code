//
//  AddViewController.swift
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

import UIKit

class AddViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtView: UITextView!
    //业务逻辑对象BL
    var bl = NoteBL()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtView.delegate = self
        self.txtView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onclickSave(_ sender: AnyObject) {

        let note = Note()
        note.date = Date()
        note.content = self.txtView.text
        let reslist = bl.create(note)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "reloadViewNotification"), object: reslist, userInfo: nil)
        self.txtView.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)

    }

    @IBAction func onclickCancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}
