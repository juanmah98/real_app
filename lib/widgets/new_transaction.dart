import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _montoController = TextEditingController();
  DateTime _selectedDate;

  void _sumbitData() {
    if (_montoController.text.isEmpty) {
      return;
    }

    final enterTitle = _titleController.text;
    final enterMonto = double.parse(_montoController.text);

    if (enterTitle.isEmpty || enterMonto <= 0 || _selectedDate == null) {
      return;
    } else
      widget.addTx(enterTitle, enterMonto, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            controller: _titleController,
            onSubmitted: (_) => _sumbitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Monto'),
            // onChanged: (val) => montoInput = val,
            controller: _montoController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _sumbitData(),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'Sin fecha elegida'
                      : 'Fecha ejelgida: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  child: Text(
                    'Eligir Día',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _sumbitData();
            },
            child: Text('Agregar gasto'),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Colors.white),
          )
        ]),
      ),
    );
  }
}
