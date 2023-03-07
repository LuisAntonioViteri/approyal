import 'package:approyal/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog(
    context: context,
    title: 'Ocurrió un error',
    content: text,
    optionBuilder: () => {
      'OK': null,
    },
  );
}
