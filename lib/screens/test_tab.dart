import 'package:flutter/material.dart';

class TestTab extends StatelessWidget {
  static final routeName = '/testtab';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Colors.teal,
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(vertical: 10),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                      color: Colors.teal[600],
                      border: Border(bottom: BorderSide.none)
                    ),
                    tabs: [Text('Notes'), Text('Todos')],
                  ),
                ),
              ),
          body: TabBarView(
            children: [
              Container(
                child: Text('Tab one'),
              ),
              Container(
                child: Text('Tab two'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
