define(['dart_sdk'], function(dart_sdk) {
  'use strict';
  const core = dart_sdk.core;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const _root = Object.create(null);
  const wlib = Object.create(_root);
  const $padLeft = dartx.padLeft;
  const $toString = dartx.toString;
  const $startsWith = dartx.startsWith;
  const $substring = dartx.substring;
  let intToString = () => (intToString = dart.constFn(dart.fnType(core.String, [core.int])))();
  wlib.WLib = class WLib extends core.Object {
    static passwordComplexityError(s) {
      s = s != null ? s : "";
      if (s.length < 5) return "Password must be 5 or more characters.";
      return null;
    }
    static nickValidationError(s) {
      if (s == null || s.length < 5) return "Nickname must be at least 5 characters";
      let pat = core.RegExp.new("^[0-9A-Za-z\\-]*$");
      if (!dart.test(pat.hasMatch(s))) return "Nicknames can only include letters, digits, and hyphens";
      return null;
    }
    static utcNow() {
      return new core.DateTime.now().toUtc();
    }
    static utc1970() {
      return new core.DateTime.new(1970).toUtc();
    }
    static dateTimeToWire(d) {
      if (d == null) return null;
      if (d.timeZoneOffset.inMilliseconds !== 0) dart.throw(core.Exception.new("Only UTC times can be converted to wire format"));
      return d.toIso8601String();
    }
    static wireToDateTime(s) {
      if (s == null) return null;
      let d = core.DateTime.parse(s);
      return d;
    }
    static packDateEntry(year, month, day, hour, minute) {
      function pad2(i) {
        return dart.toString(i)[$padLeft](2, "0");
      }
      dart.fn(pad2, intToString());
      let yearS = dart.toString(year)[$padLeft](4, "0"), monthS = pad2(month), dayS = pad2(day), hourS = pad2(hour), minuteS = pad2(minute);
      return "LDT:" + yearS + dart.str(monthS) + dart.str(dayS) + dart.str(hourS) + dart.str(minuteS);
    }
    static unpackDateEntry(packed) {
      if (!packed[$startsWith]("LDT:")) dart.throw(core.Exception.new("packed date is not in the right format"));
      let year = core.int.parse(packed[$substring](4, 8)), month = core.int.parse(packed[$substring](8, 10)), day = core.int.parse(packed[$substring](10, 12)), hour = core.int.parse(packed[$substring](12, 14)), minute = core.int.parse(packed[$substring](14, 16));
      return new core.DateTime.new(year, month, day, hour, minute);
    }
    static chop(s, maxlength, opts) {
      let addEllipsis = opts && 'addEllipsis' in opts ? opts.addEllipsis : false;
      if (s.length <= dart.notNull(maxlength)) return s;
      s = s[$substring](0, maxlength);
      if (dart.test(addEllipsis)) {
        s = dart.notNull(s) + "...";
      }
      return s;
    }
  };
  (wlib.WLib.new = function() {
  }).prototype = wlib.WLib.prototype;
  dart.addTypeTests(wlib.WLib);
  dart.trackLibraries("packages/models/wlib.ddc", {
    "package:models/wlib.dart": wlib
  }, '{"version":3,"sourceRoot":"","sources":["wlib.dart"],"names":[],"mappings":";;;;;;;;;;;;;mCAMwC,CAAQ;AAC5C,OAAC,GAAG,CAAC,WAAD,CAAC,GAAI;AACT,UAAI,AAAS,CAAR,OAAO,GAAG,GAAG,MAAO;AACzB,YAAO;IACT;+BAIkC,CAAQ;AACxC,UAAI,CAAC,IAAI,QAAQ,AAAS,CAAR,OAAO,GAAG,GAAG,MAAO;AACtC,UAAO,MAAM,AAAI,eAAM,CAAC;AACxB,qBAAK,GAAG,SAAS,CAAC,CAAC,IAAG,MAAO;AAC7B,YAAO;IACT;;AAIE,YAAO,KAAI,iBAAY,QAAQ;IACjC;;AAIE,YAAO,KAAI,iBAAQ,CAAC,WAAW;IACjC;0BAI6B,CAAU;AACrC,UAAI,CAAC,IAAI,MAAM,MAAO;AACtB,UAAI,CAAC,eAAe,eAAe,KAAI,GAAG,WAAM,AAAI,kBAAS,CAAC;AAE9D,YAAO,EAAC,gBAAgB;IAC1B;0BAI+B,CAAQ;AACrC,UAAI,CAAC,IAAI,MAAM,MAAO;AACtB,UAAS,IAAI,aAAQ,MAAM,CAAC,CAAC;AAE7B,YAAO,EAAC;IACV;yBAI4B,IAAQ,EAAE,KAAS,EAAE,GAAO,EAAE,IAAQ,EAAE,MAAU;AAC5E,eAAO,KAAK,CAAK;6BAAK,CAAC,WAAmB,CAAC,GAAG;;cAAvC;AACP,UAAO,sBAAQ,IAAI,WAAmB,CAAC,GAAG,MACxC,SAAS,IAAI,CAAC,KAAK,GAAG,OAAO,IAAI,CAAC,GAAG,GAAG,QAAQ,IAAI,CAAC,IAAI,GAAG,UAAU,IAAI,CAAC,MAAM;AACnF,YAAO,UAAO,KAAK,YAAG,MAAM,aAAG,IAAI,aAAG,KAAK,aAAG,OAAO;IACvD;2BAKgC,MAAa;AAE3C,WAAK,MAAM,aAAW,CAAC,SAAS,WAAM,AAAI,kBAAS,CAAC;AACpD,UAAI,OAAO,QAAG,MAAM,CAAC,MAAM,YAAU,CAAC,GAAG,KACvC,QAAQ,QAAG,MAAM,CAAC,MAAM,YAAU,CAAC,GAAG,MACtC,MAAM,QAAG,MAAM,CAAC,MAAM,YAAU,CAAC,IAAI,MACrC,OAAO,QAAG,MAAM,CAAC,MAAM,YAAU,CAAC,IAAI,MACtC,SAAS,QAAG,MAAM,CAAC,MAAM,YAAU,CAAC,IAAI;AAC1C,YAAO,KAAI,iBAAQ,CAAC,IAAI,EAAE,KAAK,EAAE,GAAG,EAAE,IAAI,EAAE,MAAM;IACpD;gBAGmB,CAAQ,EAAE,SAAa;UAAQ,iEAAY;AAC5D,UAAI,AAAS,CAAR,OAAO,iBAAI,SAAS,GAAE,MAAO,EAAC;AACnC,OAAC,GAAG,CAAC,YAAU,CAAC,GAAG,SAAS;AAC5B,oBAAI,WAAW,GAAE;SAAC,GA5EtB,aA4EqB,CAAC,IAAI;;AACtB,YAAO,EAAC;IACV;;;EAEF","file":"wlib.ddc.js"}');
  // Exports:
  return {
    wlib: wlib
  };
});

//# sourceMappingURL=wlib.ddc.js.map
