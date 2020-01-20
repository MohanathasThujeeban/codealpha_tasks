import 'package:flutter/material.dart';
import 'package:quotes_generator/quote.dart';
import 'package:quotes_generator/quote_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Quote> _quote;
  QuoteProvider _provider = QuoteProvider.instance;

  @override
  void initState() {
    super.initState();
    _quote = _provider.getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<Quote>(
          future: _quote,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    snapshot.data.text,
                    style: Theme.of(context).textTheme.display1,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Visibility(
                      visible: snapshot.data.author != null,
                      child: Text(
                        snapshot.data.author,
                        style: TextStyle(color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
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
