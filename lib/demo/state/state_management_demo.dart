import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart'; // 使用此插件可以共享状态


/*
 * 状态管理demo4：使用scoped_model通信
 */

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(), 
      child: Scaffold(
        appBar: AppBar(title: Text('StateManagementDemo'), elevation: 0.0),
        body: CenterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.addCount
          )
        ),
      ),
    );
  }
}

class CenterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Counter());
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model._count}'), 
        onPressed: model.addCount
      )
    );
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void addCount () {
    _count++;
    notifyListeners();
  }
}


/*
* 状态管理demo3: 使用InheritedWidget通信
*/

class StateManagementDemo3 extends StatefulWidget {
  @override
  _StateManagementDemoState2 createState() => _StateManagementDemoState2();
}

class _StateManagementDemoState2 extends State<StateManagementDemo3> {
  int _count = 0;

  void _addCount () {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      addCount: _addCount,
      child: Scaffold(
        appBar: AppBar(title: Text('StateManagementDemo'), elevation: 0.0),
        body: CenterWrap3(),
        floatingActionButton: FloatingActionButton(
          onPressed: _addCount,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class CenterWrap3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter2(),
    );
  }
}

class Counter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback addCount = CounterProvider.of(context).addCount;

    return ActionChip(
      label: Text('$count'),
      onPressed: addCount,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback addCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.addCount,
    this.child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

/*
 * 状态管理demo2: 父子widget如何通信
*/

class StateManagementDemo2 extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo2> {
  int _count = 0;

  void _addCount () {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StateManagementDemo'), elevation: 0.0),
      body: CenterWrap(_count, _addCount),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCount,
        child: Icon(Icons.add),
      ),
    );
  }
}

class CenterWrap extends StatelessWidget {
  final int count;
  final VoidCallback addCount;

  CenterWrap(this.count, this.addCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: addCount,
      ),
    );
  }
}

/*
 * 状态管理demo1
*/

class StateManagementDemo1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateManagementState();
  }
}

class StateManagementState extends State<StateManagementDemo1> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StateManagementDemo'), elevation:0.0),
      body: Center(
        child: Chip(label: Text('$_count'))
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count ++;      
          });
        }
      ),
    );
  }
}