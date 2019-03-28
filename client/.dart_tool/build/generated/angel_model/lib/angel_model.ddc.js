define(['dart_sdk'], function(dart_sdk) {
  'use strict';
  const core = dart_sdk.core;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const _root = Object.create(null);
  const angel_model = Object.create(_root);
  angel_model.Model = class Model extends core.Object {
    get id() {
      return this[id$];
    }
    set id(value) {
      this[id$] = value;
    }
    get createdAt() {
      return this[createdAt$];
    }
    set createdAt(value) {
      this[createdAt$] = value;
    }
    get updatedAt() {
      return this[updatedAt$];
    }
    set updatedAt(value) {
      this[updatedAt$] = value;
    }
    get idAsInt() {
      return core.int.parse(this.id);
    }
  };
  (angel_model.Model.new = function(opts) {
    let id = opts && 'id' in opts ? opts.id : null;
    let createdAt = opts && 'createdAt' in opts ? opts.createdAt : null;
    let updatedAt = opts && 'updatedAt' in opts ? opts.updatedAt : null;
    this[id$] = id;
    this[createdAt$] = createdAt;
    this[updatedAt$] = updatedAt;
  }).prototype = angel_model.Model.prototype;
  dart.addTypeTests(angel_model.Model);
  const id$ = Symbol("Model.id");
  const createdAt$ = Symbol("Model.createdAt");
  const updatedAt$ = Symbol("Model.updatedAt");
  dart.setGetterSignature(angel_model.Model, () => ({
    __proto__: dart.getGetters(angel_model.Model.__proto__),
    idAsInt: core.int
  }));
  dart.setFieldSignature(angel_model.Model, () => ({
    __proto__: dart.getFields(angel_model.Model.__proto__),
    id: dart.fieldType(core.String),
    createdAt: dart.fieldType(core.DateTime),
    updatedAt: dart.fieldType(core.DateTime)
  }));
  dart.trackLibraries("packages/angel_model/angel_model.ddc", {
    "package:angel_model/angel_model.dart": angel_model
  }, '{"version":3,"sourceRoot":"","sources":["angel_model.dart"],"names":[],"mappings":";;;;;;;;IAGS;;;;;;IAGE;;;;;;IAGA;;;;;;;YAKU,SAAG,MAAM,CAAC,OAAE;IAAC;;;QAHpB;QAAS;QAAgB;IAAzB,SAAE,GAAF,EAAE;IAAO,gBAAS,GAAT,SAAS;IAAO,gBAAS,GAAT,SAAS;EAAE","file":"angel_model.ddc.js"}');
  // Exports:
  return {
    angel_model: angel_model
  };
});

//# sourceMappingURL=angel_model.ddc.js.map
