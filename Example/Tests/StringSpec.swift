import Quick
import Nimble
import swift_lateral_toolbox

class StringSpec: QuickSpec {
    
    override func spec() {

        describe("url encoding") {
            
            let encodedText = "%C2%A1Hola!%20%C2%BFC%C3%B3mo%20te%20va%3F"
            let decodedText = "¡Hola! ¿Cómo te va?"
            
            it("decodes successfully") {
                if let text = encodedText.URLDecode {
                    expect(text).to(equal(decodedText))
                } else {
                    fail()
                }
            }

            it("encodes successfully") {
                if let text = decodedText.URLEncode {
                    expect(text).to(equal(encodedText))
                } else {
                    fail()
                }
            }

        }

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
