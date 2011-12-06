hashMerge = (o, ob) -> 
   i = 0
   for key, value of ob
     o[key] = value
   o

window.Nerin = 

  #UrlHelpers
  linkTo: (title, href, attributes = {}) ->
    this.contentTag 'a' , title , hashMerge({href: href},attributes)
  
  buttonTo: (action , method, attributes = {}) ->
    this.formTag action , {method: method}, () ->
      this.inputTag 'submit' , attributes
  
  mailTo: (mail) ->
    this.linkTo mail, "mailto:#{mail}"

  #AssetHelpers
  imageTag: (src, attributes = {}) ->
    this.contentTag 'img' , hashMerge({src: src},attributes)
    
 
  #FormHelpers
  formTag: (action,attributes = {}, content) ->
    this.contentTag('form', content(), hashMerge({method: 'POST'},attributes))

  inputTag: (type , value = null, attributes = {}) ->
    this.contentTag 'input', hashMerge({type: type , value: value},attributes)

  textFieldTag: (n,value,attributes = {}) ->
    this.inputTag 'text' , hashMerge({name: name, value: value},attributes)

  textAreaTag: (n,value,attributes = {}) -> 
    this.contentTag 'textarea', value , hashMerge({name: n},attributes)

  passwordFieldTag: (n,value,attributes = {}) ->
    this.inputTag 'password' , hashMerge({name: n, value: value}, attributes)

  fileFieldTag: (n,value,attributes = {}) -> 
    this.inputTag 'file' , hashMerge({name: n, value: value}, attributes)

  submitTag: (n = 'Commit',value = 'Submit',attributes = {}) ->
    this.inputTag 'submit', hashMerge({name: n, value: value}, attributes)

  #  Source tags
  javascriptTag: (data) ->
    this.contentTag 'script' , data , {type: "text/javascript"}

  stylesheetTag: (data) ->
    this.contentTag 'style' , data , {type: "text/css"}
  
  javascriptIncludeTag: (src) ->
    this.contentTag 'script', '' , {src: src , type: "text/javascript" }

  stylesheetIncludeTag: (src) ->
    this.contentTag 'link' , {rel: "stylesheet" , type: 'text/css'}

  contentTag: (tag, args1 = null, args2 = null ) ->
     output = "<#{tag}"
     if args1? && args1.constructor == Object
       attributes = args1 if args1 isnt null
       innerHTML = args2() if args2 isnt null 
     else
       attributes = args2
       innerHTML = args1
     attributes ||= {}
     output += for key, value of attributes
        " #{key}=\"#{value}\""
     if !innerHTML   
       output += " />"
     else
       output += ">#{innerHTML}</#{tag}>"
     output




