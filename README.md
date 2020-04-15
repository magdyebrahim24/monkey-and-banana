# Monkey And Banana AI Game
- ###   An Ai Game That Solve The problem of finding the correct path from source to destination .
- ### Use BeathFirst Algorithm.

-----------------------------------------------------------------------------

### Game Apk Link To Download and Install
 - https://drive.google.com/open?id=11Jvw1QGQ1NH6o0_hJCBPfozpn10eRr1e
-------------------------------------------------------------------------------
### Game Video on youtube
 - https://youtu.be/6sGLklKktXk

--------------------------------------------------------------------------------

## Explain How Game Play :
- the monkey find four paths to banana .
- he go in every path and check is the banana there in the end or what 
- if it there he win otherwise he go in the next path .....
- the goal or the location of banana is random .

![Image of Yaktocat](/assets/app-gif-screen.gif)

-------------------------------------------------------------------------------

## Implementation The Project (Some Important Code ) :-

### We Work With Flutter .
- At First : We use graph to design the Ui and we consider the game as group of nodes and edges then by using BreathFirst Algorithm We   Search for The Random Goal (Banana) using Iterator in Dart .

- _BreadthFirstTree creates the _BreadthFirstIterator_. Also, both of these collections stores the _Graph_ object to save the tree data structure itself.

_ITreeIterator_ defines a common interface for all specific iterators of the tree collection:

- _hasNext()_ - returns true if the iterator did not reach the end of the collection yet, otherwise false;
- _getNext()_ - returns the next value of the collection;
- _reset()_ - resets the iterator and sets the current position of it to the beginning.
------------------------------------------------------------------------------------------------------------

#### the breadth-first algorithm uses the **Queue** data structure
#### to store nodes (vertices) which should be visited next .

--------------------------------------------------------------------------------------------------------------

### Graph Code In Dart

A class which stores the adjacency list of the graph. It is stored as a map data structure where the key represents the node's (vertix) id and the value is a list of vertices (ids of other nodes) adjacent to the vertex of that id (key). Also, this class defines the _addEdge()_ method to add an edge to the adjacency list.

```
class Graph {
  final Map<int, Set<int>> adjacencyList = Map<int, Set<int>>();

  void addEdge(int source, int target) {
    if (adjacencyList.containsKey(source)) {
      adjacencyList[source].add(target);
    } else {
      adjacencyList[source] = {target};
    }
  }
}
```



### Tree collections

- _BreadthFirstTreeCollection_ - a tree collection class which stores the graph object and implements the _createIterator()_ method to create an iterator which uses the breadth-first algorithm to traverse the graph.

```
class BreadthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  const BreadthFirstTreeCollection(this.graph);

  @override
  ITreeIterator createIterator() {
    return BreadthFirstIterator(this);
  }

  @override
  String getTitle() {
    return 'Breadth-first';
  }
}
```


### BreadthFirst Algorithm code :-

- _BreadthFirstIterator_ - a specific implementation of the tree iterator which traverses the tree collection by using the breadth-first algorithm. This algorithm uses the **queue** data structure to store vertices (nodes) which should be visited next using the _getNext()_ method.

```
class BreadthFirstIterator implements ITreeIterator {
  final BreadthFirstTreeCollection treeCollection;
  final Set<int> visitedNodes = <int>{};
  final ListQueue<int> nodeQueue = ListQueue<int>();

  final int _initialNode = 1;
  int _currentNode;

  BreadthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeQueue.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  bool hasNext() {
    return nodeQueue.isNotEmpty;
  }

  @override
  int getNext() {
    if (!hasNext()) {
      return null;
    }

    _currentNode = nodeQueue.removeFirst();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (var node in adjacencyList[_currentNode]
          .where((n) => !visitedNodes.contains(n))) {
        nodeQueue.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeQueue.clear();
    nodeQueue.add(_initialNode);
  }
}
```

### Grraph (Ndes & Edges) defenition :

```
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
    ....
    ....
    ....
    ....
    return graph;
  }

```

 ## you will find the code of Implementation in (lib) Folder 



