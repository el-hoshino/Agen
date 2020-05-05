//
//  Pasteboard.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Cocoa

extension NSPasteboard {
    
    public func replacePasteboardItem(with text: String) {
        
        clearContents()
        
        let item = NSPasteboardItem()
        item.setString(text, forType: .string)
        writeObjects([item])
        
    }
    
}
