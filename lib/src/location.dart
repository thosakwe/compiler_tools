import 'package:source_span/source_span.dart';

/// Represents a location within source code.
class Location {
  /// The filename where the source code is found.
  String filename;

  /// Most editors recognize line `1` as the beginning of a file.
  final int line;

  /// Most editors recognize index `1` as the beginning of a [line].
  final int index;

  /// The character offset of this location.
  final int offset;

  Location(this.offset, this.line, this.index, {this.filename});

  /// Creates a [SourceSpan] encompassing [a] and [b] within [source] code.
  static SourceSpan toSourceSpan(String source, Location a, Location b) =>
      new SourceSpan(a.toSourceLocation(), b.toSourceLocation(),
          source.substring(a.offset, b.offset));

  /// Compares this [Location] to another.
  @override
  bool operator ==(other) {
    return other is Location && other.index == index && other.line == line;
  }

  /// Converts to a [SourceLocation].
  SourceLocation toSourceLocation() => new SourceLocation(offset,
      line: line,
      column: index,
      sourceUrl: filename != null ? Uri.parse(filename) : null);

  @override
  String toString() => '$line:$index';
}
