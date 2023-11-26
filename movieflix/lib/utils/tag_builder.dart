class TagBuilder {
  static const String _prefixImage = 'image';

  TagBuilder._();

  static String buildImageTag(String middle, int id) => '$_prefixImage-$middle-$id';
}
