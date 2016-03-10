import Quick
import Nimble
import swift_lateral_toolbox

class NSDateSpec: QuickSpec {
    
    override func spec() {
        
        describe("adding time") {
            
            var df: NSDateFormatter!
            
            beforeEach({ () -> () in
                df = NSDateFormatter()
                df.dateFormat = "yyyy-MM-dd"
            })
            
            it("adds two years") {
                let twoYearsAfter  = df.dateFromString("2002-02-28")!
                let date = df.dateFromString("2000-02-29")!.dateByAdding(years: 2)!
                expect(date).to(equal(twoYearsAfter))
            }

            it("substracts four years") {
                let fourYearsBefore  = df.dateFromString("1996-02-29")!
                let date = df.dateFromString("2000-02-29")!.dateByAdding(years: -4)!
                expect(date).to(equal(fourYearsBefore))
            }

            it("adds a day, a month and a year") {
                let future  = df.dateFromString("2051-03-21")!
                let date = df.dateFromString("2050-02-20")!.dateByAdding(1, months: 1, years: 1)!
                expect(date).to(equal(future))
            }

        }
        
    }
    
}
