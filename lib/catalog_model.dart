/*
  Created By: Nathan Millwater
  Description: Represents a the action catalog. Holds information related
               to the model
 */

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

/// A class representing a model of the action catalog. Holds the list
/// of items that the user can select from
class CatalogModel {

  // constructor
  CatalogModel() {
    this.catalog = [];
  }
  // the catalog data structure
  List<Item> catalog;


  /// Generates a unique ID integer between 0 and 10000
  /// Returns: The generated id
  int uniqueID() {
    final rng = Random();
    bool equal;
    int id;
    do {
      id = rng.nextInt(10000);
      equal = false;
      for (Item item in catalog) {
        if (item.id == id) {
          equal = true;
          break;
        }
      }
    } while (equal);
    return id;
  }


  /// returns the catalog object
  List<Item> getCatalog() => catalog;

  /// add the item to the catalog
  void addToCatalog(Item item) {
    this.catalog.add(item);
  }

  /// remove the item from the catalog
  void removeFromCatalog(Item item) {
    this.catalog.remove(item);
  }

  /// Get item by [id].
  Item getById(int id) => catalog[id];

  /// returns the length of the catalog
  int getLength() => catalog.length;

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }

}

/// A class to represent an item in the action catalog
class Item {
  int id;
  String first;
  String second;

  Item({this.id, this.first, this.second});

  @override
  int get hashCode => id;

  /// operator overloading for checking if two objects are equal
  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
