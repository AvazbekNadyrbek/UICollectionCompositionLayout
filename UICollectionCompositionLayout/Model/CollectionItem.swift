//
//  CollectionItem.swift
//  UICollectionCompositionLayoutLesson10
//
//  Created by Авазбек Надырбек уулу on 01.06.25.
//

import Foundation

struct CollectionSection: Identifiable {
    var id = UUID()
   // let header: String
    let items: [CollectionItem]
    
    static func mockData() -> [CollectionSection]{
        let storyItem = [
            CollectionItem(image: "story1", name: "Name1"),
            CollectionItem(image: "story2", name: "Name2"),
            CollectionItem(image: "story3", name: "Name3"),
            CollectionItem(image: "story4", name: "Name4"),
            CollectionItem(image: "story5", name: "Name5"),
        ]
        
        let messageItem = [
            CollectionItem(image: "story1", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            CollectionItem(image: "story2", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            CollectionItem(image: "story3", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            CollectionItem(image: "story4", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        ]
        
        let newsItem = [
            CollectionItem(image: "news1", header: "Заголовок1", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            CollectionItem(image: "news2", header: "Заголовок2", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            CollectionItem(image: "news3", header: "Заголовок3", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        ]
        
        let bannerItem = [
            CollectionItem(image: "banner1"),
            CollectionItem(image: "banner2"),
            CollectionItem(image: "banner3"),
        ]
        
        let storySection = CollectionSection(items: storyItem)
        let messageSection = CollectionSection(items: messageItem)
        let newsSection = CollectionSection(items: newsItem)
        let bannerSection = CollectionSection(items: bannerItem)
            
        
        return [storySection, messageSection, newsSection, bannerSection]
    }
}

struct CollectionItem: Identifiable {
    var id = UUID()
    var image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}
