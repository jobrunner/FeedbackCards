// Copyright (c) 2017 Jo Brunner
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

struct Card {
    
    let id: Int
    let cardType: CardType
    let name: String
    let shortCut: String
    let image: String
    let description: String
    let helpText: String
    let colorCode: UIColor
}

extension Card {

    static func colorFrom(hexCode: String) -> UIColor {
        
        let scanner: Scanner = Scanner(string: hexCode)
        scanner.scanLocation = 1
        
        var rgbValue: UInt32 = 0
        scanner.scanHexInt32(&rgbValue)
        
        let red: CGFloat = CGFloat((Int(rgbValue) & 0xff0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((Int(rgbValue) & 0xff00) >> 8) / 255.0
        let blue: CGFloat = CGFloat((Int(rgbValue) & 0xff) >> 0) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

struct CardDataOptions {
    
    let showAbstentionCard: Bool
    let useNumericLevelShortCuts: Bool
    
    init() {
        showAbstentionCard = UserDefaults.standard.bool(forKey: "showAbstentionCard")
        useNumericLevelShortCuts = UserDefaults.standard.bool(forKey: "useNumericLevelShortCuts")
    }
}

struct CardDataProvider {

    fileprivate static var arr: [Card] = []

    fileprivate static func reset() {
        
        CardDataProvider.arr = []
    }
    
    func cards() -> [Card] {
        
        if CardDataProvider.arr.count > 0 {

            return CardDataProvider.arr
        }
        
        let options = CardDataOptions()

        if options.showAbstentionCard {
        
            CardDataProvider.arr.append(
                Card(
                    id: 1,
                    cardType: .enthaltung,
                    name: NSLocalizedString("Enthaltung", comment: "Name of card"),
                    shortCut: options.useNumericLevelShortCuts ? "?" : NSLocalizedString("?", comment: "Shortcut of card"),
                    image: "enthaltung",
                    description: NSLocalizedString("Ich kann oder will kein Fremdbild dazu abgeben.", comment: "Description of card"),
                    helpText:NSLocalizedString("", comment: "Helptext of card"),
                    colorCode: Card.colorFrom(hexCode: "#aaaaaa")
                )
            )
        }
        
        CardDataProvider.arr.append(
            Card(
                id: 2,
                cardType: .zuschauer,
                name: NSLocalizedString("Zuschauer", comment: "Name of card"),
                shortCut: options.useNumericLevelShortCuts ? "1" : NSLocalizedString("Z", comment: "Shortcut of card"),
                image: "zuschauer",
                description: NSLocalizedString("Es gibt keine Beispiele,\nda ehr in anderen Bereichen enganiert.", comment: "Description of card"),
                helpText:NSLocalizedString("", comment: "Helptext of card"),
                colorCode: Card.colorFrom(hexCode: "#c89331")
            )
        )
        
        CardDataProvider.arr.append(
            Card(
                id: 3,
                cardType: .padawan,
                name: NSLocalizedString("Padawan", comment: "Name of card"),
                shortCut: options.useNumericLevelShortCuts ? "2" : NSLocalizedString("P", comment: "Shortcut of card"),
                image: "padawan",
                description: "Es gibt keine Beispiele,\naber Bemühungen in diesem Bereich.",
                helpText:NSLocalizedString("", comment: "Helptext of card"),
                colorCode: Card.colorFrom(hexCode: "#6589ae")
            )
        )
    
        CardDataProvider.arr.append(
            
            Card(
                id: 4,
                cardType: .mitspieler,
                name: NSLocalizedString("Mitspieler", comment: "Name of card"),
                shortCut: options.useNumericLevelShortCuts ? "3" : NSLocalizedString("S", comment: "Shortcut of card"),
                image: "mitspieler",
                description: NSLocalizedString("Es gibt einzelne Beispiele,\ndie einigen Leuten bekannt sind.", comment: "Description of card"),
                helpText:NSLocalizedString("", comment: "Helptext of card"),
                colorCode: Card.colorFrom(hexCode: "#c46651")
            )
        )

        CardDataProvider.arr.append(
            Card(
                id: 5,
                cardType: .macher,
                name: NSLocalizedString("Macher", comment: "Name of card"),
                shortCut: options.useNumericLevelShortCuts ? "4" : NSLocalizedString("M", comment: "Shortcut of card"),
                image: "macher",
                description: NSLocalizedString("Track-Record ist vorhanden.\nEs gibt viele Beispiele, die man nennen kann.", comment: "Description of card"),
                helpText:NSLocalizedString("", comment: "Helptext of card"),
                colorCode: Card.colorFrom(hexCode: "#7a579d")
            )
        )
        
        CardDataProvider.arr.append(
            Card(
                id: 6,
                cardType: .vorbild,
                name: NSLocalizedString("Vorbild", comment: "Name of card"),
                shortCut: options.useNumericLevelShortCuts ? "5" : NSLocalizedString("V", comment: "Shortcut of card"),
                image: "vorbild",
                description: NSLocalizedString("Track-Record ist vorhanden.\nEs gibt viele Beispiele, die man nennen kann.\nAndere wurden von diesem Vorbild inspiriert.", comment: "Description of card"),
                helpText:NSLocalizedString("", comment: "Helptext of card"),
                colorCode: Card.colorFrom(hexCode: "#669374")
            )
        )
        
        return CardDataProvider.arr
    }
}

class CardDeck {

    var index: Int = 0

    static var cards: [Card] {
        
        get {
    
            return CardDataProvider().cards()
        }
    }
    
    static func reset() {
        
        CardDataProvider.reset()
    }
    
    static let sharedInstance : CardDeck = {

        let instance = CardDeck()

        return instance
    }()

    var card: Card {
        get {
            return self._card()
        }
    }
    
    static var card: Card {
        get {
            return self.sharedInstance._card()
        }
    }
    
    var next: CardDeck {
        get {
            return self._next()
        }
    }

    static var next: CardDeck {
        get {
            return self.sharedInstance._next()
        }
    }

    var prev: CardDeck {
        get {
            return self._prev()
        }
    }

    static var prev: CardDeck {
        get {
            return self.sharedInstance._prev()
        }
    }
    
    static func card(atIndex index: Int) -> Card {
    
        return self.sharedInstance.card(atIndex: index)
    }
    
    static func index(_ index: Int) -> CardDeck {
    
        return self.sharedInstance._index(index)
    }
    
    static func index(fromCard card: Card) -> CardDeck {
    
        return self.sharedInstance._index(fromCard: card)
    }

    func card(atIndex index: Int) -> Card {
        
        return CardDeck.cards[index]
    }
    
    var current: CardDeck {
        get {
            return self._current()
        }
    }
    
    static var current: CardDeck {
        get {
            return self.sharedInstance._current()
        }
    }
    
    
    // private instance methods
    
    fileprivate func _card() -> Card {
        
        return CardDeck.cards[index]
    }
    
    fileprivate func _next() -> CardDeck {

        index = (index >= 0) ? (index + 1) % CardDeck.cards.count : 0
        
        return self
    }

    fileprivate func _prev() -> CardDeck {

        index = (index > 0) ? (index - 1) % CardDeck.cards.count : CardDeck.cards.count - 1

        return self
    }

    fileprivate func _current() -> CardDeck {
        
        return self
    }
    
    fileprivate func _index(_ index: Int) -> CardDeck {

        self.index = index
        
        return self
    }
    
    fileprivate func _index(fromCard card: Card) -> CardDeck {
        
        if let index = CardDeck.cards.index(where: {$0.id == card.id}) {
        
            self.index = index
        }

        return self
    }
}
