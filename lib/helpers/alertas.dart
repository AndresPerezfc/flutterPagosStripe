part of 'helpers.dart';

mostrarLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            title: Text(
              "Espere...",
            ),
            content: LinearProgressIndicator(),
          ));
}

mostrarAlerta(BuildContext context, String titulo, String mensaje) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: [
              MaterialButton(
                  child: Text("Ok"),
                  onPressed: () {
                    return Navigator.of(context).pop();
                  })
            ],
          ));
}