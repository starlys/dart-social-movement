///identifier for a pane, such as 'doc/123'; immutable
class PaneKey {
  ///slash-separated parts of the key;
  ///so key 'proposal/2' would make keyParts[1] = '2'
  List<String> _keyParts;

  ///the combined key with slashes
  String _key;

  ///construct from the string format
  PaneKey(String k) {
    _key = k;
    _keyParts = k.split('/');
    if (_keyParts.length < 1) throw new Exception('Invalid pane key ' + k);
  }

  ///construct from a list of parts
  PaneKey.fromList(List<String> l) {
    _key = l.join('/');
    _keyParts = l;
    if (_keyParts.length < 1) throw new Exception('Invalid pane key ' + _key);
  }

  ///get the full representation
  String get full => _key;

  ///get the pane kind, such as 'doc' (always the first segment)
  String get paneKind => _keyParts[0];

  ///get the second segment, which is usually used for the primary key; or null if not defined
  String get part1 => length >= 2 ? _keyParts[1] : null;

  ///get the second segment parsed as an int, which is usually used for the primary key;
  /// throw exception if not defined or is not an int
  int get part1AsInt => int.parse(_keyParts[1]);

  ///get a segment by index; throw exception if segment does not exist
  String part(int i) {return _keyParts[i];}

  ///get the number of segments
  int get length => _keyParts.length;

  ///true if identical to another key
  bool isIdenticalTo(PaneKey k2) {
    //if (keyParts.length != k2.keyParts.length) return false;
    //for (int i = 0; i < keyParts.length; ++i)
    //  if (keyParts[i] != k2.keyParts[i]) return false;
    //return true;
    return _key == k2._key;
  }

  ///true if the first 2 segments are identical to another key;
  /// so for example doc/123/4 is like doc/123/5
  bool isLike(PaneKey k2) {
    if (_keyParts[0] != k2._keyParts[0]) return false;
    if (length == 1) return true;
    if (_keyParts[1] != k2._keyParts[1]) return false;
    return true;
  }
}
