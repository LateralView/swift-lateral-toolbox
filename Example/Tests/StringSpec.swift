import Quick
import Nimble
import swift_lateral_toolbox

class StringSpec: QuickSpec {
    
    override func spec() {

        describe("email address") {
            
            context("invalid email") {
                
                it("fails if empty") {
                    expect("".isValidEmailAddress()) == false
                }
                
                it("fails if domain is missing") {
                    expect("name@domain".isValidEmailAddress()) == false
                }
                
                it("fails if user is missing") {
                    expect("@domain.com".isValidEmailAddress()) == false
                }
                
                it("fails if contains invalid characters") {
                    expect("@domain.com".isValidEmailAddress()) == false
                }
                
            }
            
            context("valid email") {
                
                it("passes with standard case") {
                    expect("name@domain.com".isValidEmailAddress()) == true
                }
                
                it("passes if contains dots, dashes or underscores") {
                    expect("my.name-last_name@domain.com".isValidEmailAddress()) == true
                }
                
            }
        
        }
        
    }
    
}
