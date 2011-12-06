Object::merge = (ob) -> 
   o = this
   i = 0
   for key, value of ob
     o[key] = value
   return o

window.Nerin = 

  #UrlHelpers
  linkTo: (title, href, attributes = {}) ->
    contentTag 'a' , title , attributes.merge(href: href)
  
  buttonTo: (action , method, attributes = {}) ->
    formTag action , {method: method}, () ->
      inputTag 'submit' , attributes
  
  mailTo: (mail) ->
    link_to mail, "mailto:#{mail}"

  #AssetHelpers
  imageTag: (src, attributes = {}) ->
    contentTag 'img' , attributes.merge(src: src)
    
 
  #FormHelpers
  formTag: (action,attributes = {}, content) ->
    contentTag('form', content(), {method: 'POST'}.merge(attributes))

  inputTag: (type , value = null, attributes = {}) ->
    contentTag 'input', {type: type , value: value}.merge(attributes)

  textFieldTag: (n,value,attributes = {}) ->
    inputTag 'text' , {name: name, value: value}.merge(attributes)

  textAreaTag: (n,value,attributes = {}) -> 
    contentTag 'textarea', value , {name: n}.merge(attributes)

  passwordFieldTag: (n,value,attributes = {}) ->
    inputTag 'password' , {name: n, value: value}.merge(attributes)

  fileFieldTag: (n,value,attributes = {}) -> 
    inputTag 'file' , {name: n, value: value}.merge(attributes)

  submitTag: (n = 'Commit',value = 'Submit',attributes = {}) ->
    inputTag 'submit', {name: n, value: value}.merge(attributes)

  #  Source tags
  javascriptTag: (data) ->
    contentTag 'script' , data , {type: "text/javascript"}

  stylesheetTag: (data) ->
    contentTag 'style' , data , {type: "text/css"}
  
  javascriptIncludeTag: (src) ->
    contentTag 'script', '' , {src: src , type: "text/javascript" }

  stylesheetIncludeTag: (src) ->
    contentTag 'link' , {rel: "stylesheet" , type: 'text/css'}

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




