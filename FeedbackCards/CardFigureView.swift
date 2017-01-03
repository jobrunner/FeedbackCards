// Copyright (c) 2016, 2017 Jo Brunner
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

@IBDesignable
class CardFigureView: UIView {

    @IBInspectable
    var cardType: CardType = .design {
        
        didSet {
            setNeedsLayout()
        }
        
    }

    override func draw(_ rect: CGRect) {

        switch cardType {
        case .design, .enthaltung:
            Graphics.drawEnthalter2(frame: rect, resizing: .aspectFit)
        
        case .zuschauer:
            Graphics.drawZuschauer2(frame: rect, resizing: .aspectFit)
        
        case .padawan:
            Graphics.drawPadawan2(frame: rect, resizing: .aspectFit)
        
        case .mitspieler:
            Graphics.drawMitspieler2(frame: rect, resizing: .aspectFit)
        
        case .macher:
            Graphics.drawMacher2(frame: rect, resizing: .aspectFit)
        
        case .vorbild:
            Graphics.drawVorbild2(frame: rect, resizing: .aspectFit)
        }
    }
}
