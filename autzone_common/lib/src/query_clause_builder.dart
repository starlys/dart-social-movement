///stores and formats sql clauses for set or select statements
class QueryClauseBuilder {
  List<String> _clauses = new List<String>();
  Map<String, dynamic> _params = new Map<String, dynamic>();

  ///add a clause and optional value. Example: add('a=@p1', name='p1', value=9)
  void add(String clause, {String name:null, dynamic value:null}) {
    _clauses.add(clause);
    if (name != null) _params[name] = value;
  }

  ///get clause useful in where statements like 'a=b and c=d...'
  String get whereClause {
    return _clauses.join(' and ');
  }

  ///get clause useful in update statements like 'a=b,c=d...'
  String get updateClause {
    return _clauses.join(',');
  }

  ///get parameters added with add()
  Map<String, dynamic> get paramsMap => _params;

  ///get number of clauses added
  int get count => _clauses.length;
}
