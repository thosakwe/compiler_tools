import 'package:source_span/source_span.dart';

/// Represents a lexeme in code.
class Token<TokenType> {
  /// This should usually be an `enum`.
  final TokenType type;
  
  final SourceSpan span;

  /// This token's text.
  String get text => span.text;

  Token(this.type, {this.span});

  @override
  String toString() =>
      '${span.start.line}:${span.start.column} "$text" -> $type';
}
