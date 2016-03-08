import Quick
import Nimble
import swift_lateral_toolbox

class String: QuickSpec {
    
    override func spec() {

        context("email address") {
            
            describe("should fail") {
                
                it("empty email") {
                    expect("".isValidEmailAddress()) == false
                }
                
                it("email without domain") {
                    expect("name@domain".isValidEmailAddress()) == false
                }
                
                it("email without user") {
                    expect("@domain.com".isValidEmailAddress()) == false
                }
                
                it("email with invalid characters") {
                    expect("@domain.com".isValidEmailAddress()) == false
                }
                
            }
            
            describe("should pass") {
                
                it("valid email") {
                    expect("name@domain.com".isValidEmailAddress()) == true
                }
                
                it("email with dots, dashes and underscores") {
                    expect("my.name-last_name@domain.com".isValidEmailAddress()) == true
                }
                
            }
        
        }
        
    }
    
}
