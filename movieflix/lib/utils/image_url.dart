class ImageUrlUtils {
  static const String _baseUrl = 'https://image.tmdb.org/t/p/w500';

  ImageUrlUtils._();

  static String? getFullImageUrl(String? imagePath) {
    return (imagePath == null) ? null : '$_baseUrl$imagePath';
  }
}
