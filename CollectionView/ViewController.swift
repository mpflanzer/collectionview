//
//  ViewController.swift
//  CollectionView
//
//  Created by Moritz Pflanzer on 31.08.18.
//  Copyright © 2018 Moritz Pflanzer. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout, NSCollectionViewDelegate {
    let data = [0: ["One", "Two", "Three", "Four", "Five"], 1: ["Foo", "Bar", "Foobar"]]
    @IBOutlet var collectionView: NSCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let itemNib = NSNib(nibNamed: NSNib.Name(rawValue: "CollectionViewItem"), bundle: nil)
        self.collectionView.register(itemNib, forItemWithIdentifier: NSUserInterfaceItemIdentifier("CollectionViewItem"))

        let headerNib = NSNib(nibNamed: NSNib.Name(rawValue: "CollectionViewHeader"), bundle: nil)
        self.collectionView.register(headerNib, forSupplementaryViewOfKind: NSCollectionView.SupplementaryElementKind.sectionHeader, withIdentifier: NSUserInterfaceItemIdentifier("CollectionViewHeader"))
    }

    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data[section]?.count ?? 0
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        // Recycle or create an item.
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath)

        item.textField!.stringValue = self.data[indexPath.section]?[indexPath.item] ?? "No name"

        return item
    }

    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        switch kind {
        case .sectionHeader:
            let view = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier("CollectionViewHeader"), for: indexPath) as! CollectionViewHeader
            view.sectionCollapseButton?.target = collectionView
            view.sectionCollapseButton?.action = #selector((NSCollectionView.toggleSectionCollapse))

            view.label.stringValue = String(indexPath.section)

            return view
        default:
            fatalError("Unsupported supplementary view")
        }
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSMakeSize(160, 120)
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSMakeSize(0, 30)
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSZeroSize
    }
}
