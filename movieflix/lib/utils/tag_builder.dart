class TagBuilder {
  static const String _prefixImage = 'image-';
  static const String _prefixTitle = 'title-';

  TagBuilder._();

  static String buildImageTag(int id) => '$_prefixImage$id';

  static String buildTitleTag(int id) => '$_prefixTitle$id';
}
