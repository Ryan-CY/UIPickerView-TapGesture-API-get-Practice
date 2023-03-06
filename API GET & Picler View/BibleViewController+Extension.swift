//
//  BibleViewController+Extension.swift
//  API GET & Picler View
//
//  Created by Ryan Lin on 2023/3/5.
//

import Foundation
import UIKit

extension BibleViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
           return bibles.count
        } else if component == 1 {
            let bookRow = pickerView.selectedRow(inComponent: 0)
            return bibles[bookRow].chapters.count
        } else if component == 2 {
            let bookRow = pickerView.selectedRow(inComponent: 0)
            let chapterRow = pickerView.selectedRow(inComponent: 1)
            return bibles[bookRow].chapters[chapterRow].verses.count
        } else {
            return translation.count
        }
    }
}

extension BibleViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return bibles[row].bookName
        } else if component == 1 {
            let bookRow = pickerView.selectedRow(inComponent: 0)
            return bibles[bookRow].chapters[row].chapterNo
        } else if component == 2 {
            let bookRow = pickerView.selectedRow(inComponent: 0)
            let chapterRow = pickerView.selectedRow(inComponent: 1)
            return bibles[bookRow].chapters[chapterRow].verses[row]
        } else {
            return translation[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if component == 0 {
            pickerView.selectRow(6, inComponent: 1, animated: true)
            pickerView.selectRow(13, inComponent: 2, animated: true)
        } else if component == 1 {
            pickerView.selectRow(13, inComponent: 2, animated: true)
        }
        pickerView.reloadAllComponents()
        
        let bookRow = pickerView.selectedRow(inComponent: 0)
        let chapterRow = pickerView.selectedRow(inComponent: 1)
        let verseRow = pickerView.selectedRow(inComponent: 2)
        let translationRow = pickerView.selectedRow(inComponent: 3)
        
        let bookName = bibles[bookRow].bookName
        let chapter = bibles[bookRow].chapters[chapterRow].chapterNo
        let verse = bibles[bookRow].chapters[chapterRow].verses[verseRow]
        let translationVersion = translation[translationRow]
        
        self.bookName = bookName
        self.chapter = chapter
        self.verse = verse
        self.translationVersion = translationVersion
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 120
        } else if component == 1, component == 2 {
            return 30
        } else {
            return 70
        }
    }
}
