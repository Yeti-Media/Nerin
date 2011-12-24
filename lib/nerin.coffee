hashMerge = (o, ob) -> 
   i = 0
   for key, value of ob
     o[key] = value
   o

window.Nerin = 

  #UrlHelpers
 
 
  linkTo: (title, href, attributes = {}) ->
    this.contentTag 'a' , title , hashMerge({href: href},attributes)
  
  buttonTo: (title, action , method = 'POST', attributes = {}) ->
    this.formTag action , {method: method}, () =>
    this.inputTag 'submit', 'Commit' , title ,attributes
  
  mailTo: (mail) ->
    this.linkTo mail, "mailto:#{mail}"

    
 
  #FormHelpers
  formTag: (action,attributes = {}, content) ->
    this.contentTag('form', content(), hashMerge({action: action, method: 'POST'},attributes))

  labelTag: (fr, title, attributes = {}) ->
    this.contentTag('label' , title, hashMerge({for: fr}, attributes))

  inputTag: (type, n , value = null, attributes = {}) ->
    this.contentTag 'input', hashMerge({name: n,type: type , value: value},attributes)

  hiddenFieldTag: (n,value = '' , attributes = {}) ->
    this.inputTag 'hidden' , n, value, attributes

  textFieldTag: (n,value = '',attributes = {}) ->
    this.inputTag 'text' , n , value ,attributes

  textAreaTag: (n,value =  '',attributes = {}) -> 
    this.contentTag 'textarea', value , hashMerge({name: n},attributes)

  passwordFieldTag: (n,value = '',attributes = {}) ->
    this.inputTag 'password', n , value, attributes

  fileFieldTag: (n,attributes = {}) -> 
    this.inputTag 'file' , n, '', attributes
  
  checkBoxTag: (n,value = '' ,checked = true, attributes = {}) ->
    attributes = hashMerge(attributes, checked: 'checked') if checked
    this.inputTag 'checkbox',n, value , attributes
  
  radioButtonTag: (n,value = '',checked = true, attributes = {}) ->
    attributes = hashMerge(attributes, checked: 'checked') if checked
    this.inputTag 'radio' , n, value , attributes

  selectTag: (n, options, select_attributes = {}, attributes = {}) ->
    content = ''
    content +=  this.optionTag("","") if select_attributes.include_blank
    content += options 
    this.contentTag 'select' , content , attributes

  optionTag: (title, value) ->
    this.contentTag 'option' , title , {value: value}


  submitTag: (n = 'Commit',value = 'Submit',attributes = {}) ->
    this.inputTag 'submit', n, value, attributes

  #  Source tags
  javascriptTag: (data) ->
    this.contentTag 'script' , data , {type: "text/javascript"}

  stylesheetTag: (data) ->
    this.contentTag 'style' , data , {type: "text/css"}
  
  javascriptIncludeTag: (src) ->
    this.contentTag 'script', '' , {src: src , type: "text/javascript" }

  stylesheetIncludeTag: (src) ->
    this.contentTag 'link' , {rel: "stylesheet" , type: 'text/css'}

  imageTag: (src, attributes = {}) ->
    this.contentTag 'img' , hashMerge({src: src},attributes)


  # core method
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




