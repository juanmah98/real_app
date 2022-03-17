import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final montoController = TextEditingController();

  void sumbitData() {
    final enterTitle = titleController.text;
    final enterMonto = double.parse(montoController.text);

    if (enterTitle.isEmpty || enterMonto <= 0) {
      return;
    } else
      widget.addTx(enterTitle, enterMonto);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Titulo'),
            // onChanged: (val) {
            //   titleInput = val;
            //   print(titleInput);
            // },
            controller: titleController,
            onSubmitted: (_) => sumbitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Monto'),
            // onChanged: (val) => montoInput = val,
            controller: montoController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => sumbitData(),
          ),
          TextButton(
            onPressed: () {
              sumbitData();
            },
            child: Text('Agregar gasto'),
            style: TextButton.styleFrom(primary: Colors.pink),
          )
        ]),
      ),
    );
  }
}
