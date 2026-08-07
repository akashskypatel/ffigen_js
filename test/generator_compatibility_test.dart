import 'package:ffigen_js/src/jsgen/code_generator.dart';
import 'package:ffigen_js/src/jsgen/code_generator/writer.dart';
import 'package:test/test.dart';

void main() {
  test('user-facing function wrappers remain top-level', () {
    final int32 = NativeType(SupportedNativeType.int32);
    final function = Func(
      name: 'addOne',
      returnType: int32,
      parameters: [Parameter(name: 'value', type: int32)],
      usr: 'c:@F@addOne',
      originalName: 'addOne',
    );
    final writer = Writer(
      bindings: [function],
      typeBindings: [],
      className: 'NativeLibrary',
      silenceEnumWarning: true,
      nativeEntryPoints: [],
    );

    final output = writer.generate();
    final externalBinding = output.indexOf('external int _addOne(int value,');
    final publicWrapper = output.indexOf('int addOne(int value,');

    expect(externalBinding, greaterThanOrEqualTo(0));
    expect(publicWrapper, greaterThan(externalBinding));
    expect(output, isNot(contains('class NativeLibrary')));
    expect(
      output,
      contains('GeneratedBindings.instance._addOne(value)'),
    );
  });
}
