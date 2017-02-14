//
//  LyricsGenerator.swift
//  SillySong
//
//  Created by Boxuan Zhang on 2/13/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import Foundation

class LyricsGenerator {

    static let shared = LyricsGenerator()
   
    func lyrics(for fullName: String,
                withTemplate lyricsTempalte: String = Template.bananaFanaTemplate) -> String {
      
        let shortName = self.shortName(from: fullName)
        return lyricsTempalte.replacingOccurrences(of: TemplatePlaceHolder.fullName.rawValue, with: fullName)
                            .replacingOccurrences(of: TemplatePlaceHolder.shortName.rawValue, with: shortName)
    }
    
    private func shortName(from fullName: String) -> String {
        let lowercasedName = fullName.lowercased()
        let foldingName = lowercasedName.folding(options: .diacriticInsensitive, locale: .current)
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        
        if let range = foldingName.rangeOfCharacter(from: vowelSet) {
            return lowercasedName.substring(from: range.lowerBound)
        } else {
            return lowercasedName     // for non-vowel name, return original lowercased name
        }
    }
}

extension LyricsGenerator {
    fileprivate enum TemplatePlaceHolder: String {
        case fullName = "<FULL_NAME>"
        case shortName = "<SHORT_NAME>"
    }
    
    struct Template {
        private init() {}
        
        static let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"
        ].joined(separator: "\n")
    }
}
