import 'package:ffigen_js/src/jsgen/code_generator.dart';
import 'package:ffigen_js/src/jsgen/header_parser/type_extractor/cxtypekindmap.dart';
import 'package:test/test.dart';

void main() {
  test('size_t maps to wasm32 uint32', () {
    expect(
      suportedTypedefToSuportedNativeType['size_t'],
      SupportedNativeType.uint32,
    );
  });
}
