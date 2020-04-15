import 'package:flutter/material.dart';
import 'package:game/constants.dart';
import 'package:game/design_patterns/iterator/graph.dart';
import 'package:game/design_patterns/iterator/tree_collections/breadth_first_tree_collection.dart';
import 'package:game/design_patterns/iterator/tree_collections/depth_first_tree_collection.dart';
import 'package:game/design_patterns/iterator/tree_collections/itree_collection.dart';
import 'package:game/widgets/design_patterns/iterator/box.dart';

class IteratorExample extends StatefulWidget {
  @override
  _IteratorExampleState createState() => _IteratorExampleState();
}

class _IteratorExampleState extends State<IteratorExample> {
  final List<ITreeCollection> treeCollections = List<ITreeCollection>();

  int _selectedTreeCollectionIndex = 0;
  int _currentNodeIndex = 0;
  bool _isTraversing = false;

  @override
  void initState() {
    super.initState();

    var graph = _buildGraph();
    treeCollections.add(BreadthFirstTreeCollection(graph));
    treeCollections.add(DepthFirstTreeCollection(graph));
  }

  static const Color transparent = Color(0x00000000);

  Graph _buildGraph() {
    var graph = Graph();

    graph.addEdge(1, 21);
    graph.addEdge(1, 22);
    graph.addEdge(1, 23);
    graph.addEdge(1, 24);

    graph.addEdge(21, 31);
    graph.addEdge(21, 25);
    graph.addEdge(21, 20);
    graph.addEdge(21, 14);
    graph.addEdge(21, 13);
    graph.addEdge(21, 7);
    graph.addEdge(21, 11);
    graph.addEdge(21, 28);

    graph.addEdge(22, 32);
    graph.addEdge(22, 2);
    graph.addEdge(22, 5);
    graph.addEdge(22, 3);
    graph.addEdge(22, 16);
    graph.addEdge(22, 6);
    graph.addEdge(22, 8);
    graph.addEdge(22, 17);
    graph.addEdge(22, 9);
    graph.addEdge(22, 30);

    graph.addEdge(24, 34);
    graph.addEdge(24, 26);
    graph.addEdge(24, 4);
    graph.addEdge(24, 17);
    graph.addEdge(24, 8);
    graph.addEdge(24, 6);
    graph.addEdge(24, 10);
    graph.addEdge(24, 29);

    graph.addEdge(23, 33);
    graph.addEdge(23, 3);
    graph.addEdge(23, 5);
    graph.addEdge(23, 2);
    graph.addEdge(23, 15);
    graph.addEdge(23, 7);
    graph.addEdge(23, 13);
    graph.addEdge(23, 14);
    graph.addEdge(23, 12);
    graph.addEdge(23, 27);
    return graph;
  }

  var list1 = [27, 28, 29, 30];

  Future _traverseTree() async {
    _toggleIsTraversing();

    var iterator =
    treeCollections[_selectedTreeCollectionIndex].createIterator();

    while (iterator.hasNext()) {
      setState(() {
        _currentNodeIndex = iterator.getNext();
      });
      if (_currentNodeIndex == list1[0]) {
        break;
      }
      await Future.delayed(const Duration(milliseconds: 250));
    }

    _toggleIsTraversing();
  }

  void _toggleIsTraversing() {
    setState(() {
      _isTraversing = !_isTraversing;
    });
  }

  void _reset() {
    setState(() {
      _currentNodeIndex = 0;
      list1.shuffle();
    });
  }

  Widget monkey() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * .06,
      width: MediaQuery
          .of(context)
          .size
          .width * .15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage('assets/monkey.png'), fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
          )),
    );
  }

  Widget banana(int nodeId) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * .1,
      width: MediaQuery
          .of(context)
          .size
          .width * .09,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          nodeId == list1[0] ? Container(
            height: MediaQuery
                .of(context)
                .size
                .height * .08,
            width: MediaQuery
                .of(context)
                .size
                .width * .15,
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/banana.png'), fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black26, BlendMode.colorBurn),
            )),
          ) : SizedBox(),
          Box(
            nodeId: nodeId,
            color: transparent,
            child: _getBanana(nodeId),
          ),
        ],
      ),
    );
  }

  Widget _getBanana(int index) {
    return _currentNodeIndex == index ? monkey() : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFEEE6),
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('Monkey & Banana'),
          ],
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/bcakground2.jpg'), fit: BoxFit.cover,
//              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
            )),
          ),
          ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: paddingL),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: spaceL),
                  Text('Breadth First Algorithm ', style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontFamily: 'RobotoMedium'),),
                  const SizedBox(height: spaceL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          banana(27),
                          Box(
                            nodeId: 12,
                            color: Colors.teal,
                            child: _getBanana(12),
                          ),
                          Box(
                            nodeId: 14,
                            color: Colors.teal,
                            child: _getBanana(14),
                          ),
                          Box(
                            nodeId: 20,
                            color: Colors.teal,
                            child: _getBanana(20),
                          ),
                          Box(
                            nodeId: 25,
                            color: Colors.teal,
                            child: _getBanana(25),
                          ),
                          Box(
                            nodeId: 31,
                            color: Colors.teal,
                            child: _getBanana(31),
                          ),
                          Box(
                            nodeId: 21,
                            color: transparent,
                            child: _getBanana(21),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Box1(
                            nodeId: 13,
                            color: Colors.teal,
                            child: _getBanana(13),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * .2,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          banana(28),
                          Box(
                            nodeId: 11,
                            color: Colors.teal,
                            child: _getBanana(11),
                          ),
                          Box(
                            nodeId: 7,
                            color: Colors.teal,
                            child: _getBanana(7),
                          ),
                          Box(
                            nodeId: 15,
                            color: Colors.teal,
                            child: _getBanana(15),
                          ),
                          Box(
                            nodeId: 2,
                            color: Colors.teal,
                            child: _getBanana(2),
                          ),
                          Box(
                            nodeId: 32,
                            color: Colors.teal,
                            child: _getBanana(32),
                          ),
                          Box(
                            nodeId: 22,
                            color: transparent,
                            child: _getBanana(22),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(height: MediaQuery
                              .of(context)
                              .size
                              .height * .2,),
                          Box1(
                            nodeId: 5,
                            color: Colors.teal,
                            child: _getBanana(5),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          banana(29),
                          Box(
                            nodeId: 10,
                            color: Colors.teal,
                            child: _getBanana(10),
                          ),
                          Box(
                            nodeId: 6,
                            color: Colors.teal,
                            child: _getBanana(6),
                          ),
                          Box(
                            nodeId: 16,
                            color: Colors.teal,
                            child: _getBanana(16),
                          ),
                          Box(
                            nodeId: 3,
                            color: Colors.teal,
                            child: _getBanana(3),
                          ),
                          Box(
                            nodeId: 33,
                            color: Colors.teal,
                            child: _getBanana(33),
                          ),

                          Box(
                            nodeId: 23,
                            color: transparent,
                            child: _getBanana(23),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Box1(
                            nodeId: 8,
                            color: Colors.teal,
                            child: _getBanana(8),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * .2,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          banana(30),
                          Box(
                            nodeId: 9,
                            color: Colors.teal,
                            child: _getBanana(9),
                          ),
                          Box(
                            nodeId: 17,
                            color: Colors.teal,
                            child: _getBanana(17),
                          ),
                          Box(
                            nodeId: 4,
                            color: Colors.teal,
                            child: _getBanana(4),
                          ),
                          Box(
                            nodeId: 26,
                            color: Colors.teal,
                            child: _getBanana(26),
                          ),
                          Box(
                            nodeId: 34,
                            color: Colors.teal,
                            child: _getBanana(34),
                          ),
                          Box(
                            nodeId: 24,
                            color: transparent,
                            child: _getBanana(24),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        color: Colors.teal,
                        child: Text('Play', style: TextStyle(color: Colors
                            .white, fontSize: 17),),
                        onPressed: _currentNodeIndex == 0
                            ? _traverseTree
                            : null,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        child: Text('Reset', style: TextStyle(color: Colors
                            .white, fontSize: 17),),
                        color: Colors.teal,
                        onPressed:
                        _isTraversing || _currentNodeIndex == 0 ? null : _reset,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
