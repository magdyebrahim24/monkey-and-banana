import 'package:game/design_patterns/iterator/graph.dart';
import 'package:game/design_patterns/iterator/tree_collections/itree_collection.dart';
import 'package:game/design_patterns/iterator/tree_iterators/breadth_first_iterator.dart';
import 'package:game/design_patterns/iterator/tree_iterators/itree_iterator.dart';

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
