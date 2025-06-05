//
//  CellPtotocol.swift
//  UICollectionCompositionLayout
//
//  Created by Авазбек Надырбек уулу on 05.06.25.
//


protocol CellPtotocol {
    static var reuseIdentifier: String { get }
    func setUpCell(item: CollectionItem)
}
