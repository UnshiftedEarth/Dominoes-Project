/*
  Created By: Nathan Millwater
  Description: The edit action dialog box that allows the user
               to add or modify existing action in the catalog
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../catalog_model.dart';


/// Stateful widget used to hold the dialog box because
/// it must be updated
class EditAction extends StatefulWidget {
  Item action;

  EditAction({this.action});

  @override
  EditActionState createState() => EditActionState(editingAction: action);
}

/// The state of the widget
class EditActionState extends State<EditAction> {
  final _formKey = GlobalKey<FormState>();
  // use text editing controllers to get the text of the
  // form fields
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  Item editingAction;
  String buttonText;
  String title;
  // the type of action
  final formKey = GlobalKey<FormState>();

  /// constructor that checks if an item was passed in to modify
  EditActionState({this.editingAction}) {
    if (editingAction != null) {
      firstController.text = editingAction.first;
      secondController.text = editingAction.second;
      buttonText = "Done";
      title = "Editing an Action";
    } else {
      buttonText = "Add";
      title = "Add an Action";
    }
  }

  /// standard build method
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("First Side", style: TextStyle(fontWeight: FontWeight.bold)),
              // Name form field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'First',
                  icon: Icon(Icons.pending_actions),
                ),
                controller: firstController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text("Second Side",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              // Description form field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Second',
                  icon: Icon(Icons.message),
                ),
                controller: secondController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text("Color",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
      // button to confirm
      actions: [
        ElevatedButton(
            child: Text(buttonText),
            onPressed: () {
                // create the new action
                final item = Item(
                  first: firstController.text,
                  second: secondController.text,
                );
                // copy over values
                if (editingAction != null) {
                  editingAction.second = secondController.text;
                  editingAction.first = firstController.text;
                }
                // return the new item from the popup
                Navigator.pop(context, item);

            })
      ],
    );
  }
}
