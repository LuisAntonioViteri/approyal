import 'package:approyal/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Borrar',
    content: '¿Estás seguro de que quieres borrar el item?',
    optionBuilder: () => {
      'Cancelar': false,
      'Borrar': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
