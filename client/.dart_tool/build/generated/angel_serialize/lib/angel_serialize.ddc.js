define(['dart_sdk'], function(dart_sdk) {
  'use strict';
  const core = dart_sdk.core;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const _root = Object.create(null);
  const angel_serialize = Object.create(_root);
  let ListOfint = () => (ListOfint = dart.constFn(core.List$(core.int)))();
  angel_serialize.SerializableField = class SerializableField extends core.Object {
    get alias() {
      return this[alias$];
    }
    set alias(value) {
      super.alias = value;
    }
    get defaultValue() {
      return this[defaultValue$];
    }
    set defaultValue(value) {
      super.defaultValue = value;
    }
    get serializer() {
      return this[serializer$];
    }
    set serializer(value) {
      super.serializer = value;
    }
    get deserializer() {
      return this[deserializer$];
    }
    set deserializer(value) {
      super.deserializer = value;
    }
    get errorMessage() {
      return this[errorMessage$];
    }
    set errorMessage(value) {
      super.errorMessage = value;
    }
    get isNullable() {
      return this[isNullable$];
    }
    set isNullable(value) {
      super.isNullable = value;
    }
    get exclude() {
      return this[exclude$];
    }
    set exclude(value) {
      super.exclude = value;
    }
    get canDeserialize() {
      return this[canDeserialize$];
    }
    set canDeserialize(value) {
      super.canDeserialize = value;
    }
    get canSerialize() {
      return this[canSerialize$];
    }
    set canSerialize(value) {
      super.canSerialize = value;
    }
    get serializesTo() {
      return this[serializesTo$];
    }
    set serializesTo(value) {
      super.serializesTo = value;
    }
  };
  (angel_serialize.SerializableField.new = function(opts) {
    let alias = opts && 'alias' in opts ? opts.alias : null;
    let defaultValue = opts && 'defaultValue' in opts ? opts.defaultValue : null;
    let serializer = opts && 'serializer' in opts ? opts.serializer : null;
    let deserializer = opts && 'deserializer' in opts ? opts.deserializer : null;
    let errorMessage = opts && 'errorMessage' in opts ? opts.errorMessage : null;
    let isNullable = opts && 'isNullable' in opts ? opts.isNullable : false;
    let exclude = opts && 'exclude' in opts ? opts.exclude : false;
    let canDeserialize = opts && 'canDeserialize' in opts ? opts.canDeserialize : false;
    let canSerialize = opts && 'canSerialize' in opts ? opts.canSerialize : false;
    let serializesTo = opts && 'serializesTo' in opts ? opts.serializesTo : null;
    this[alias$] = alias;
    this[defaultValue$] = defaultValue;
    this[serializer$] = serializer;
    this[deserializer$] = deserializer;
    this[errorMessage$] = errorMessage;
    this[isNullable$] = isNullable;
    this[exclude$] = exclude;
    this[canDeserialize$] = canDeserialize;
    this[canSerialize$] = canSerialize;
    this[serializesTo$] = serializesTo;
  }).prototype = angel_serialize.SerializableField.prototype;
  dart.addTypeTests(angel_serialize.SerializableField);
  const alias$ = Symbol("SerializableField.alias");
  const defaultValue$ = Symbol("SerializableField.defaultValue");
  const serializer$ = Symbol("SerializableField.serializer");
  const deserializer$ = Symbol("SerializableField.deserializer");
  const errorMessage$ = Symbol("SerializableField.errorMessage");
  const isNullable$ = Symbol("SerializableField.isNullable");
  const exclude$ = Symbol("SerializableField.exclude");
  const canDeserialize$ = Symbol("SerializableField.canDeserialize");
  const canSerialize$ = Symbol("SerializableField.canSerialize");
  const serializesTo$ = Symbol("SerializableField.serializesTo");
  dart.setFieldSignature(angel_serialize.SerializableField, () => ({
    __proto__: dart.getFields(angel_serialize.SerializableField.__proto__),
    alias: dart.finalFieldType(core.String),
    defaultValue: dart.finalFieldType(dart.dynamic),
    serializer: dart.finalFieldType(core.Symbol),
    deserializer: dart.finalFieldType(core.Symbol),
    errorMessage: dart.finalFieldType(core.String),
    isNullable: dart.finalFieldType(core.bool),
    exclude: dart.finalFieldType(core.bool),
    canDeserialize: dart.finalFieldType(core.bool),
    canSerialize: dart.finalFieldType(core.bool),
    serializesTo: dart.finalFieldType(core.Type)
  }));
  angel_serialize.Exclude = class Exclude extends angel_serialize.SerializableField {};
  (angel_serialize.Exclude.new = function(opts) {
    let canDeserialize = opts && 'canDeserialize' in opts ? opts.canDeserialize : false;
    let canSerialize = opts && 'canSerialize' in opts ? opts.canSerialize : false;
    angel_serialize.Exclude.__proto__.new.call(this, {canDeserialize: canDeserialize, canSerialize: canSerialize});
  }).prototype = angel_serialize.Exclude.prototype;
  dart.addTypeTests(angel_serialize.Exclude);
  dart.defineLazy(angel_serialize, {
    /*angel_serialize.nullable*/get nullable() {
      return dart.const(new angel_serialize.SerializableField.new({isNullable: true}));
    },
    /*angel_serialize.exclude*/get exclude() {
      return dart.const(new angel_serialize.Exclude.new());
    }
  });
  angel_serialize.DefaultsTo = class DefaultsTo extends angel_serialize.SerializableField {};
  (angel_serialize.DefaultsTo.new = function(value) {
    angel_serialize.DefaultsTo.__proto__.new.call(this, {defaultValue: value});
  }).prototype = angel_serialize.DefaultsTo.prototype;
  dart.addTypeTests(angel_serialize.DefaultsTo);
  angel_serialize.HasAlias = class HasAlias extends angel_serialize.SerializableField {};
  (angel_serialize.HasAlias.new = function(name) {
    angel_serialize.HasAlias.__proto__.new.call(this, {alias: name});
  }).prototype = angel_serialize.HasAlias.prototype;
  dart.addTypeTests(angel_serialize.HasAlias);
  let const$;
  let const$0;
  angel_serialize.Serializable = class Serializable extends core.Object {
    get serializers() {
      return this[serializers$];
    }
    set serializers(value) {
      super.serializers = value;
    }
    get autoSnakeCaseNames() {
      return this[autoSnakeCaseNames$];
    }
    set autoSnakeCaseNames(value) {
      super.autoSnakeCaseNames = value;
    }
    get autoIdAndDateFields() {
      return this[autoIdAndDateFields$];
    }
    set autoIdAndDateFields(value) {
      super.autoIdAndDateFields = value;
    }
    get includeAnnotations() {
      return this[includeAnnotations$];
    }
    set includeAnnotations(value) {
      super.includeAnnotations = value;
    }
  };
  (angel_serialize.Serializable.new = function(opts) {
    let serializers = opts && 'serializers' in opts ? opts.serializers : const$ || (const$ = dart.constList([angel_serialize.Serializers.map, angel_serialize.Serializers.json], core.int));
    let autoSnakeCaseNames = opts && 'autoSnakeCaseNames' in opts ? opts.autoSnakeCaseNames : true;
    let autoIdAndDateFields = opts && 'autoIdAndDateFields' in opts ? opts.autoIdAndDateFields : true;
    let includeAnnotations = opts && 'includeAnnotations' in opts ? opts.includeAnnotations : const$0 || (const$0 = dart.constList([], dart.dynamic));
    this[serializers$] = serializers;
    this[autoSnakeCaseNames$] = autoSnakeCaseNames;
    this[autoIdAndDateFields$] = autoIdAndDateFields;
    this[includeAnnotations$] = includeAnnotations;
  }).prototype = angel_serialize.Serializable.prototype;
  dart.addTypeTests(angel_serialize.Serializable);
  const serializers$ = Symbol("Serializable.serializers");
  const autoSnakeCaseNames$ = Symbol("Serializable.autoSnakeCaseNames");
  const autoIdAndDateFields$ = Symbol("Serializable.autoIdAndDateFields");
  const includeAnnotations$ = Symbol("Serializable.includeAnnotations");
  dart.setFieldSignature(angel_serialize.Serializable, () => ({
    __proto__: dart.getFields(angel_serialize.Serializable.__proto__),
    serializers: dart.finalFieldType(ListOfint()),
    autoSnakeCaseNames: dart.finalFieldType(core.bool),
    autoIdAndDateFields: dart.finalFieldType(core.bool),
    includeAnnotations: dart.finalFieldType(core.List)
  }));
  dart.defineLazy(angel_serialize, {
    /*angel_serialize.serializable*/get serializable() {
      return dart.const(new angel_serialize.Serializable.new());
    }
  });
  angel_serialize.GeneratedSerializable = class GeneratedSerializable extends core.Object {};
  (angel_serialize.GeneratedSerializable.new = function() {
  }).prototype = angel_serialize.GeneratedSerializable.prototype;
  dart.addTypeTests(angel_serialize.GeneratedSerializable);
  dart.defineLazy(angel_serialize, {
    /*angel_serialize.generatedSerializable*/get generatedSerializable() {
      return dart.const(new angel_serialize.GeneratedSerializable.new());
    }
  });
  angel_serialize.Serializers = class Serializers extends core.Object {};
  (angel_serialize.Serializers.new = function() {
  }).prototype = angel_serialize.Serializers.prototype;
  dart.addTypeTests(angel_serialize.Serializers);
  dart.defineLazy(angel_serialize.Serializers, {
    /*angel_serialize.Serializers.all*/get all() {
      return dart.constList([0, 1, 2], core.int);
    },
    /*angel_serialize.Serializers.map*/get map() {
      return 0;
    },
    /*angel_serialize.Serializers.json*/get json() {
      return 1;
    },
    /*angel_serialize.Serializers.typescript*/get typescript() {
      return 2;
    }
  });
  angel_serialize.DefaultValue = class DefaultValue extends core.Object {
    get value() {
      return this[value$];
    }
    set value(value) {
      super.value = value;
    }
  };
  (angel_serialize.DefaultValue.new = function(value) {
    this[value$] = value;
  }).prototype = angel_serialize.DefaultValue.prototype;
  dart.addTypeTests(angel_serialize.DefaultValue);
  const value$ = Symbol("DefaultValue.value");
  dart.setFieldSignature(angel_serialize.DefaultValue, () => ({
    __proto__: dart.getFields(angel_serialize.DefaultValue.__proto__),
    value: dart.finalFieldType(dart.dynamic)
  }));
  angel_serialize.Alias = class Alias extends core.Object {
    get name() {
      return this[name$];
    }
    set name(value) {
      super.name = value;
    }
  };
  (angel_serialize.Alias.new = function(name) {
    this[name$] = name;
  }).prototype = angel_serialize.Alias.prototype;
  dart.addTypeTests(angel_serialize.Alias);
  const name$ = Symbol("Alias.name");
  dart.setFieldSignature(angel_serialize.Alias, () => ({
    __proto__: dart.getFields(angel_serialize.Alias.__proto__),
    name: dart.finalFieldType(core.String)
  }));
  dart.trackLibraries("packages/angel_serialize/angel_serialize.ddc", {
    "package:angel_serialize/angel_serialize.dart": angel_serialize
  }, '{"version":3,"sourceRoot":"","sources":["angel_serialize.dart"],"names":[],"mappings":";;;;;;;;;IA4Be;;;;;;IAGP;;;;;;IAGO;;;;;;IAGA;;;;;;IAGA;;;;;;IAGF;;;;;;IAGA;;;;;;IAGA;;;;;;IAGA;;;;;;IAQA;;;;;;;;QAGD;QACD;QACA;QACA;QACA;QACA,8DAAY;QACZ,qDAAS;QACT,0EAAgB;QAChB,oEAAc;QACd;IATC,YAAK,GAAL,KAAK;IACN,mBAAY,GAAZ,YAAY;IACZ,iBAAU,GAAV,UAAU;IACV,mBAAY,GAAZ,YAAY;IACZ,mBAAY,GAAZ,YAAY;IACZ,iBAAU,GAAV,UAAU;IACV,cAAO,GAAP,OAAO;IACP,qBAAc,GAAd,cAAc;IACd,mBAAY,GAAZ,YAAY;IACZ,mBAAY,GAAZ,YAAY;EAAE;;;;;;;;;;;;;;;;;;;;;;;;;;;QAjEH,0EAAgB;QAAY,oEAAc;AACxD,sEAAsB,cAAc,gBAAgB,YAAY;EAAC;;;MAGjD,wBAAQ;YAAG,gBAAM,qCAAiB,cAAa;;MAEzD,uBAAO;YAAG,gBAAM,2BAAO;;;;6CAIlB,KAAK;AAAI,uEAAoB,KAAK;EAAC;;;2CAKrC,IAAW;AAAI,8DAAa,IAAI;EAAC;;;;;IAgEhC;;;;;;IAGL;;;;;;IAIA;;;;;;IAGA;;;;;;;;QAlBD,iEAAa,oCAAO,2BAAW,IAAI,EAAE,2BAAW,KAAK;QACtD,sFAAoB;QACR,yFAAqB;QACjC,sFAAoB;IAHnB,kBAAW,GAAX,WAAW;IACZ,yBAAkB,GAAlB,kBAAkB;IACN,0BAAmB,GAAnB,mBAAmB;IAC/B,yBAAkB,GAAlB,kBAAkB;EAAY;;;;;;;;;;;;;;MAkBtB,4BAAY;YAAG,gBAAM,gCAAY;;;;;EAIrB;;;MAGH,qCAAqB;YAC7C,gBAAM,yCAAqB;;;;;EAe/B;;;MAVyB,+BAAG;YAAG,iBAAO,CAAG,EAAE,CAAI,EAAE,CAAU;;MAGxC,+BAAG;YAAG;;MAGN,gCAAI;YAAG;;MAGP,sCAAU;YAAG;;;;IAKxB;;;;;;;+CAEa,KAAU;IAAL,YAAK,GAAL,KAAK;EAAC;;;;;;;;IAOjB;;;;;;;wCAED,IAAS;IAAJ,WAAI,GAAJ,IAAI;EAAC","file":"angel_serialize.ddc.js"}');
  // Exports:
  return {
    angel_serialize: angel_serialize
  };
});

//# sourceMappingURL=angel_serialize.ddc.js.map
