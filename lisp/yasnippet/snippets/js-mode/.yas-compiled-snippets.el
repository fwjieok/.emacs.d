;;; Compiled snippets and support files for `js-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("assert" "assert.${1:equal}($0);\n" "assert" nil nil nil nil nil nil)
                       ("att" "attr(${1:item})$0" "jQuery Attr()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("fun" "// $1\n${2:attribute}: function (${3:args}) {\n    $0\n}" "attr: function" nil nil nil nil nil nil)
                       ("cb" "function(error, $1){\n$0\n}\n" "cb" nil nil nil nil nil nil)
                       ("cha" "change(function(){\n    $0\n});" "jQuery change()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("cha" "change(function(){\n  $0\n});" "jQuery change()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("chi" "children( ${1:item} )$0" "Children" nil
                        ("jquery")
                        nil nil nil nil)
                       ("click" "click( function(){\n    $0\n});" "jQuery Click" nil
                        ("jquery")
                        nil nil nil nil)
                       ("jsdoc" "\n/**\n * \n */\n\n" "jsdoc" nil nil nil nil nil nil)
                       ("desc" "\ndescribe('${1:Spec}', function (){\n    $0\n});" "Jasmine describe" nil
                        ("Jasmine")
                        nil nil nil nil)
                       ("desc" "describe('$1', function(){\n$2\n});\n" "desc" nil nil nil nil nil nil)
                       ("doc" "// ${1:Title}\n//\n// $2" "Docblock" nil nil nil nil nil nil)
                       ("eac" "$.each(${1:an-array}, function(i){\n    $0\n});" "jQuery each()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("email" "`(replace-regexp-in-string \"@\" \"@NOSPAM.\" user-mail-address)`" "(user's email)" nil nil nil nil nil nil)
                       ("err" "if(${1:error}){\n  callback($1);\n  return;\n}\n$2\n" "err" nil nil nil nil nil nil)
                       ("error" "if(${1:error}){\n  callback($1);\n  return;\n}\n$2\n" "error" nil nil nil nil nil nil)
                       ("exca" "expect(${1:callable}).toHaveBeenCalledWith(${2:expected});$0\n" "Jasmine expect CalledWith" nil
                        ("Jasmine")
                        nil nil nil nil)
                       ("exeq" "expect(${1:attribute}).toEqual(${2:expected});$0\n" "Jasmine expect Equal" nil
                        ("Jasmine")
                        nil nil nil nil)
                       ("expect" "expect($1).to.${2:equal}($3);\n$0" "expect" nil nil nil nil nil nil)
                       ("exports" "module.exports = {\n$0\n};\n" "exports" nil nil nil nil nil nil)
                       ("ext" "_.extend(${1:Target}, {\n    $0\n});" "_.extend" nil
                        ("_")
                        nil nil nil nil)
                       ("extru" "expect(${1:true}).toBeTruthy();\n$0" "Jasmine expect Truthy" nil
                        ("Jasmine")
                        nil nil nil nil)
                       ("fn" "function$1($2){\n$0\n}\n" "fn" nil nil nil nil nil nil)
                       ("for" "for( var i=0; i < ${1:something}.${2:length}; i++){\n    $0\n}" "for" nil nil nil nil nil nil)
                       ("for" "var ${1:i} = ${2:-1}, len = $3.length;\n\nfor(; ++$1 < len;){\n  $4\n}\n" "for" nil nil nil nil nil nil)
                       ("forin" "for( ${1:var} in ${2:obj} )\n{\n    $0\n}" "forin" nil nil nil nil nil nil)
                       ("fun" "/** $1 */\nfunction ${2:my_function}( ${3:args} ){\n    $0\n}" "fun" nil nil nil nil nil nil)
                       ("get" "$.get(${1:url},\n     ${2:values},\n     function(data){\n        $0\n     }\n);" "jQuery selector" nil
                        ("jquery")
                        nil nil nil nil)
                       ("grease" "// ${1:Script Name}\n// version ${2:0.1}\n// ${3:2009-12-26}\n//\n// Copyright 2009 David Miller\n// @url           http://www.deadpansincerity.com\n//\n// This program is free software: you can redistribute it and/or modify\n//  it under the terms of the GNU General Public License as published by\n//  the Free Software Foundation, either version 3 of the License, or\n//  (at your option) any later version.\n//\n//  This program is distributed in the hope that it will be useful,\n//  but WITHOUT ANY WARRANTY; without even the implied warranty of\n//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n//  GNU General Public License for more details.\n//\n//  You should have received a copy of the GNU General Public License\n//  along with this program.  If not, see <http://www.gnu.org/licenses/>.\n//\n// --------------------------------------------------------------------\n//\n// This Greasemonkey script ${4:Long description}\n//\n// --------------------------------------------------------------------\n//\n// ==UserScript==\n// @name          $1\n// @namespace     http://code.deadpansincerity.com\n// @description   ${5:Short Description}\n// @include       ${6:domain}\n// ==/UserScript==\n$0\n" "grease" nil
                        ("greasemonkey")
                        nil nil nil nil)
                       ("has" "hasClass( \"${1:class}\" )$0" "jQuery hasClass()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("header" "//\n// `(file-name-nondirectory (buffer-file-name))` v ${1:version}\n//\n// ${2:Short desc}\n//\n// Commentary:\n//\n// $0\n//\n// Additional Reserved Names:\n//\n// ${3:None}\n//\n// Code:" "File header" nil nil nil nil nil nil)
                       ("hov" "hover( \n    function(){\n    $0\n    },\n    function(){\n\n    }\n);" "jQuery selector" nil
                        ("jquery")
                        nil nil nil nil)
                       ("id" "document.getElementById('$0');\n" "id" nil nil nil nil nil nil)
                       ("if" "if(${1:condition}){\n    $0\n}" "if" nil nil nil nil nil nil)
                       ("if" "if( ${1} ){\n$0\n}\n" "if" nil nil nil nil nil nil)
                       ("if" "if(${1:condition}){\n    $2;\n}else{\n    $0;\n}" "if...else" nil nil nil nil nil nil)
                       ("init" "initialize: function(){\n    _.bindAll(this, \"render\");\n    $0\n}," "Backbone initialize" nil
                        ("backbone")
                        nil nil nil nil)
                       ("invoc" "(function($1){\n$0\n})($2);\n" "invoc" nil nil nil nil nil nil)
                       ("is" "is(\"${1:condition}\")$0" "jQuery Click" nil
                        ("jquery")
                        nil nil nil nil)
                       ("it" "it('Should ${1:have a description}', function () {\n    var $0\n});" "Jasmine it" nil
                        ("Jasmine")
                        nil nil nil nil)
                       ("it" "it('$1', function(done){\n$2\n});\n" "it" nil nil nil nil nil nil)
                       ("$" "\\$(${1:\"#selector\"}).$0" "jQuery selector" nil
                        ("jquery")
                        nil nil nil nil)
                       ("json" "\\$.getJSON( \"${1:url/to/hit}\", function( data ){\n  $0\n}); " "jQuery getJSON()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("log" "console.${1:log}( $0 );\n" "log" nil nil nil nil nil nil)
                       ("map" "_.map(${1:iterable}, function(${2:args}){\n    $0\n});" "_.map" nil
                        ("_")
                        nil nil nil nil)
                       ("meth" "    this.$1 = function( ${2:args} )\n    {\n        $0\n    }" "meth" nil nil nil nil nil nil)
                       ("method" "$1.prototype.$2 = function($3){\n${0}\n};\n" "method" nil nil nil nil nil nil)
                       ("mod" "var $1 = require(\"${2:$1}\")$3\n\nmodule.exports = {\n  $4: $4$5\n};\n\n$0\n" "mod" nil nil nil nil nil nil)
                       ("ne" "next(${1:'#selector'}).$0" "jQuery next()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("par" "parent(${1:item})$0" "jQuery Parent()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("post" "$.post(${1:url},\n     ${2:values},\n     function(data){\n        $0\n     }\n);" "jQuery selector" nil
                        ("jquery")
                        nil nil nil nil)
                       ("prop" "\nvar $1 = (function(){\n\n  var value = undefined;\n\n  return function $1(newValue){\n\n    if( $1.arguments.length > 0 ){\n      value = newValue;\n    }\n\n    return value;\n  };\n\n})();\n" "prop" nil nil nil nil nil nil)
                       ("proto" "$1.prototype.$2 = $0\n" "proto" nil nil nil nil nil nil)
                       ("rea" "$(document).ready( function(){\n    $0\n});" "jQuery Ready" nil
                        ("jquery")
                        nil nil nil nil)
                       ("rq" "$1 = require(\"${2:$1}\")$0\n" "rq" nil nil nil nil nil nil)
                       ("rt" "return$0;\n" "rt" nil nil nil nil nil nil)
                       ("sib" "siblings(${1:\"#selector\"}).$0" "jQuery siblings()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("sli" "slideDown(${1:'slow'}).$0" "jQuery slideDown()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("slice" "Array.prototype.slice.${1:call}($0);\n" "slice" nil nil nil nil nil nil)
                       ("sli" "slideUp(${1:'slow'}).$0" "jQuery slideUp()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("super" "$1.prototype.${2:constructor}.${3:call}($0);\n" "super" nil nil nil nil nil nil)
                       ("switch" "switch($1){\n$0\n};\n" "switch" nil nil nil nil nil nil)
                       ("thi" "$(this).$0" "jQuery this" nil
                        ("jquery")
                        nil nil nil nil)
                       ("throw" "throw new Error(\"$1\");\n" "throw" nil nil nil nil nil nil)
                       ("time" "`(current-time-string)`" "(current time)" nil nil nil nil nil nil)
                       ("tmpl" "<script id=\"${1:tmpl_id}\" type=\"text/x-jquery-tmpl\">\n  $0\n</script>" "tmpl" nil
                        ("templating")
                        nil nil nil nil)
                       ("tog" "toggleClass( \"${1:class}\" )$0" "jQuery toggleClass()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("try" "try {\n  $1\n} catch(error) {\n  $0\n}\n" "try" nil nil nil nil nil nil)
                       ("var" "var $1 = $0\n" "var" nil nil nil nil nil nil)
                       ("view" "${1:NAMESPACE}.views.${2:View} = Backbone.View.extend({\n    tagName: $3,\n    className: $4\n    el: \\$(\"$5\"),\n    template: \\$(\"$6\"),\n\n    initialize: function(){\n        _.bindAll(this, \"render\");\n    },\n\n    render: function(){\n        $(this.el).html(this.template.tmpl());\n        return this\n    },\n    $0\n\n});\n" "Backbone View" nil
                        ("backbone")
                        nil nil nil nil)
                       ("wh" "while($1){\n$0\n}\n" "wh" nil nil nil nil nil nil)
                       ("while" "\nvar i = $1.length;\n\nwhile( i -- ){\n  $0\n}" "while" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sat Jul 13 23:08:13 2013
