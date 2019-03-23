import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:angel_serialize_generator/angel_serialize_generator.dart'
    as _i2;
import 'package:source_gen/builder.dart' as _i3;
import 'package:build_modules/builders.dart' as _i4;
import 'package:build_web_compilers/builders.dart' as _i5;
import 'package:build_config/build_config.dart' as _i6;
import 'package:build/build.dart' as _i7;
import 'dart:isolate' as _i8;
import 'package:build_runner/build_runner.dart' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply('angel_serialize_generator|angel_serialize',
      [_i2.jsonModelBuilder, _i2.serializerBuilder], _i1.toRoot(),
      hideOutput: true,
      appliesBuilders: [
        'source_gen|combining_builder',
        'source_gen|part_cleanup'
      ]),
  _i1.apply('source_gen|combining_builder', [_i3.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: ['source_gen|part_cleanup']),
  _i1.apply('build_modules|module_library', [_i4.moduleLibraryBuilder],
      _i1.toAllPackages(),
      isOptional: true,
      hideOutput: true,
      appliesBuilders: ['build_modules|module_cleanup']),
  _i1.apply(
      'build_modules|vm',
      [
        _i4.metaModuleBuilderFactoryForPlatform('vm'),
        _i4.metaModuleCleanBuilderFactoryForPlatform('vm'),
        _i4.moduleBuilderFactoryForPlatform('vm')
      ],
      _i1.toNoneByDefault(),
      isOptional: true,
      hideOutput: true,
      appliesBuilders: ['build_modules|module_cleanup']),
  _i1.apply(
      'build_modules|dart2js',
      [
        _i4.metaModuleBuilderFactoryForPlatform('dart2js'),
        _i4.metaModuleCleanBuilderFactoryForPlatform('dart2js'),
        _i4.moduleBuilderFactoryForPlatform('dart2js')
      ],
      _i1.toNoneByDefault(),
      isOptional: true,
      hideOutput: true,
      appliesBuilders: ['build_modules|module_cleanup']),
  _i1.apply(
      'build_modules|dartdevc',
      [
        _i4.metaModuleBuilderFactoryForPlatform('dartdevc'),
        _i4.metaModuleCleanBuilderFactoryForPlatform('dartdevc'),
        _i4.moduleBuilderFactoryForPlatform('dartdevc'),
        _i4.unlinkedSummaryBuilderForPlatform('dartdevc'),
        _i4.linkedSummaryBuilderForPlatform('dartdevc')
      ],
      _i1.toNoneByDefault(),
      isOptional: true,
      hideOutput: true,
      appliesBuilders: ['build_modules|module_cleanup']),
  _i1.apply(
      'build_web_compilers|ddc', [_i5.devCompilerBuilder], _i1.toAllPackages(),
      isOptional: true,
      hideOutput: true,
      appliesBuilders: [
        'build_web_compilers|dart_source_cleanup',
        'build_modules|dartdevc',
        'build_modules|dart2js'
      ]),
  _i1.apply('build_web_compilers|entrypoint', [_i5.webEntrypointBuilder],
      _i1.toRoot(),
      hideOutput: true,
      defaultGenerateFor: const _i6.InputSet(include: [
        'web/**',
        'test/**_test.dart',
        'example/**',
        'benchmark/**'
      ], exclude: [
        'test/**.node_test.dart',
        'test/**.vm_test.dart'
      ]),
      defaultOptions: _i7.BuilderOptions({
        'dart2js_args': ['--minify']
      }),
      defaultReleaseOptions: _i7.BuilderOptions({'compiler': 'dart2js'}),
      appliesBuilders: ['build_web_compilers|dart2js_archive_extractor']),
  _i1.apply('angel_serialize_generator|typescript',
      [_i2.typescriptDefinitionBuilder], _i1.toRoot(),
      hideOutput: false),
  _i1.applyPostProcess('build_modules|module_cleanup', _i4.moduleCleanup,
      defaultGenerateFor: const _i6.InputSet()),
  _i1.applyPostProcess(
      'build_web_compilers|dart_source_cleanup', _i5.dartSourceCleanup,
      defaultReleaseOptions: _i7.BuilderOptions({'enabled': true}),
      defaultGenerateFor: const _i6.InputSet()),
  _i1.applyPostProcess('build_web_compilers|dart2js_archive_extractor',
      _i5.dart2JsArchiveExtractor,
      defaultReleaseOptions: _i7.BuilderOptions({'filter_outputs': true}),
      defaultGenerateFor: const _i6.InputSet()),
  _i1.applyPostProcess('source_gen|part_cleanup', _i3.partCleanup,
      defaultGenerateFor: const _i6.InputSet())
];
main(List<String> args, [_i8.SendPort sendPort]) async {
  var result = await _i9.run(args, _builders);
  sendPort?.send(result);
}
