import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String title, double amount, DateTime date) onSubmit;
  NewTransaction({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    void _submitTransaction() {
      String title = _titleController.text;
      double? amount = double.tryParse(_amountController.text) ?? -1;

      if (title.isEmpty || amount.isNegative || _selectedDate == null) {
        return;
      }

      widget.onSubmit(
        title,
        amount,
        _selectedDate!,
      );
      _titleController.clear();
      _amountController.clear();

      Navigator.of(context).pop();
    }

    void _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value == null) {
          return '';
        }
        setState(() {
          _selectedDate = value;
        });
      });
    }

    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Data não escolhida'
                          : 'Data selecionada: ${DateFormat.yMd().format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Selecione uma data',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: _submitTransaction,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Adicionar transação",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
