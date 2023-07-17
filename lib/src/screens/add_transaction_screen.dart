import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_demo/src/models/transaction_model.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../providers/transaction_provider.dart';

class AddTransactionScreen extends StatelessWidget{

  final form = FormGroup({
    'title': FormControl<String>(),
    'description': FormControl<String>(),
    'amount': FormControl<double>(),
    'type': FormControl<String>(),
    'category': FormControl<String>()
  });

  onAddPressed(Transaction transactionProvider, FormGroup form){
    Map<String, Object?> formValue = form.value;
    TransactionModel transaction = TransactionModel(
      title: formValue['title'] as String,
      description: formValue['description'] as String,
      amount: formValue['amount'] as double,
      type: formValue['type'] as String,
      category: formValue['category'] as String
    );
    transactionProvider.addTransaction(transaction);
    form.reset();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) =>
          Column(children: [
            ReactiveTextField(
              formControlName: 'title',
              decoration: InputDecoration(labelText: 'Title'),
            ),
            ReactiveTextField(
              formControlName: 'description',
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ReactiveTextField(
              formControlName: 'category',
              decoration: InputDecoration(labelText: 'Category'),
            ),
            ReactiveTextField(
              formControlName: 'amount',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            Row(
              children: [
                Expanded(child: ReactiveRadioListTile(
                  title: const Text('Gasto'),
                  value: 'gasto',
                  formControlName: 'type',
                )),
                Expanded(child: ReactiveRadioListTile(
                  title: const Text('Ingreso'),
                  value: 'ingreso',
                  formControlName: 'type',
                ),),
              ],
            ),
          Consumer<Transaction>(
          builder: (context, transaction, child){
            return ElevatedButton(onPressed: (){onAddPressed(transaction, form);}, child: Text('Añadir Transaccion'));
          },
          )
          ],)
      ),
    );
  }
}