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

