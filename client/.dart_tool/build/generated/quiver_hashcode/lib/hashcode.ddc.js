define(['dart_sdk'], function(dart_sdk) {
  'use strict';
  const core = dart_sdk.core;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const _root = Object.create(null);
  const hashcode = Object.create(_root);
  const $hashCode = dartx.hashCode;
  const $fold = dartx.fold;
  const $rightShift = dartx['>>'];
  let intAnddynamicToint = () => (intAnddynamicToint = dart.constFn(dart.fnType(core.int, [core.int, dart.dynamic])))();
  hashcode.hashObjects = function(objects) {
    return hashcode._finish(objects[$fold](core.int, 0, dart.fn((h, i) => hashcode._combine(h, dart.hashCode(i)), intAnddynamicToint())));
  };
  hashcode.hash2 = function(a, b) {
    return hashcode._finish(hashcode._combine(hashcode._combine(0, dart.hashCode(a)), dart.hashCode(b)));
  };
  hashcode.hash3 = function(a, b, c) {
    return hashcode._finish(hashcode._combine(hashcode._combine(hashcode._combine(0, dart.hashCode(a)), dart.hashCode(b)), dart.hashCode(c)));
  };
  hashcode.hash4 = function(a, b, c, d) {
    return hashcode._finish(hashcode._combine(hashcode._combine(hashcode._combine(hashcode._combine(0, dart.hashCode(a)), dart.hashCode(b)), dart.hashCode(c)), dart.hashCode(d)));
  };
  hashcode._combine = function(hash, value) {
    hash = 536870911 & dart.notNull(hash) + dart.notNull(value);
    hash = 536870911 & dart.notNull(hash) + ((524287 & dart.notNull(hash)) << 10);
    return (dart.notNull(hash) ^ hash[$rightShift](6)) >>> 0;
  };
  hashcode._finish = function(hash) {
    hash = 536870911 & dart.notNull(hash) + ((67108863 & dart.notNull(hash)) << 3);
    hash = (dart.notNull(hash) ^ hash[$rightShift](11)) >>> 0;
    return 536870911 & dart.notNull(hash) + ((16383 & dart.notNull(hash)) << 15);
  };
  dart.trackLibraries("packages/quiver_hashcode/hashcode.ddc", {
    "package:quiver_hashcode/hashcode.dart": hashcode
  }, '{"version":3,"sourceRoot":"","sources":["hashcode.dart"],"names":[],"mappings":";;;;;;;;;;;kCAkBgB,OAAgB;UAC5B,iBAAO,CAAC,OAAO,OAAK,WAAC,GAAG,SAAC,CAAC,EAAE,CAAC,KAAK,iBAAQ,CAAC,CAAC,gBAAE,CAAC;EAAY;4BAGrD,CAAC,EAAE,CAAC;UAAK,iBAAO,CAAC,iBAAQ,CAAC,iBAAQ,CAAC,iBAAG,CAAC,kBAAY,CAAC;EAAW;4BAG/D,CAAC,EAAE,CAAC,EAAE,CAAC;UAAK,iBAAO,CACzB,iBAAQ,CAAC,iBAAQ,CAAC,iBAAQ,CAAC,iBAAG,CAAC,kBAAY,CAAC,kBAAY,CAAC;EAAW;4BAG9D,CAAC,EAAE,CAAC,EAAE,CAAC,EAAE,CAAC;UAAK,iBAAO,CAAC,iBAAQ,CACrC,iBAAQ,CAAC,iBAAQ,CAAC,iBAAQ,CAAC,iBAAG,CAAC,kBAAY,CAAC,kBAAY,CAAC,kBACzD,CAAC;EAAW;+BAIH,IAAQ,EAAE,KAAS;AAC9B,QAAI,GAAG,AAAW,YAAQ,aAAL,IAAI,iBAAG,KAAK;AACjC,QAAI,GAAG,AAAW,YAAQ,aAAL,IAAI,KAAwB,CAAnB,AAAW,sBAAE,IAAI,MAAK;AACpD,UAAO,EAAK,aAAL,IAAI,IAAI,AAAK,IAAD,cAAI;EACzB;8BAEY,IAAQ;AAClB,QAAI,GAAG,AAAW,YAAQ,aAAL,IAAI,KAAwB,CAAnB,AAAW,wBAAE,IAAI,MAAK;AACpD,QAAI,GAAG,CAAK,aAAL,IAAI,IAAI,AAAK,IAAD,cAAI;AACvB,UAAO,AAAW,aAAQ,aAAL,IAAI,KAAwB,CAAnB,AAAW,qBAAE,IAAI,MAAK;EACtD","file":"hashcode.ddc.js"}');
  // Exports:
  return {
    hashcode: hashcode
  };
});

//# sourceMappingURL=hashcode.ddc.js.map
