import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final montoController = TextEditingController();

  NewTransaction(this.addTx);

  void sumbitData() {
    final enterTitle = titleController.text;
    final enterMonto = double.parse(montoController.text);

    if (enterTitle.isEmpty || enterMonto <= 0) {
      return;
    } else
      addTx(enterTitle, enterMonto);
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
