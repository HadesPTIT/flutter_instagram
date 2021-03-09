import 'package:intl/intl.dart';

class StringUtils {
  ///
  /// Format number with specific format
  /// 12345 => 12,345
  /// 12345678 => 12,345,678
  ///
  static String numberFormatter({num value, String suffix}) {
    if (value == null) return '';
    final NumberFormat formatter =
        NumberFormat('###,### ${suffix ?? ''}', 'en');
    return formatter.format(value);
  }

  ///
  /// Format date from timestamp
  ///
  static String dateFromTimestamp(double timestamp) {
    if (timestamp != null) {
      var date = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt() * 1000);
      return DateFormat('dd/MM/yyyy – kk:mm').format(date);
    }
    return '';
  }

  ///
  /// Format date time to time ago
  ///
  static String timeAgoSinceDate(DateTime dateTime,
      {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(dateTime);

    if (difference.inDays > 8) {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
