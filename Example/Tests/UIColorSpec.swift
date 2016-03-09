import Quick
import Nimble
import UIKit
import swift_lateral_toolbox

class UIColorSpec: QuickSpec {
    
    override func spec() {
    
        describe("creating color from hex number") {

            it("works with color #000000") {
                let reference = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
                let color = UIColor(hex: 0x000000)
                expect(reference).to(equal(color))
            }

            it("works with color #FFFFFF") {
                let reference = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)
                let color = UIColor(hex: 0xFFFFFF)
                expect(reference).to(equal(color))
            }

        }

        describe("extracting components") {
            
            it("works with color #123456 and alpha 78") {
                let reference = UIColor(colorLiteralRed: 0x12/0xFF, green: 0x34/0xFF, blue: 0x56/0xFF, alpha: 0x78/0xFF)
                let c = reference.components
                expect(c.red - 0x12/0xFF).to(beLessThan(0.001))
                expect(c.green - 0x34/0xFF).to(beLessThan(0.001))
                expect(c.blue - 0x56/0xFF).to(beLessThan(0.001))
                expect(c.alpha - 0x78/0xFF).to(beLessThan(0.001))
            }

        }
        
        describe("changing color tones") {

            it("returns a 20% darker color than white") {
                let reference = UIColor(colorLiteralRed: 0.8, green: 0.8, blue: 0.8, alpha: 1)
                let color = UIColor.whiteColor().darker()
                expect(color).to(equal(reference))
            }

            it("returns a 20% brighter color than black") {
                let reference = UIColor(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 1)
                let color = UIColor.blackColor().brighter()
                expect(color).to(equal(reference))
            }

            it("returns white even after trying to make it brighter") {
                let white = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)
                expect(white.brighter()).to(equal(white))
            }

            it("returns black even after trying to make it darker") {
                let black = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
                expect(black.darker()).to(equal(black))
            }

        }
        
        describe("creating an image") {
            
            it("consists of a single pixel") {
                let color   = UIColor(colorLiteralRed: 0.75, green: 0.50, blue: 0.25, alpha: 1)
                var image   : UIImage!
                image = color.toImage()
                expect(image.size.width).to(equal(1))
                expect(image.size.height).to(equal(1))
            }
            
        }
        
    }
    
}
