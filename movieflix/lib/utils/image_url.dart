class ImageUrlUtils {
  static const String _baseUrl = 'https://image.tmdb.org/t/p';
  static const String _sizeSmall = 'w500';
  static const String _sizeBig = 'w1280';

  ImageUrlUtils._();

  static String? getImageUrl(String? imagePath) {
    return (imagePath == null) ? null : '$_baseUrl/$_sizeSmall/$imagePath';
  }

  static String? getBigImageUrl(String? imagePath) {
    return (imagePath == null) ? null : '$_baseUrl/$_sizeBig/$imagePath';
   }
}
