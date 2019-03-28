//because this project was updated from dart 1, the package format is not consistent.
//In particular there is a models.dart in the package root (referenced server side through relative paths)
//and another one on lib, referenced as a package from the client

library models;

export 'src/models/wtypes.dart';
export 'wlib.dart';
