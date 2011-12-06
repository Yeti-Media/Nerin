(function() {
  var hashMerge;

  hashMerge = function(o, ob) {
    var i, key, value;
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
      return this.contentTag('a', title, hashMerge({
        href: href
      }, attributes));
    },
    buttonTo: function(action, method, attributes) {
      if (attributes == null) attributes = {};
      this.formTag(action, {
        method: method
      }, function() {});
      return this.inputTag('submit', attributes);
    },
    mailTo: function(mail) {
      return this.linkTo(mail, "mailto:" + mail);
    },
    imageTag: function(src, attributes) {
      if (attributes == null) attributes = {};
      return this.contentTag('img', hashMerge({
        src: src
      }, attributes));
    },
    formTag: function(action, attributes, content) {
      if (attributes == null) attributes = {};
      return this.contentTag('form', content(), hashMerge({
        method: 'POST'
      }, attributes));
    },
    labelTag: function(fr, title, attributes) {
      if (attributes == null) attributes = {};
      return this.contentTag('label', title, hashMerge({
        "for": fr
      }, attributes));
    },
    inputTag: function(type, value, attributes) {
      if (value == null) value = null;
      if (attributes == null) attributes = {};
      return this.contentTag('input', hashMerge({
        type: type,
        value: value
      }, attributes));
    },
    textFieldTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return this.inputTag('text', hashMerge({
        name: name,
        value: value
      }, attributes));
    },
    textAreaTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return this.contentTag('textarea', value, hashMerge({
        name: n
      }, attributes));
    },
    passwordFieldTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return this.inputTag('password', hashMerge({
        name: n,
        value: value
      }, attributes));
    },
    fileFieldTag: function(n, value, attributes) {
      if (attributes == null) attributes = {};
      return this.inputTag('file', hashMerge({
        name: n,
        value: value
      }, attributes));
    },
    checkBoxTag: function(n, value, checked, attributes) {
      var attrs;
      if (checked == null) checked = true;
      if (attributes == null) attributes = {};
      attrs = {
        value: value,
        name: n
      };
      if (checked) {
        attrs = hashMerge(attrs, {
          checked: 'checked'
        });
      }
      return this.inputTag('checkbox', hashMerge(attrs, attributes));
    },
    radioButtonTag: function(n, value, checked, attributes) {
      var attrs;
      if (checked == null) checked = true;
      if (attributes == null) attributes = {};
      attrs = {
        value: value,
        name: n
      };
      if (checked) {
        attrs = hashMerge(attrs, {
          checked: 'checked'
        });
      }
      return this.inputTag;
    },
    selectTag: function(n, options, select_attributes, attributes) {
      var content;
      if (select_attributes == null) select_attributes = {};
      if (attributes == null) attributes = {};
      content = '';
      if (select_attributes.include_blank) content += this.optionTag("", "");
      content += options;
      return this.contentTag('select', content, attributes);
    },
    optionTag: function(title, value) {
      return this.contentTag('option', title, {
        value: value
      });
    },
    submitTag: function(n, value, attributes) {
      if (n == null) n = 'Commit';
      if (value == null) value = 'Submit';
      if (attributes == null) attributes = {};
      return this.inputTag('submit', hashMerge({
        name: n,
        value: value
      }, attributes));
    },
    javascriptTag: function(data) {
      return this.contentTag('script', data, {
        type: "text/javascript"
      });
    },
    stylesheetTag: function(data) {
      return this.contentTag('style', data, {
        type: "text/css"
      });
    },
    javascriptIncludeTag: function(src) {
      return this.contentTag('script', '', {
        src: src,
        type: "text/javascript"
      });
    },
    stylesheetIncludeTag: function(src) {
      return this.contentTag('link', {
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
        return output += " />";
      } else {
        return output += ">" + innerHTML + "</" + tag + ">";
      }
    }
  };

  output;

}).call(this);
