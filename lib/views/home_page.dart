import 'package:flutter/material.dart';
import 'package:quotes_generator/quote.dart';
import 'package:quotes_generator/quote_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<Quote?> _quote;
  final QuoteProvider _provider = QuoteProvider.instance;

  @override
  void initState() {
    super.initState();
    _quote = _provider.getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<Quote?>(
          future: _quote,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    snapshot.data!.text,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Visibility(
                      visible: snapshot.data!.author.isNotEmpty,
                      child: Text(
                        snapshot.data!.author,
                        style: TextStyle(color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.navigate_next),
                        iconSize: 36.0,
                        color: Colors.black87,
                        tooltip: 'Next Quote',
                        onPressed: () {
                          setState(() {
                            _quote = _provider.getRandomQuote();
                          });
                        },
                      ),
                    ),
                  )
                ],
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
