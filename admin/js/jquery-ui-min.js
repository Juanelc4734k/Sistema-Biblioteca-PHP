/*!
 * jQuery UI 1.8.16
 *
 * Copyright 2011, AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * http://docs.jquery.com/UI
 */
(function (c, j) {
  function k(a, b) {
    var d = a.nodeName.toLowerCase();
    if ("area" === d) {
      b = a.parentNode;
      d = b.name;
      if (!a.href || !d || b.nodeName.toLowerCase() !== "map") return false;
      a = c("img[usemap=#" + d + "]")[0];
      return !!a && l(a);
    }
    return (
      (/input|select|textarea|button|object/.test(d)
        ? !a.disabled
        : "a" == d
        ? a.href || b
        : b) && l(a)
    );
  }
  function l(a) {
    return !c(a)
      .parents()
      .andSelf()
      .filter(function () {
        return (
          c.curCSS(this, "visibility") === "hidden" ||
          c.expr.filters.hidden(this)
        );
      }).length;
  }
  c.ui = c.ui || {};
  if (!c.ui.version) {
    c.extend(c.ui, {
      version: "1.8.16",
      keyCode: {
        ALT: 18,
        BACKSPACE: 8,
        CAPS_LOCK: 20,
        COMMA: 188,
        COMMAND: 91,
        COMMAND_LEFT: 91,
        COMMAND_RIGHT: 93,
        CONTROL: 17,
        DELETE: 46,
        DOWN: 40,
        END: 35,
        ENTER: 13,
        ESCAPE: 27,
        HOME: 36,
        INSERT: 45,
        LEFT: 37,
        MENU: 93,
        NUMPAD_ADD: 107,
        NUMPAD_DECIMAL: 110,
        NUMPAD_DIVIDE: 111,
        NUMPAD_ENTER: 108,
        NUMPAD_MULTIPLY: 106,
        NUMPAD_SUBTRACT: 109,
        PAGE_DOWN: 34,
        PAGE_UP: 33,
        PERIOD: 190,
        RIGHT: 39,
        SHIFT: 16,
        SPACE: 32,
        TAB: 9,
        UP: 38,
        WINDOWS: 91,
      },
    });
    c.fn.extend({
      propAttr: c.fn.prop || c.fn.attr,
      _focus: c.fn.focus,
      focus: function (a, b) {
        return typeof a === "number"
          ? this.each(function () {
              var d = this;
              setTimeout(function () {
                c(d).focus();
                b && b.call(d);
              }, a);
            })
          : this._focus.apply(this, arguments);
      },
      scrollParent: function () {
        var a;
        a =
          (c.browser.msie && /(static|relative)/.test(this.css("position"))) ||
          /absolute/.test(this.css("position"))
            ? this.parents()
                .filter(function () {
                  return (
                    /(relative|absolute|fixed)/.test(
                      c.curCSS(this, "position", 1)
                    ) &&
                    /(auto|scroll)/.test(
                      c.curCSS(this, "overflow", 1) +
                        c.curCSS(this, "overflow-y", 1) +
                        c.curCSS(this, "overflow-x", 1)
                    )
                  );
                })
                .eq(0)
            : this.parents()
                .filter(function () {
                  return /(auto|scroll)/.test(
                    c.curCSS(this, "overflow", 1) +
                      c.curCSS(this, "overflow-y", 1) +
                      c.curCSS(this, "overflow-x", 1)
                  );
                })
                .eq(0);
        return /fixed/.test(this.css("position")) || !a.length
          ? c(document)
          : a;
      },
      zIndex: function (a) {
        if (a !== j) return this.css("zIndex", a);
        if (this.length) {
          a = c(this[0]);
          for (var b; a.length && a[0] !== document; ) {
            b = a.css("position");
            if (b === "absolute" || b === "relative" || b === "fixed") {
              b = parseInt(a.css("zIndex"), 10);
              if (!isNaN(b) && b !== 0) return b;
            }
            a = a.parent();
          }
        }
        return 0;
      },
      disableSelection: function () {
        return this.bind(
          (c.support.selectstart ? "selectstart" : "mousedown") +
            ".ui-disableSelection",
          function (a) {
            a.preventDefault();
          }
        );
      },
      enableSelection: function () {
        return this.unbind(".ui-disableSelection");
      },
    });
    c.each(["Width", "Height"], function (a, b) {
      function d(f, g, m, n) {
        c.each(e, function () {
          g -= parseFloat(c.curCSS(f, "padding" + this, true)) || 0;
          if (m)
            g -= parseFloat(c.curCSS(f, "border" + this + "Width", true)) || 0;
          if (n) g -= parseFloat(c.curCSS(f, "margin" + this, true)) || 0;
        });
        return g;
      }
      var e = b === "Width" ? ["Left", "Right"] : ["Top", "Bottom"],
        h = b.toLowerCase(),
        i = {
          innerWidth: c.fn.innerWidth,
          innerHeight: c.fn.innerHeight,
          outerWidth: c.fn.outerWidth,
          outerHeight: c.fn.outerHeight,
        };
      c.fn["inner" + b] = function (f) {
        if (f === j) return i["inner" + b].call(this);
        return this.each(function () {
          c(this).css(h, d(this, f) + "px");
        });
      };
      c.fn["outer" + b] = function (f, g) {
        if (typeof f !== "number") return i["outer" + b].call(this, f);
        return this.each(function () {
          c(this).css(h, d(this, f, true, g) + "px");
        });
      };
    });
    c.extend(c.expr[":"], {
      data: function (a, b, d) {
        return !!c.data(a, d[3]);
      },
      focusable: function (a) {
        return k(a, !isNaN(c.attr(a, "tabindex")));
      },
      tabbable: function (a) {
        var b = c.attr(a, "tabindex"),
          d = isNaN(b);
        return (d || b >= 0) && k(a, !d);
      },
    });
    c(function () {
      var a = document.body,
        b = a.appendChild((b = document.createElement("div")));
      c.extend(b.style, {
        minHeight: "100px",
        height: "auto",
        padding: 0,
        borderWidth: 0,
      });
      c.support.minHeight = b.offsetHeight === 100;
      c.support.selectstart = "onselectstart" in b;
      a.removeChild(b).style.display = "none";
    });
    c.extend(c.ui, {
      plugin: {
        add: function (a, b, d) {
          a = c.ui[a].prototype;
          for (var e in d) {
            a.plugins[e] = a.plugins[e] || [];
            a.plugins[e].push([b, d[e]]);
          }
        },
        call: function (a, b, d) {
          if ((b = a.plugins[b]) && a.element[0].parentNode)
            for (var e = 0; e < b.length; e++)
              a.options[b[e][0]] && b[e][1].apply(a.element, d);
        },
      },
      contains: function (a, b) {
        return document.compareDocumentPosition
          ? a.compareDocumentPosition(b) & 16
          : a !== b && a.contains(b);
      },
      hasScroll: function (a, b) {
        if (c(a).css("overflow") === "hidden") return false;
        b = b && b === "left" ? "scrollLeft" : "scrollTop";
        var d = false;
        if (a[b] > 0) return true;
        a[b] = 1;
        d = a[b] > 0;
        a[b] = 0;
        return d;
      },
      isOverAxis: function (a, b, d) {
        return a > b && a < b + d;
      },
      isOver: function (a, b, d, e, h, i) {
        return c.ui.isOverAxis(a, d, h) && c.ui.isOverAxis(b, e, i);
      },
    });
  }
})(jQuery);
/*!
 * jQuery UI Widget 1.8.16
 *
 * Copyright 2011, AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * http://docs.jquery.com/UI/Widget
 */
(function (b, j) {
  if (b.cleanData) {
    var k = b.cleanData;
    b.cleanData = function (a) {
      for (var c = 0, d; (d = a[c]) != null; c++)
        try {
          b(d).triggerHandler("remove");
        } catch (e) {}
      k(a);
    };
  } else {
    var l = b.fn.remove;
    b.fn.remove = function (a, c) {
      return this.each(function () {
        if (!c)
          if (!a || b.filter(a, [this]).length)
            b("*", this)
              .add([this])
              .each(function () {
                try {
                  b(this).triggerHandler("remove");
                } catch (d) {}
              });
        return l.call(b(this), a, c);
      });
    };
  }
  b.widget = function (a, c, d) {
    var e = a.split(".")[0],
      f;
    a = a.split(".")[1];
    f = e + "-" + a;
    if (!d) {
      d = c;
      c = b.Widget;
    }
    b.expr[":"][f] = function (h) {
      return !!b.data(h, a);
    };
    b[e] = b[e] || {};
    b[e][a] = function (h, g) {
      arguments.length && this._createWidget(h, g);
    };
    c = new c();
    c.options = b.extend(true, {}, c.options);
    b[e][a].prototype = b.extend(
      true,
      c,
      {
        namespace: e,
        widgetName: a,
        widgetEventPrefix: b[e][a].prototype.widgetEventPrefix || a,
        widgetBaseClass: f,
      },
      d
    );
    b.widget.bridge(a, b[e][a]);
  };
  b.widget.bridge = function (a, c) {
    b.fn[a] = function (d) {
      var e = typeof d === "string",
        f = Array.prototype.slice.call(arguments, 1),
        h = this;
      d = !e && f.length ? b.extend.apply(null, [true, d].concat(f)) : d;
      if (e && d.charAt(0) === "_") return h;
      e
        ? this.each(function () {
            var g = b.data(this, a),
              i = g && b.isFunction(g[d]) ? g[d].apply(g, f) : g;
            if (i !== g && i !== j) {
              h = i;
              return false;
            }
          })
        : this.each(function () {
            var g = b.data(this, a);
            g ? g.option(d || {})._init() : b.data(this, a, new c(d, this));
          });
      return h;
    };
  };
  b.Widget = function (a, c) {
    arguments.length && this._createWidget(a, c);
  };
  b.Widget.prototype = {
    widgetName: "widget",
    widgetEventPrefix: "",
    options: { disabled: false },
    _createWidget: function (a, c) {
      b.data(c, this.widgetName, this);
      this.element = b(c);
      this.options = b.extend(
        true,
        {},
        this.options,
        this._getCreateOptions(),
        a
      );
      var d = this;
      this.element.bind("remove." + this.widgetName, function () {
        d.destroy();
      });
      this._create();
      this._trigger("create");
      this._init();
    },
    _getCreateOptions: function () {
      return b.metadata && b.metadata.get(this.element[0])[this.widgetName];
    },
    _create: function () {},
    _init: function () {},
    destroy: function () {
      this.element.unbind("." + this.widgetName).removeData(this.widgetName);
      this.widget()
        .unbind("." + this.widgetName)
        .removeAttr("aria-disabled")
        .removeClass(this.widgetBaseClass + "-disabled ui-state-disabled");
    },
    widget: function () {
      return this.element;
    },
    option: function (a, c) {
      var d = a;
      if (arguments.length === 0) return b.extend({}, this.options);
      if (typeof a === "string") {
        if (c === j) return this.options[a];
        d = {};
        d[a] = c;
      }
      this._setOptions(d);
      return this;
    },
    _setOptions: function (a) {
      var c = this;
      b.each(a, function (d, e) {
        c._setOption(d, e);
      });
      return this;
    },
    _setOption: function (a, c) {
      this.options[a] = c;
      if (a === "disabled")
        this.widget()
          [c ? "addClass" : "removeClass"](
            this.widgetBaseClass + "-disabled ui-state-disabled"
          )
          .attr("aria-disabled", c);
      return this;
    },
    enable: function () {
      return this._setOption("disabled", false);
    },
    disable: function () {
      return this._setOption("disabled", true);
    },
    _trigger: function (a, c, d) {
      var e = this.options[a];
      c = b.Event(c);
      c.type = (
        a === this.widgetEventPrefix ? a : this.widgetEventPrefix + a
      ).toLowerCase();
      d = d || {};
      if (c.originalEvent) {
        a = b.event.props.length;
        for (var f; a; ) {
          f = b.event.props[--a];
          c[f] = c.originalEvent[f];
        }
      }
      this.element.trigger(c, d);
      return !(
        (b.isFunction(e) && e.call(this.element[0], c, d) === false) ||
        c.isDefaultPrevented()
      );
    },
  };
})(jQuery);
/*!
 * jQuery UI Mouse 1.8.16
 *
 * Copyright 2011, AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * http://docs.jquery.com/UI/Mouse
 *
 * Depends:
 *	jquery.ui.widget.js
 */
(function (b) {
  var d = false;
  b(document).mouseup(function () {
    d = false;
  });
  b.widget("ui.mouse", {
    options: { cancel: ":input,option", distance: 1, delay: 0 },
    _mouseInit: function () {
      var a = this;
      this.element
        .bind("mousedown." + this.widgetName, function (c) {
          return a._mouseDown(c);
        })
        .bind("click." + this.widgetName, function (c) {
          if (true === b.data(c.target, a.widgetName + ".preventClickEvent")) {
            b.removeData(c.target, a.widgetName + ".preventClickEvent");
            c.stopImmediatePropagation();
            return false;
          }
        });
      this.started = false;
    },
    _mouseDestroy: function () {
      this.element.unbind("." + this.widgetName);
    },
    _mouseDown: function (a) {
      if (!d) {
        this._mouseStarted && this._mouseUp(a);
        this._mouseDownEvent = a;
        var c = this,
          f = a.which == 1,
          g =
            typeof this.options.cancel == "string" && a.target.nodeName
              ? b(a.target).closest(this.options.cancel).length
              : false;
        if (!f || g || !this._mouseCapture(a)) return true;
        this.mouseDelayMet = !this.options.delay;
        if (!this.mouseDelayMet)
          this._mouseDelayTimer = setTimeout(function () {
            c.mouseDelayMet = true;
          }, this.options.delay);
        if (this._mouseDistanceMet(a) && this._mouseDelayMet(a)) {
          this._mouseStarted = this._mouseStart(a) !== false;
          if (!this._mouseStarted) {
            a.preventDefault();
            return true;
          }
        }
        true === b.data(a.target, this.widgetName + ".preventClickEvent") &&
          b.removeData(a.target, this.widgetName + ".preventClickEvent");
        this._mouseMoveDelegate = function (e) {
          return c._mouseMove(e);
        };
        this._mouseUpDelegate = function (e) {
          return c._mouseUp(e);
        };
        b(document)
          .bind("mousemove." + this.widgetName, this._mouseMoveDelegate)
          .bind("mouseup." + this.widgetName, this._mouseUpDelegate);
        a.preventDefault();
        return (d = true);
      }
    },
    _mouseMove: function (a) {
      if (b.browser.msie && !(document.documentMode >= 9) && !a.button)
        return this._mouseUp(a);
      if (this._mouseStarted) {
        this._mouseDrag(a);
        return a.preventDefault();
      }
      if (this._mouseDistanceMet(a) && this._mouseDelayMet(a))
        (this._mouseStarted =
          this._mouseStart(this._mouseDownEvent, a) !== false)
          ? this._mouseDrag(a)
          : this._mouseUp(a);
      return !this._mouseStarted;
    },
    _mouseUp: function (a) {
      b(document)
        .unbind("mousemove." + this.widgetName, this._mouseMoveDelegate)
        .unbind("mouseup." + this.widgetName, this._mouseUpDelegate);
      if (this._mouseStarted) {
        this._mouseStarted = false;
        a.target == this._mouseDownEvent.target &&
          b.data(a.target, this.widgetName + ".preventClickEvent", true);
        this._mouseStop(a);
      }
      return false;
    },
    _mouseDistanceMet: function (a) {
      return (
        Math.max(
          Math.abs(this._mouseDownEvent.pageX - a.pageX),
          Math.abs(this._mouseDownEvent.pageY - a.pageY)
        ) >= this.options.distance
      );
    },
    _mouseDelayMet: function () {
      return this.mouseDelayMet;
    },
    _mouseStart: function () {},
    _mouseDrag: function () {},
    _mouseStop: function () {},
    _mouseCapture: function () {
      return true;
    },
  });
})(jQuery);
/*
 * jQuery UI Position 1.8.16
 *
 * Copyright 2011, AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * http://docs.jquery.com/UI/Position
 */
(function (c) {
  c.ui = c.ui || {};
  var n = /left|center|right/,
    o = /top|center|bottom/,
    t = c.fn.position,
    u = c.fn.offset;
  c.fn.position = function (b) {
    if (!b || !b.of) return t.apply(this, arguments);
    b = c.extend({}, b);
    var a = c(b.of),
      d = a[0],
      g = (b.collision || "flip").split(" "),
      e = b.offset ? b.offset.split(" ") : [0, 0],
      h,
      k,
      j;
    if (d.nodeType === 9) {
      h = a.width();
      k = a.height();
      j = { top: 0, left: 0 };
    } else if (d.setTimeout) {
      h = a.width();
      k = a.height();
      j = { top: a.scrollTop(), left: a.scrollLeft() };
    } else if (d.preventDefault) {
      b.at = "left top";
      h = k = 0;
      j = { top: b.of.pageY, left: b.of.pageX };
    } else {
      h = a.outerWidth();
      k = a.outerHeight();
      j = a.offset();
    }
    c.each(["my", "at"], function () {
      var f = (b[this] || "").split(" ");
      if (f.length === 1)
        f = n.test(f[0])
          ? f.concat(["center"])
          : o.test(f[0])
          ? ["center"].concat(f)
          : ["center", "center"];
      f[0] = n.test(f[0]) ? f[0] : "center";
      f[1] = o.test(f[1]) ? f[1] : "center";
      b[this] = f;
    });
    if (g.length === 1) g[1] = g[0];
    e[0] = parseInt(e[0], 10) || 0;
    if (e.length === 1) e[1] = e[0];
    e[1] = parseInt(e[1], 10) || 0;
    if (b.at[0] === "right") j.left += h;
    else if (b.at[0] === "center") j.left += h / 2;
    if (b.at[1] === "bottom") j.top += k;
    else if (b.at[1] === "center") j.top += k / 2;
    j.left += e[0];
    j.top += e[1];
    return this.each(function () {
      var f = c(this),
        l = f.outerWidth(),
        m = f.outerHeight(),
        p = parseInt(c.curCSS(this, "marginLeft", true)) || 0,
        q = parseInt(c.curCSS(this, "marginTop", true)) || 0,
        v = l + p + (parseInt(c.curCSS(this, "marginRight", true)) || 0),
        w = m + q + (parseInt(c.curCSS(this, "marginBottom", true)) || 0),
        i = c.extend({}, j),
        r;
      if (b.my[0] === "right") i.left -= l;
      else if (b.my[0] === "center") i.left -= l / 2;
      if (b.my[1] === "bottom") i.top -= m;
      else if (b.my[1] === "center") i.top -= m / 2;
      i.left = Math.round(i.left);
      i.top = Math.round(i.top);
      r = { left: i.left - p, top: i.top - q };
      c.each(["left", "top"], function (s, x) {
        c.ui.position[g[s]] &&
          c.ui.position[g[s]][x](i, {
            targetWidth: h,
            targetHeight: k,
            elemWidth: l,
            elemHeight: m,
            collisionPosition: r,
            collisionWidth: v,
            collisionHeight: w,
            offset: e,
            my: b.my,
            at: b.at,
          });
      });
      c.fn.bgiframe && f.bgiframe();
      f.offset(c.extend(i, { using: b.using }));
    });
  };
  c.ui.position = {
    fit: {
      left: function (b, a) {
        var d = c(window);
        d =
          a.collisionPosition.left +
          a.collisionWidth -
          d.width() -
          d.scrollLeft();
        b.left =
          d > 0
            ? b.left - d
            : Math.max(b.left - a.collisionPosition.left, b.left);
      },
      top: function (b, a) {
        var d = c(window);
        d =
          a.collisionPosition.top +
          a.collisionHeight -
          d.height() -
          d.scrollTop();
        b.top =
          d > 0 ? b.top - d : Math.max(b.top - a.collisionPosition.top, b.top);
      },
    },
    flip: {
      left: function (b, a) {
        if (a.at[0] !== "center") {
          var d = c(window);
          d =
            a.collisionPosition.left +
            a.collisionWidth -
            d.width() -
            d.scrollLeft();
          var g =
              a.my[0] === "left"
                ? -a.elemWidth
                : a.my[0] === "right"
                ? a.elemWidth
                : 0,
            e = a.at[0] === "left" ? a.targetWidth : -a.targetWidth,
            h = -2 * a.offset[0];
          b.left +=
            a.collisionPosition.left < 0 ? g + e + h : d > 0 ? g + e + h : 0;
        }
      },
      top: function (b, a) {
        if (a.at[1] !== "center") {
          var d = c(window);
          d =
            a.collisionPosition.top +
            a.collisionHeight -
            d.height() -
            d.scrollTop();
          var g =
              a.my[1] === "top"
                ? -a.elemHeight
                : a.my[1] === "bottom"
                ? a.elemHeight
                : 0,
            e = a.at[1] === "top" ? a.targetHeight : -a.targetHeight,
            h = -2 * a.offset[1];
          b.top +=
            a.collisionPosition.top < 0 ? g + e + h : d > 0 ? g + e + h : 0;
        }
      },
    },
  };
  if (!c.offset.setOffset) {
    c.offset.setOffset = function (b, a) {
      if (/static/.test(c.curCSS(b, "position"))) b.style.position = "relative";
      var d = c(b),
        g = d.offset(),
        e = parseInt(c.curCSS(b, "top", true), 10) || 0,
        h = parseInt(c.curCSS(b, "left", true), 10) || 0;
      g = { top: a.top - g.top + e, left: a.left - g.left + h };
      "using" in a ? a.using.call(b, g) : d.css(g);
    };
    c.fn.offset = function (b) {
      var a = this[0];
      if (!a || !a.ownerDocument) return null;
      if (b)
        return this.each(function () {
          c.offset.setOffset(this, b);
        });
      return u.call(this);
    };
  }
})(jQuery);
/*
 * jQuery UI Button 1.8.16
 *
 * Copyright 2011, AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * http://docs.jquery.com/UI/Button
 *
 * Depends:
 *	jquery.ui.core.js
 *	jquery.ui.widget.js
 */
(function (b) {
  var h,
    i,
    j,
    g,
    l = function () {
      var a = b(this).find(":ui-button");
      setTimeout(function () {
        a.button("refresh");
      }, 1);
    },
    k = function (a) {
      var c = a.name,
        e = a.form,
        f = b([]);
      if (c)
        f = e
          ? b(e).find("[name='" + c + "']")
          : b("[name='" + c + "']", a.ownerDocument).filter(function () {
              return !this.form;
            });
      return f;
    };
  b.widget("ui.button", {
    options: {
      disabled: null,
      text: true,
      label: null,
      icons: { primary: null, secondary: null },
    },
    _create: function () {
      this.element
        .closest("form")
        .unbind("reset.button")
        .bind("reset.button", l);
      if (typeof this.options.disabled !== "boolean")
        this.options.disabled = this.element.propAttr("disabled");
      this._determineButtonType();
      this.hasTitle = !!this.buttonElement.attr("title");
      var a = this,
        c = this.options,
        e = this.type === "checkbox" || this.type === "radio",
        f = "ui-state-hover" + (!e ? " ui-state-active" : "");
      if (c.label === null) c.label = this.buttonElement.html();
      if (this.element.is(":disabled")) c.disabled = true;
      this.buttonElement
        .addClass("ui-button ui-widget ui-state-default ui-corner-all")
        .attr("role", "button")
        .bind("mouseenter.button", function () {
          if (!c.disabled) {
            b(this).addClass("ui-state-hover");
            this === h && b(this).addClass("ui-state-active");
          }
        })
        .bind("mouseleave.button", function () {
          c.disabled || b(this).removeClass(f);
        })
        .bind("click.button", function (d) {
          if (c.disabled) {
            d.preventDefault();
            d.stopImmediatePropagation();
          }
        });
      this.element
        .bind("focus.button", function () {
          a.buttonElement.addClass("ui-state-focus");
        })
        .bind("blur.button", function () {
          a.buttonElement.removeClass("ui-state-focus");
        });
      if (e) {
        this.element.bind("change.button", function () {
          g || a.refresh();
        });
        this.buttonElement
          .bind("mousedown.button", function (d) {
            if (!c.disabled) {
              g = false;
              i = d.pageX;
              j = d.pageY;
            }
          })
          .bind("mouseup.button", function (d) {
            if (!c.disabled) if (i !== d.pageX || j !== d.pageY) g = true;
          });
      }
      if (this.type === "checkbox")
        this.buttonElement.bind("click.button", function () {
          if (c.disabled || g) return false;
          b(this).toggleClass("ui-state-active");
          a.buttonElement.attr("aria-pressed", a.element[0].checked);
        });
      else if (this.type === "radio")
        this.buttonElement.bind("click.button", function () {
          if (c.disabled || g) return false;
          b(this).addClass("ui-state-active");
          a.buttonElement.attr("aria-pressed", "true");
          var d = a.element[0];
          k(d)
            .not(d)
            .map(function () {
              return b(this).button("widget")[0];
            })
            .removeClass("ui-state-active")
            .attr("aria-pressed", "false");
        });
      else {
        this.buttonElement
          .bind("mousedown.button", function () {
            if (c.disabled) return false;
            b(this).addClass("ui-state-active");
            h = this;
            b(document).one("mouseup", function () {
              h = null;
            });
          })
          .bind("mouseup.button", function () {
            if (c.disabled) return false;
            b(this).removeClass("ui-state-active");
          })
          .bind("keydown.button", function (d) {
            if (c.disabled) return false;
            if (
              d.keyCode == b.ui.keyCode.SPACE ||
              d.keyCode == b.ui.keyCode.ENTER
            )
              b(this).addClass("ui-state-active");
          })
          .bind("keyup.button", function () {
            b(this).removeClass("ui-state-active");
          });
        this.buttonElement.is("a") &&
          this.buttonElement.keyup(function (d) {
            d.keyCode === b.ui.keyCode.SPACE && b(this).click();
          });
      }
      this._setOption("disabled", c.disabled);
      this._resetButton();
    },
    _determineButtonType: function () {
      this.type = this.element.is(":checkbox")
        ? "checkbox"
        : this.element.is(":radio")
        ? "radio"
        : this.element.is("input")
        ? "input"
        : "button";
      if (this.type === "checkbox" || this.type === "radio") {
        var a = this.element.parents().filter(":last"),
          c = "label[for='" + this.element.attr("id") + "']";
        this.buttonElement = a.find(c);
        if (!this.buttonElement.length) {
          a = a.length ? a.siblings() : this.element.siblings();
          this.buttonElement = a.filter(c);
          if (!this.buttonElement.length) this.buttonElement = a.find(c);
        }
        this.element.addClass("ui-helper-hidden-accessible");
        (a = this.element.is(":checked")) &&
          this.buttonElement.addClass("ui-state-active");
        this.buttonElement.attr("aria-pressed", a);
      } else this.buttonElement = this.element;
    },
    widget: function () {
      return this.buttonElement;
    },
    destroy: function () {
      this.element.removeClass("ui-helper-hidden-accessible");
      this.buttonElement
        .removeClass(
          "ui-button ui-widget ui-state-default ui-corner-all ui-state-hover ui-state-active  ui-button-icons-only ui-button-icon-only ui-button-text-icons ui-button-text-icon-primary ui-button-text-icon-secondary ui-button-text-only"
        )
        .removeAttr("role")
        .removeAttr("aria-pressed")
        .html(this.buttonElement.find(".ui-button-text").html());
      this.hasTitle || this.buttonElement.removeAttr("title");
      b.Widget.prototype.destroy.call(this);
    },
    _setOption: function (a, c) {
      b.Widget.prototype._setOption.apply(this, arguments);
      if (a === "disabled")
        c
          ? this.element.propAttr("disabled", true)
          : this.element.propAttr("disabled", false);
      else this._resetButton();
    },
    refresh: function () {
      var a = this.element.is(":disabled");
      a !== this.options.disabled && this._setOption("disabled", a);
      if (this.type === "radio")
        k(this.element[0]).each(function () {
          b(this).is(":checked")
            ? b(this)
                .button("widget")
                .addClass("ui-state-active")
                .attr("aria-pressed", "true")
            : b(this)
                .button("widget")
                .removeClass("ui-state-active")
                .attr("aria-pressed", "false");
        });
      else if (this.type === "checkbox")
        this.element.is(":checked")
          ? this.buttonElement
              .addClass("ui-state-active")
              .attr("aria-pressed", "true")
          : this.buttonElement
              .removeClass("ui-state-active")
              .attr("aria-pressed", "false");
    },
    _resetButton: function () {
      if (this.type === "input")
        this.options.label && this.element.val(this.options.label);
      else {
        var a = this.buttonElement.removeClass(
            "ui-button-icons-only ui-button-icon-only ui-button-text-icons ui-button-text-icon-primary ui-button-text-icon-secondary ui-button-text-only"
          ),
          c = b("<span></span>")
            .addClass("ui-button-text")
            .html(this.options.label)
            .appendTo(a.empty())
            .text(),
          e = this.options.icons,
          f = e.primary && e.secondary,
          d = [];
        if (e.primary || e.secondary) {
          if (this.options.text)
            d.push(
              "ui-button-text-icon" +
                (f ? "s" : e.primary ? "-primary" : "-secondary")
            );
          e.primary &&
            a.prepend(
              "<span class='ui-button-icon-primary ui-icon " +
                e.primary +
                "'></span>"
            );
          e.secondary &&
            a.append(
              "<span class='ui-button-icon-secondary ui-icon " +
                e.secondary +
                "'></span>"
            );
          if (!this.options.text) {
            d.push(f ? "ui-button-icons-only" : "ui-button-icon-only");
            this.hasTitle || a.attr("title", c);
          }
        } else d.push("ui-button-text-only");
        a.addClass(d.join(" "));
      }
    },
  });
  b.widget("ui.buttonset", {
    options: {
      items: ":button, :submit, :reset, :checkbox, :radio, a, :data(button)",
    },
    _create: function () {
      this.element.addClass("ui-buttonset");
    },
    _init: function () {
      this.refresh();
    },
    _setOption: function (a, c) {
      a === "disabled" && this.buttons.button("option", a, c);
      b.Widget.prototype._setOption.apply(this, arguments);
    },
    refresh: function () {
      var a = this.element.css("direction") === "ltr";
      this.buttons = this.element
        .find(this.options.items)
        .filter(":ui-button")
        .button("refresh")
        .end()
        .not(":ui-button")
        .button()
        .end()
        .map(function () {
          return b(this).button("widget")[0];
        })
        .removeClass("ui-corner-all ui-corner-left ui-corner-right")
        .filter(":first")
        .addClass(a ? "ui-corner-left" : "ui-corner-right")
        .end()
        .filter(":last")
        .addClass(a ? "ui-corner-right" : "ui-corner-left")
        .end()
        .end();
    },
    destroy: function () {
      this.element.removeClass("ui-buttonset");
      this.buttons
        .map(function () {
          return b(this).button("widget")[0];
        })
        .removeClass("ui-corner-left ui-corner-right")
        .end()
        .button("destroy");
      b.Widget.prototype.destroy.call(this);
    },
  });
})(jQuery);
/*
 * jQuery UI Dialog 1.8.16
 *
 * Copyright 2011, AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * http://docs.jquery.com/UI/Dialog
 *
 * Depends:
 *	jquery.ui.core.js
 *	jquery.ui.widget.js
 *  jquery.ui.button.js
 *	jquery.ui.draggable.js
 *	jquery.ui.mouse.js
 *	jquery.ui.position.js
 *	jquery.ui.resizable.js
 */
(function (c, l) {
  var m = {
      buttons: true,
      height: true,
      maxHeight: true,
      maxWidth: true,
      minHeight: true,
      minWidth: true,
      width: true,
    },
    n = { maxHeight: true, maxWidth: true, minHeight: true, minWidth: true },
    o = c.attrFn || {
      val: true,
      css: true,
      html: true,
      text: true,
      data: true,
      width: true,
      height: true,
      offset: true,
      click: true,
    };
  c.widget("ui.dialog", {
    options: {
      autoOpen: true,
      buttons: {},
      closeOnEscape: true,
      closeText: "close",
      dialogClass: "",
      draggable: true,
      hide: null,
      height: "auto",
      maxHeight: false,
      maxWidth: false,
      minHeight: 150,
      minWidth: 150,
      modal: false,
      position: {
        my: "center",
        at: "center",
        collision: "fit",
        using: function (a) {
          var b = c(this).css(a).offset().top;
          b < 0 && c(this).css("top", a.top - b);
        },
      },
      resizable: true,
      show: null,
      stack: true,
      title: "",
      width: 300,
      zIndex: 1e3,
    },
    _create: function () {
      this.originalTitle = this.element.attr("title");
      if (typeof this.originalTitle !== "string") this.originalTitle = "";
      this.options.title = this.options.title || this.originalTitle;
      var a = this,
        b = a.options,
        d = b.title || "&#160;",
        e = c.ui.dialog.getTitleId(a.element),
        g = (a.uiDialog = c("<div></div>"))
          .appendTo(document.body)
          .hide()
          .addClass(
            "ui-dialog ui-widget ui-widget-content ui-corner-all " +
              b.dialogClass
          )
          .css({ zIndex: b.zIndex })
          .attr("tabIndex", -1)
          .css("outline", 0)
          .keydown(function (i) {
            if (
              b.closeOnEscape &&
              !i.isDefaultPrevented() &&
              i.keyCode &&
              i.keyCode === c.ui.keyCode.ESCAPE
            ) {
              a.close(i);
              i.preventDefault();
            }
          })
          .attr({ role: "dialog", "aria-labelledby": e })
          .mousedown(function (i) {
            a.moveToTop(false, i);
          });
      a.element
        .show()
        .removeAttr("title")
        .addClass("ui-dialog-content ui-widget-content")
        .appendTo(g);
      var f = (a.uiDialogTitlebar = c("<div></div>"))
          .addClass(
            "ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"
          )
          .prependTo(g),
        h = c('<a href="#"></a>')
          .addClass("ui-dialog-titlebar-close ui-corner-all")
          .attr("role", "button")
          .hover(
            function () {
              h.addClass("ui-state-hover");
            },
            function () {
              h.removeClass("ui-state-hover");
            }
          )
          .focus(function () {
            h.addClass("ui-state-focus");
          })
          .blur(function () {
            h.removeClass("ui-state-focus");
          })
          .click(function (i) {
            a.close(i);
            return false;
          })
          .appendTo(f);
      (a.uiDialogTitlebarCloseText = c("<span></span>"))
        .addClass("ui-icon ui-icon-closethick")
        .text(b.closeText)
        .appendTo(h);
      c("<span></span>")
        .addClass("ui-dialog-title")
        .attr("id", e)
        .html(d)
        .prependTo(f);
      if (c.isFunction(b.beforeclose) && !c.isFunction(b.beforeClose))
        b.beforeClose = b.beforeclose;
      f.find("*").add(f).disableSelection();
      b.draggable && c.fn.draggable && a._makeDraggable();
      b.resizable && c.fn.resizable && a._makeResizable();
      a._createButtons(b.buttons);
      a._isOpen = false;
      c.fn.bgiframe && g.bgiframe();
    },
    _init: function () {
      this.options.autoOpen && this.open();
    },
    destroy: function () {
      var a = this;
      a.overlay && a.overlay.destroy();
      a.uiDialog.hide();
      a.element
        .unbind(".dialog")
        .removeData("dialog")
        .removeClass("ui-dialog-content ui-widget-content")
        .hide()
        .appendTo("body");
      a.uiDialog.remove();
      a.originalTitle && a.element.attr("title", a.originalTitle);
      return a;
    },
    widget: function () {
      return this.uiDialog;
    },
    close: function (a) {
      var b = this,
        d,
        e;
      if (false !== b._trigger("beforeClose", a)) {
        b.overlay && b.overlay.destroy();
        b.uiDialog.unbind("keypress.ui-dialog");
        b._isOpen = false;
        if (b.options.hide)
          b.uiDialog.hide(b.options.hide, function () {
            b._trigger("close", a);
          });
        else {
          b.uiDialog.hide();
          b._trigger("close", a);
        }
        c.ui.dialog.overlay.resize();
        if (b.options.modal) {
          d = 0;
          c(".ui-dialog").each(function () {
            if (this !== b.uiDialog[0]) {
              e = c(this).css("z-index");
              isNaN(e) || (d = Math.max(d, e));
            }
          });
          c.ui.dialog.maxZ = d;
        }
        return b;
      }
    },
    isOpen: function () {
      return this._isOpen;
    },
    moveToTop: function (a, b) {
      var d = this,
        e = d.options;
      if ((e.modal && !a) || (!e.stack && !e.modal))
        return d._trigger("focus", b);
      if (e.zIndex > c.ui.dialog.maxZ) c.ui.dialog.maxZ = e.zIndex;
      if (d.overlay) {
        c.ui.dialog.maxZ += 1;
        d.overlay.$el.css(
          "z-index",
          (c.ui.dialog.overlay.maxZ = c.ui.dialog.maxZ)
        );
      }
      a = {
        scrollTop: d.element.scrollTop(),
        scrollLeft: d.element.scrollLeft(),
      };
      c.ui.dialog.maxZ += 1;
      d.uiDialog.css("z-index", c.ui.dialog.maxZ);
      d.element.attr(a);
      d._trigger("focus", b);
      return d;
    },
    open: function () {
      if (!this._isOpen) {
        var a = this,
          b = a.options,
          d = a.uiDialog;
        a.overlay = b.modal ? new c.ui.dialog.overlay(a) : null;
        a._size();
        a._position(b.position);
        d.show(b.show);
        a.moveToTop(true);
        b.modal &&
          d.bind("keypress.ui-dialog", function (e) {
            if (e.keyCode === c.ui.keyCode.TAB) {
              var g = c(":tabbable", this),
                f = g.filter(":first");
              g = g.filter(":last");
              if (e.target === g[0] && !e.shiftKey) {
                f.focus(1);
                return false;
              } else if (e.target === f[0] && e.shiftKey) {
                g.focus(1);
                return false;
              }
            }
          });
        c(
          a.element
            .find(":tabbable")
            .get()
            .concat(
              d.find(".ui-dialog-buttonpane :tabbable").get().concat(d.get())
            )
        )
          .eq(0)
          .focus();
        a._isOpen = true;
        a._trigger("open");
        return a;
      }
    },
    _createButtons: function (a) {
      var b = this,
        d = false,
        e = c("<div></div>").addClass(
          "ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"
        ),
        g = c("<div></div>").addClass("ui-dialog-buttonset").appendTo(e);
      b.uiDialog.find(".ui-dialog-buttonpane").remove();
      typeof a === "object" &&
        a !== null &&
        c.each(a, function () {
          return !(d = true);
        });
      if (d) {
        c.each(a, function (f, h) {
          h = c.isFunction(h) ? { click: h, text: f } : h;
          var i = c('<button type="button"></button>')
            .click(function () {
              h.click.apply(b.element[0], arguments);
            })
            .appendTo(g);
          c.each(h, function (j, k) {
            if (j !== "click") j in o ? i[j](k) : i.attr(j, k);
          });
          c.fn.button && i.button();
        });
        e.appendTo(b.uiDialog);
      }
    },
    _makeDraggable: function () {
      function a(f) {
        return { position: f.position, offset: f.offset };
      }
      var b = this,
        d = b.options,
        e = c(document),
        g;
      b.uiDialog.draggable({
        cancel: ".ui-dialog-content, .ui-dialog-titlebar-close",
        handle: ".ui-dialog-titlebar",
        containment: "document",
        start: function (f, h) {
          g = d.height === "auto" ? "auto" : c(this).height();
          c(this).height(c(this).height()).addClass("ui-dialog-dragging");
          b._trigger("dragStart", f, a(h));
        },
        drag: function (f, h) {
          b._trigger("drag", f, a(h));
        },
        stop: function (f, h) {
          d.position = [
            h.position.left - e.scrollLeft(),
            h.position.top - e.scrollTop(),
          ];
          c(this).removeClass("ui-dialog-dragging").height(g);
          b._trigger("dragStop", f, a(h));
          c.ui.dialog.overlay.resize();
        },
      });
    },
    _makeResizable: function (a) {
      function b(f) {
        return {
          originalPosition: f.originalPosition,
          originalSize: f.originalSize,
          position: f.position,
          size: f.size,
        };
      }
      a = a === l ? this.options.resizable : a;
      var d = this,
        e = d.options,
        g = d.uiDialog.css("position");
      a = typeof a === "string" ? a : "n,e,s,w,se,sw,ne,nw";
      d.uiDialog
        .resizable({
          cancel: ".ui-dialog-content",
          containment: "document",
          alsoResize: d.element,
          maxWidth: e.maxWidth,
          maxHeight: e.maxHeight,
          minWidth: e.minWidth,
          minHeight: d._minHeight(),
          handles: a,
          start: function (f, h) {
            c(this).addClass("ui-dialog-resizing");
            d._trigger("resizeStart", f, b(h));
          },
          resize: function (f, h) {
            d._trigger("resize", f, b(h));
          },
          stop: function (f, h) {
            c(this).removeClass("ui-dialog-resizing");
            e.height = c(this).height();
            e.width = c(this).width();
            d._trigger("resizeStop", f, b(h));
            c.ui.dialog.overlay.resize();
          },
        })
        .css("position", g)
        .find(".ui-resizable-se")
        .addClass("ui-icon ui-icon-grip-diagonal-se");
    },
    _minHeight: function () {
      var a = this.options;
      return a.height === "auto"
        ? a.minHeight
        : Math.min(a.minHeight, a.height);
    },
    _position: function (a) {
      var b = [],
        d = [0, 0],
        e;
      if (a) {
        if (typeof a === "string" || (typeof a === "object" && "0" in a)) {
          b = a.split ? a.split(" ") : [a[0], a[1]];
          if (b.length === 1) b[1] = b[0];
          c.each(["left", "top"], function (g, f) {
            if (+b[g] === b[g]) {
              d[g] = b[g];
              b[g] = f;
            }
          });
          a = { my: b.join(" "), at: b.join(" "), offset: d.join(" ") };
        }
        a = c.extend({}, c.ui.dialog.prototype.options.position, a);
      } else a = c.ui.dialog.prototype.options.position;
      (e = this.uiDialog.is(":visible")) || this.uiDialog.show();
      this.uiDialog
        .css({ top: 0, left: 0 })
        .position(c.extend({ of: window }, a));
      e || this.uiDialog.hide();
    },
    _setOptions: function (a) {
      var b = this,
        d = {},
        e = false;
      c.each(a, function (g, f) {
        b._setOption(g, f);
        if (g in m) e = true;
        if (g in n) d[g] = f;
      });
      e && this._size();
      this.uiDialog.is(":data(resizable)") &&
        this.uiDialog.resizable("option", d);
    },
    _setOption: function (a, b) {
      var d = this,
        e = d.uiDialog;
      switch (a) {
        case "beforeclose":
          a = "beforeClose";
          break;
        case "buttons":
          d._createButtons(b);
          break;
        case "closeText":
          d.uiDialogTitlebarCloseText.text("" + b);
          break;
        case "dialogClass":
          e.removeClass(d.options.dialogClass).addClass(
            "ui-dialog ui-widget ui-widget-content ui-corner-all " + b
          );
          break;
        case "disabled":
          b
            ? e.addClass("ui-dialog-disabled")
            : e.removeClass("ui-dialog-disabled");
          break;
        case "draggable":
          var g = e.is(":data(draggable)");
          g && !b && e.draggable("destroy");
          !g && b && d._makeDraggable();
          break;
        case "position":
          d._position(b);
          break;
        case "resizable":
          (g = e.is(":data(resizable)")) && !b && e.resizable("destroy");
          g && typeof b === "string" && e.resizable("option", "handles", b);
          !g && b !== false && d._makeResizable(b);
          break;
        case "title":
          c(".ui-dialog-title", d.uiDialogTitlebar).html("" + (b || "&#160;"));
          break;
      }
      c.Widget.prototype._setOption.apply(d, arguments);
    },
    _size: function () {
      var a = this.options,
        b,
        d,
        e = this.uiDialog.is(":visible");
      this.element.show().css({ width: "auto", minHeight: 0, height: 0 });
      if (a.minWidth > a.width) a.width = a.minWidth;
      b = this.uiDialog.css({ height: "auto", width: a.width }).height();
      d = Math.max(0, a.minHeight - b);
      if (a.height === "auto")
        if (c.support.minHeight)
          this.element.css({ minHeight: d, height: "auto" });
        else {
          this.uiDialog.show();
          a = this.element.css("height", "auto").height();
          e || this.uiDialog.hide();
          this.element.height(Math.max(a, d));
        }
      else this.element.height(Math.max(a.height - b, 0));
      this.uiDialog.is(":data(resizable)") &&
        this.uiDialog.resizable("option", "minHeight", this._minHeight());
    },
  });
  c.extend(c.ui.dialog, {
    version: "1.8.16",
    uuid: 0,
    maxZ: 0,
    getTitleId: function (a) {
      a = a.attr("id");
      if (!a) {
        this.uuid += 1;
        a = this.uuid;
      }
      return "ui-dialog-title-" + a;
    },
    overlay: function (a) {
      this.$el = c.ui.dialog.overlay.create(a);
    },
  });
  c.extend(c.ui.dialog.overlay, {
    instances: [],
    oldInstances: [],
    maxZ: 0,
    events: c
      .map(
        "focus,mousedown,mouseup,keydown,keypress,click".split(","),
        function (a) {
          return a + ".dialog-overlay";
        }
      )
      .join(" "),
    create: function (a) {
      if (this.instances.length === 0) {
        setTimeout(function () {
          c.ui.dialog.overlay.instances.length &&
            c(document).bind(c.ui.dialog.overlay.events, function (d) {
              if (c(d.target).zIndex() < c.ui.dialog.overlay.maxZ) return false;
            });
        }, 1);
        c(document).bind("keydown.dialog-overlay", function (d) {
          if (
            a.options.closeOnEscape &&
            !d.isDefaultPrevented() &&
            d.keyCode &&
            d.keyCode === c.ui.keyCode.ESCAPE
          ) {
            a.close(d);
            d.preventDefault();
          }
        });
        c(window).bind("resize.dialog-overlay", c.ui.dialog.overlay.resize);
      }
      var b = (
        this.oldInstances.pop() ||
        c("<div></div>").addClass("ui-widget-overlay")
      )
        .appendTo(document.body)
        .css({ width: this.width(), height: this.height() });
      c.fn.bgiframe && b.bgiframe();
      this.instances.push(b);
      return b;
    },
    destroy: function (a) {
      var b = c.inArray(a, this.instances);
      b != -1 && this.oldInstances.push(this.instances.splice(b, 1)[0]);
      this.instances.length === 0 &&
        c([document, window]).unbind(".dialog-overlay");
      a.remove();
      var d = 0;
      c.each(this.instances, function () {
        d = Math.max(d, this.css("z-index"));
      });
      this.maxZ = d;
    },
    height: function () {
      var a, b;
      if (c.browser.msie && c.browser.version < 7) {
        a = Math.max(
          document.documentElement.scrollHeight,
          document.body.scrollHeight
        );
        b = Math.max(
          document.documentElement.offsetHeight,
          document.body.offsetHeight
        );
        return a < b ? c(window).height() + "px" : a + "px";
      } else return c(document).height() + "px";
    },
    width: function () {
      var a, b;
      if (c.browser.msie) {
        a = Math.max(
          document.documentElement.scrollWidth,
          document.body.scrollWidth
        );
        b = Math.max(
          document.documentElement.offsetWidth,
          document.body.offsetWidth
        );
        return a < b ? c(window).width() + "px" : a + "px";
      } else return c(document).width() + "px";
    },
    resize: function () {
      var a = c([]);
      c.each(c.ui.dialog.overlay.instances, function () {
        a = a.add(this);
      });
      a.css({ width: 0, height: 0 }).css({
        width: c.ui.dialog.overlay.width(),
        height: c.ui.dialog.overlay.height(),
      });
    },
  });
  c.extend(c.ui.dialog.overlay.prototype, {
    destroy: function () {
      c.ui.dialog.overlay.destroy(this.$el);
    },
  });
})(jQuery);
