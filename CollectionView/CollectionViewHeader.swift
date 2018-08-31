//
//  CollectionViewHeader.swift
//  CollectionView
//
//  Created by Moritz Pflanzer on 31.08.18.
//  Copyright © 2018 Moritz Pflanzer. All rights reserved.
//

import Cocoa

class CollectionViewHeader: NSView, NSCollectionViewSectionHeaderView {
    @IBOutlet weak var sectionCollapseButton: NSButton?
    @IBOutlet weak var label: NSTextField!

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
