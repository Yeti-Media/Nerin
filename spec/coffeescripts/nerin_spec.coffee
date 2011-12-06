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
