
  Object.prototype.merge = function(ob) {
    var i, key, o, value;
    o = this;
    i = 0;
    for (key in ob) {
      value = ob[key];
      o[key] = value;
    }
    return o;
  };

  window.Nerin = {
    linkTo: function(title, href, attributes) {
      if (attributes == null) attributes = {};
      return contentTag('a', title, attributes.merge({
        href: href
      }));
    },
    buttonTo: function(action, method, attributes) {
      if (attributes == null) attributes = {};
      return formTag(action, {
        method: method
      }, function() {
        return inputTag('submit', attributes);
      });
    },
    mailTo: function(mail) {
      return link_to(mail, "mailto:" + mail);
    },
    imageTag: function(src, attributes) {
      if (attributes == null) attributes = {};
      return contentTag('img', attributes.merge({
        src: src
      }));
    },
    formTag: function(action, attributes, content) {
      if (attributes == null) attributes = {};
      return contentTag('form', content(), {
        method: 'POST'
      }.merge(attributes));
    },
    inputTag: function(type, value, attributes) {
      if (value == null) value = null;
      if (attributes == null) attributes = {};
      return contentTag('input', {
        type: type,
        value: value
      }.merge(attributes));
    },
    textFieldTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return inputTag('text', {
        name: name,
        value: value
      }.merge(attributes));
    },
    textAreaTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return contentTag('textarea', value, {
        name: n
      }.merge(attributes));
    },
    passwordFieldTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return inputTag('password', {
        name: n,
        value: value
      }.merge(attributes));
    },
    fileFieldTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return inputTag('file', {
        name: n,
        value: value
      }.merge(attributes));
    },
    submitTag: function(n, value, attributes) {
      if (n == null) n = 'Commit';
      if (value == null) value = 'Submit';
      if (attributes == null) attributes = {};
      return inputTag('submit', {
        name: n,
        value: value
      }.merge(attributes));
    },
    javascriptTag: function(data) {
      return contentTag('script', data, {
        type: "text/javascript"
      });
    },
    stylesheetTag: function(data) {
      return contentTag('style', data, {
        type: "text/css"
      });
    },
    javascriptIncludeTag: function(src) {
      return contentTag('script', '', {
        src: src,
        type: "text/javascript"
      });
    },
    stylesheetIncludeTag: function(src) {
      return contentTag('link', {
        rel: "stylesheet",
        type: 'text/css'
      });
    },
    contentTag: function(tag, args1, args2) {
      var attributes, innerHTML, key, output, value;
      if (args1 == null) args1 = null;
      if (args2 == null) args2 = null;
      output = "<" + tag;
      if ((args1 != null) && args1.constructor === Object) {
        if (args1 !== null) attributes = args1;
        if (args2 !== null) innerHTML = args2();
      } else {
        attributes = args2;
        innerHTML = args1;
      }
      attributes || (attributes = {});
      output += (function() {
        var _results;
        _results = [];
        for (key in attributes) {
          value = attributes[key];
          _results.push(" " + key + "=\"" + value + "\"");
        }
        return _results;
      })();
      if (!innerHTML) {
        output += " />";
      } else {
        output += ">" + innerHTML + "</" + tag + ">";
      }
      return output;
    }
  };
