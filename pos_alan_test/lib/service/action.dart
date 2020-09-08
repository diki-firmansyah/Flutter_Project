import 'dart:async';

import 'package:pos_alan_test/model/bill.dart';
import 'package:pos_alan_test/model/menu_model.dart';
import 'package:pos_alan_test/model/transaction.dart';

class AddMenuAction{
  final Menu menu;
  AddMenuAction(this.menu);
}

class DeleteMenuAction{
  final int id;
  DeleteMenuAction(this.id);
}

class UpdateMenuAction{
   final int id;
  final Menu menu;
  UpdateMenuAction(this.id, this.menu);
}

class LoadMenuAction {}

class SearchMenuAction {}

class GetMenuAction {
  final String query;
  GetMenuAction({this.query});
}

class QueryAction{
  
}
class InsertedIdBill{
  final int insertedId;
  InsertedIdBill(this.insertedId);
}
class GetOneMenuAction {
  final Menu menu;
  GetOneMenuAction(this.menu);
}

class SearchedMenuAction {
  final String query;
  SearchedMenuAction(this.query);
}

class SaveTransactionAction {}

class LoadBills{
  final Completer<Null> completer;

  LoadBills({Completer completer})
    : this.completer = completer ?? Completer<Null>();
}

class SaveBill{}

class GetDetailTranscationAction{
  final int idBill;
  GetDetailTranscationAction({this.idBill});
}

class MenuLoadedAction{
  final List<Menu> menus;
  MenuLoadedAction(this.menus);
}


class BillLoadedAction{
  final List<Bill> bills;
  BillLoadedAction(this.bills);
}

class BillInsertAction{
  final Bill bill;
  final List<TransactionData> transaction;
  BillInsertAction(this.bill, this.transaction);
}

class TransactionLoadedAction{
  final List<TransactionData> transaction;
  TransactionLoadedAction(this.transaction);
}

class MenuNotLoadedAction{}

class SearchMenu{
  final String name;
  SearchMenu(this.name);
}