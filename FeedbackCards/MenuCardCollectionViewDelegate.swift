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

class MenuCardCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {

    let itemSize = CGSize(width: 80, height: 100)
    let minimumLineSpacing = CGFloat(10.0)
    let minimumInteritemSpacing = CGFloat(10.0)
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView.traitCollection.verticalSizeClass == .regular {
         
            return UIEdgeInsetsMake(0, 0, 0, 0)
        }
        
        let collectionViewWidth = collectionView.bounds.width
        let cellCount = CGFloat(CardDeck.cards.count)
        let totalCellWidth = itemSize.width * cellCount
        let totalSpacingWidth = minimumLineSpacing * (cellCount - 1)
        let leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
        let rightInset = leftInset
        
        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCardCollectionViewCell
        
        // rect for transition start is the selected cell and it
        // must be cliped if cell is not fully visible:
        /*
        let width = (collectionView.frame.size.width < cell.frame.origin.x + cell.frame.size.width) ?
            collectionView.frame.size.width - cell.frame.origin.x : cell.frame.size.width
        
        transitionStartRect = CGRect(
            x: collectionView.frame.origin.x + cell.frame.origin.x,
            y: collectionView.frame.origin.y + cell.frame.origin.y,
            width: width,
            height: cell.frame.size.height
        )
        */
        
        // set the current tapped Card to the current
        let _ = CardDeck.index(fromCard: cell.card)

        //
        let presentingController = collectionView.parentViewController
        let pageViewController = StoryboardHelper.controller("CardPageViewController") as! CardPageViewController
        
        presentingController?.present(pageViewController, animated: true, completion: {

            
        })
    }
}
