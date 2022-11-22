/// predictions : [{"description":"Las Lajas, Neuquen, Argentina","matched_substrings":[{"length":9,"offset":0}],"place_id":"ChIJNwOidxFZDZYR7Pgolo2wlHc","reference":"ChIJNwOidxFZDZYR7Pgolo2wlHc","structured_formatting":{"main_text":"Las Lajas","main_text_matched_substrings":[{"length":9,"offset":0}],"secondary_text":"Neuquen, Argentina"},"terms":[{"offset":0,"value":"Las Lajas"},{"offset":11,"value":"Neuquen"},{"offset":20,"value":"Argentina"}],"types":["locality","political","geocode"]},{"description":"Las Lajas, Potosí, Narino, Colombia","matched_substrings":[{"length":9,"offset":0}],"place_id":"ChIJPwXS0J5sKY4RlBV_Sacwiyc","reference":"ChIJPwXS0J5sKY4RlBV_Sacwiyc","structured_formatting":{"main_text":"Las Lajas","main_text_matched_substrings":[{"length":9,"offset":0}],"secondary_text":"Potosí, Narino, Colombia"},"terms":[{"offset":0,"value":"Las Lajas"},{"offset":11,"value":"Potosí"},{"offset":19,"value":"Narino"},{"offset":27,"value":"Colombia"}],"types":["locality","political","geocode"]},{"description":"Las Lajas, Panama","matched_substrings":[{"length":9,"offset":0}],"place_id":"ChIJb6ZtcWC9r48RlhTe7LbGQl4","reference":"ChIJb6ZtcWC9r48RlhTe7LbGQl4","structured_formatting":{"main_text":"Las Lajas","main_text_matched_substrings":[{"length":9,"offset":0}],"secondary_text":"Panama"},"terms":[{"offset":0,"value":"Las Lajas"},{"offset":11,"value":"Panama"}],"types":["locality","political","geocode"]},{"description":"Las Lajas Sanctuary, Ipiales, Narino, Colombia","matched_substrings":[{"length":9,"offset":0}],"place_id":"ChIJoWE9n6FsKY4R_eDbxLkM1Wg","reference":"ChIJoWE9n6FsKY4R_eDbxLkM1Wg","structured_formatting":{"main_text":"Las Lajas Sanctuary","main_text_matched_substrings":[{"length":9,"offset":0}],"secondary_text":"Ipiales, Narino, Colombia"},"terms":[{"offset":0,"value":"Las Lajas Sanctuary"},{"offset":21,"value":"Ipiales"},{"offset":30,"value":"Narino"},{"offset":38,"value":"Colombia"}],"types":["church","place_of_worship","point_of_interest","establishment"]},{"description":"Las Lajas, Honduras","matched_substrings":[{"length":9,"offset":0}],"place_id":"ChIJEfzpmwT5ZY8R8S-M7r53KFQ","reference":"ChIJEfzpmwT5ZY8R8S-M7r53KFQ","structured_formatting":{"main_text":"Las Lajas","main_text_matched_substrings":[{"length":9,"offset":0}],"secondary_text":"Honduras"},"terms":[{"offset":0,"value":"Las Lajas"},{"offset":11,"value":"Honduras"}],"types":["locality","political","geocode"]}]
/// status : "OK"

class Result {
  Result({
      List<Predictions>? predictions, 
      String? status,}){
    _predictions = predictions;
    _status = status;
}

  Result.fromJson(dynamic json) {
    if (json['predictions'] != null) {
      _predictions = [];
      json['predictions'].forEach((v) {
        _predictions?.add(Predictions.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Predictions>? _predictions;
  String? _status;
Result copyWith({  List<Predictions>? predictions,
  String? status,
}) => Result(  predictions: predictions ?? _predictions,
  status: status ?? _status,
);
  List<Predictions>? get predictions => _predictions;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_predictions != null) {
      map['predictions'] = _predictions?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// description : "Las Lajas, Neuquen, Argentina"
/// matched_substrings : [{"length":9,"offset":0}]
/// place_id : "ChIJNwOidxFZDZYR7Pgolo2wlHc"
/// reference : "ChIJNwOidxFZDZYR7Pgolo2wlHc"
/// structured_formatting : {"main_text":"Las Lajas","main_text_matched_substrings":[{"length":9,"offset":0}],"secondary_text":"Neuquen, Argentina"}
/// terms : [{"offset":0,"value":"Las Lajas"},{"offset":11,"value":"Neuquen"},{"offset":20,"value":"Argentina"}]
/// types : ["locality","political","geocode"]

class Predictions {
  Predictions({
      String? description, 
      List<MatchedSubstrings>? matchedSubstrings, 
      String? placeId, 
      String? reference, 
      StructuredFormatting? structuredFormatting, 
      List<Terms>? terms, 
      List<String>? types,}){
    _description = description;
    _matchedSubstrings = matchedSubstrings;
    _placeId = placeId;
    _reference = reference;
    _structuredFormatting = structuredFormatting;
    _terms = terms;
    _types = types;
}

  Predictions.fromJson(dynamic json) {
    _description = json['description'];
    if (json['matched_substrings'] != null) {
      _matchedSubstrings = [];
      json['matched_substrings'].forEach((v) {
        _matchedSubstrings?.add(MatchedSubstrings.fromJson(v));
      });
    }
    _placeId = json['place_id'];
    _reference = json['reference'];
    _structuredFormatting = json['structured_formatting'] != null ? StructuredFormatting.fromJson(json['structured_formatting']) : null;
    if (json['terms'] != null) {
      _terms = [];
      json['terms'].forEach((v) {
        _terms?.add(Terms.fromJson(v));
      });
    }
    _types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  String? _description;
  List<MatchedSubstrings>? _matchedSubstrings;
  String? _placeId;
  String? _reference;
  StructuredFormatting? _structuredFormatting;
  List<Terms>? _terms;
  List<String>? _types;
Predictions copyWith({  String? description,
  List<MatchedSubstrings>? matchedSubstrings,
  String? placeId,
  String? reference,
  StructuredFormatting? structuredFormatting,
  List<Terms>? terms,
  List<String>? types,
}) => Predictions(  description: description ?? _description,
  matchedSubstrings: matchedSubstrings ?? _matchedSubstrings,
  placeId: placeId ?? _placeId,
  reference: reference ?? _reference,
  structuredFormatting: structuredFormatting ?? _structuredFormatting,
  terms: terms ?? _terms,
  types: types ?? _types,
);
  String? get description => _description;
  List<MatchedSubstrings>? get matchedSubstrings => _matchedSubstrings;
  String? get placeId => _placeId;
  String? get reference => _reference;
  StructuredFormatting? get structuredFormatting => _structuredFormatting;
  List<Terms>? get terms => _terms;
  List<String>? get types => _types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = _description;
    if (_matchedSubstrings != null) {
      map['matched_substrings'] = _matchedSubstrings?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = _placeId;
    map['reference'] = _reference;
    if (_structuredFormatting != null) {
      map['structured_formatting'] = _structuredFormatting?.toJson();
    }
    if (_terms != null) {
      map['terms'] = _terms?.map((v) => v.toJson()).toList();
    }
    map['types'] = _types;
    return map;
  }

}

/// offset : 0
/// value : "Las Lajas"

class Terms {
  Terms({
      num? offset, 
      String? value,}){
    _offset = offset;
    _value = value;
}

  Terms.fromJson(dynamic json) {
    _offset = json['offset'];
    _value = json['value'];
  }
  num? _offset;
  String? _value;
Terms copyWith({  num? offset,
  String? value,
}) => Terms(  offset: offset ?? _offset,
  value: value ?? _value,
);
  num? get offset => _offset;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = _offset;
    map['value'] = _value;
    return map;
  }

}

/// main_text : "Las Lajas"
/// main_text_matched_substrings : [{"length":9,"offset":0}]
/// secondary_text : "Neuquen, Argentina"

class StructuredFormatting {
  StructuredFormatting({
      String? mainText, 
      List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings, 
      String? secondaryText,}){
    _mainText = mainText;
    _mainTextMatchedSubstrings = mainTextMatchedSubstrings;
    _secondaryText = secondaryText;
}

  StructuredFormatting.fromJson(dynamic json) {
    _mainText = json['main_text'];
    if (json['main_text_matched_substrings'] != null) {
      _mainTextMatchedSubstrings = [];
      json['main_text_matched_substrings'].forEach((v) {
        _mainTextMatchedSubstrings?.add(MainTextMatchedSubstrings.fromJson(v));
      });
    }
    _secondaryText = json['secondary_text'];
  }
  String? _mainText;
  List<MainTextMatchedSubstrings>? _mainTextMatchedSubstrings;
  String? _secondaryText;
StructuredFormatting copyWith({  String? mainText,
  List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings,
  String? secondaryText,
}) => StructuredFormatting(  mainText: mainText ?? _mainText,
  mainTextMatchedSubstrings: mainTextMatchedSubstrings ?? _mainTextMatchedSubstrings,
  secondaryText: secondaryText ?? _secondaryText,
);
  String? get mainText => _mainText;
  List<MainTextMatchedSubstrings>? get mainTextMatchedSubstrings => _mainTextMatchedSubstrings;
  String? get secondaryText => _secondaryText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main_text'] = _mainText;
    if (_mainTextMatchedSubstrings != null) {
      map['main_text_matched_substrings'] = _mainTextMatchedSubstrings?.map((v) => v.toJson()).toList();
    }
    map['secondary_text'] = _secondaryText;
    return map;
  }

}

/// length : 9
/// offset : 0

class MainTextMatchedSubstrings {
  MainTextMatchedSubstrings({
      num? length, 
      num? offset,}){
    _length = length;
    _offset = offset;
}

  MainTextMatchedSubstrings.fromJson(dynamic json) {
    _length = json['length'];
    _offset = json['offset'];
  }
  num? _length;
  num? _offset;
MainTextMatchedSubstrings copyWith({  num? length,
  num? offset,
}) => MainTextMatchedSubstrings(  length: length ?? _length,
  offset: offset ?? _offset,
);
  num? get length => _length;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = _length;
    map['offset'] = _offset;
    return map;
  }

}

/// length : 9
/// offset : 0

class MatchedSubstrings {
  MatchedSubstrings({
      num? length, 
      num? offset,}){
    _length = length;
    _offset = offset;
}

  MatchedSubstrings.fromJson(dynamic json) {
    _length = json['length'];
    _offset = json['offset'];
  }
  num? _length;
  num? _offset;
MatchedSubstrings copyWith({  num? length,
  num? offset,
}) => MatchedSubstrings(  length: length ?? _length,
  offset: offset ?? _offset,
);
  num? get length => _length;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = _length;
    map['offset'] = _offset;
    return map;
  }

}