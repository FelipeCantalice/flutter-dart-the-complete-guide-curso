import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: 's1', title: 'Sapato', amount: 93.50, data: DateTime.now()),
    Transaction(id: 'd2', title: 'Doce', amount: 12.90, data: DateTime.now()),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
          (transaction) => transaction.data.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  void _addTransaction(String title, double amount, DateTime chooseDate) {
    final transaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      data: chooseDate,
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  void _showModelAddTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(onSubmit: _addTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final isBigScreen = mediaQuery.size.width > 600;

    final appBar = AppBar(
      title: Text(
        "Personal expenses",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showModelAddTransaction(context))
      ],
    );

    final _transactionList = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
        transactions: _transactions,
        deleteTransaction: _deleteTransaction,
      ),
    );

    Widget _showContainer(double heightContainer) {
      return Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            heightContainer,
        child: Chart(
          recentTransactions: _recentTransactions,
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // verificar se a tela está em modo landscape
            if (isLandscape) ...{
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Monstrar grafico"),
                  Switch(
                    value: _showChart,
                    onChanged: (v) {
                      setState(() {
                        _showChart = v;
                      });
                    },
                  ),
                ],
              ),
              // verificar o estado do Switch
              _showChart ? _showContainer(0.7) : Container(),
              _transactionList
            },
            // se não
            if (!isLandscape) ...{
              _showContainer(0.3),
              _transactionList,
            },
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _showModelAddTransaction(context),
        ),
        onPressed: () {},
      ),
    );
  }
}
