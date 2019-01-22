import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String body;

  // Contructor
  Item({@required this.id, @required this.body});

  // State of the Item when it is initialised
  Item copyWith({int id, String body}){
    return Item(
      id: id ?? this.id,
      body: body ?? this.body
    );
  }

  //Desrialise json - Writing data as String
  Item.fromJson(Map json)
      : body = json['body'],
          id = json['id'];

  // Writing the data as Json
  Map toJson() => {
    'id': (id as int),
    'body': body
  };

}

class AppState {
  final List<Item> items;

  AppState({@required this.items});

  AppState.initialState(): items = List.unmodifiable(<Item>[]);

  AppState.fromJson(Map json)
      : items = (json['items'] as List).map((i) =>  Item.fromJson(i)).toList();

  Map toJson() => {'items': items};
}