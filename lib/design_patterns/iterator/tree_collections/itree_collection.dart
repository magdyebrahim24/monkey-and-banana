import 'package:game/design_patterns/iterator/tree_iterators/itree_iterator.dart';

abstract class ITreeCollection {
  ITreeIterator createIterator();

  String getTitle();
}
