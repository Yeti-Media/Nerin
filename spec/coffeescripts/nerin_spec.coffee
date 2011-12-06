describe "Nerin", () =>
   
 
  describe ".contentTag", () =>
   
    it "should return a closed tag when there is no content", () =>
      expect(Nerin.contentTag('br')).toEqual "<br />"

    it "should return a tag with content" , () => 
      expect(Nerin.contentTag('p' , 'content example')).toEqual "<p>content example</p>"

    it "should return a tag with attributes" , () =>
      expect(Nerin.contentTag('br',{class: 'clear'})).toEqual "<br class=\"clear\" />"
    
    it "should return a tag with content passed as a function" , () =>
      expect(Nerin.contentTag('a',{href: 'http://example.com'},() => "content inside")).toEqual "<a href=\"http://example.com\">content inside</a>"
  
  describe "Url Helpers", () =>
  
    describe ".linkTo", () =>
      it "should return a link with content, with href and class attribute" , () =>
        result = Nerin.linkTo 'content', "/path" , {class: 'class'} 
        expect(result).toMatch ///<a.*>.*</a>///
        expect(result).toMatch ///href=\"/path\"///
        expect(result).toMatch ///class=\"class\"///
        expect(result).toMatch ///>content<///

    describe ".mailTo", () =>
      it "should return a link referenced to a mail" , () =>
        result = Nerin.mailTo 'nsanta@yeti-media.com'
        expect(result).toMatch ///<a.*>.*</a>///
        expect(result).toMatch ///href=\"mailto:nsanta@yeti-media.com"///
        expect(result).toMatch ///>nsanta@yeti-media.com<///
    
    describe ".buttonTo" , () =>
      it "should return a submit button in a form" , () =>
        result = Nerin.buttonTo 'title' , '/path' , 'GET' , {class: 'class'} 
        expect(result).toMatch ///^<form.*action=\"/path\"///
        expect(result).toMatch ///^<form.*>.*<input.*type=\"submit\".*/>.*</form>$///
        expect(result).toMatch ///^<form.*>.*<input.*value=\"title\".*/>.*</form>$///
        expect(result).toMatch ///^<form.*>.*<input.*class=\"class\".*/>.*</form>$///

  describe "FormHelpers" , () =>
    describe ".formTag", () =>
      it "should return a form with action and content inside" , () =>
        result = Nerin.formTag '/path' , {method: 'POST'} , () => 'content'
        expect(result).toMatch ///^<form.*>.*</form>$///
        expect(result).toMatch ///^<form.*action=\"/path\".*>.*</form>$///
        expect(result).toMatch ///^<form.*method=\"POST\".*>.*</form>$///
        expect(result).toMatch ///^<form.*>content</form>$///

    describe ".labelTag" , () =>
      it "should return a label tag with for attribute and content" , () =>
        result = Nerin.labelTag 'for' , 'content'
        expect(result).toMatch ///^<label.*>.*</label>$///
        expect(result).toMatch ///^<label.*for=\"for\">.*</label>$///
        expect(result).toMatch ///^<label.*>content</label>$///

    describe ".inputTag" , () =>
      it "should return an input with type and value", () =>
        result = Nerin.inputTag 'text' ,'name', 'value'
        expect(result).toMatch ///^<input.*/>$///
        expect(result).toMatch ///^<input.*type=\"text\".*/>$///
        expect(result).toMatch ///^<input.*value=\"value\".*/>$///
        expect(result).toMatch ///^<input.*name=\"name\".*/>$///


