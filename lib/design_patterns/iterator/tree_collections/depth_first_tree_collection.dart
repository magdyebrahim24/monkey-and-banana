import 'package:game/design_patterns/iterator/graph.dart';
import 'package:game/design_patterns/iterator/tree_collections/itree_collection.dart';
import 'package:game/design_patterns/iterator/tree_iterators/depth_first_iterator.dart';
import 'package:game/design_patterns/iterator/tree_iterators/itree_iterator.dart';

class DepthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  const DepthFirstTreeCollection(this.graph);

  @override
  ITreeIterator createIterator() {
    return DepthFirstIterator(this);
  }

  @override
  String getTitle() {
    return 'Depth-first';
  }
}
