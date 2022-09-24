class Utils {
  static String weatherCodeToImage(double weatherCode) {
    if (weatherCode <= 3) {
      return 'assets/images/sunny.png';
    } else if (weatherCode >= 45 && weatherCode <= 48) {
      return 'assets/images/foggy.png';
    } else if (weatherCode >= 51 && weatherCode <= 55) {
      return 'assets/images/rain.png';
    } else if (weatherCode >= 56 && weatherCode <= 57) {
      return 'assets/images/snow.png';
    } else if (weatherCode >= 61 && weatherCode <= 65) {
      return 'assets/images/rain.png';
    } else if (weatherCode >= 66 && weatherCode <= 77) {
      return 'assets/images/snow.png';
    } else if (weatherCode >= 80 && weatherCode <= 82) {
      return 'assets/images/rain.png';
    } else if (weatherCode >= 85 && weatherCode <= 86) {
      return 'assets/images/snow.png';
    } else if (weatherCode >= 95 && weatherCode <= 99) {
      return 'assets/images/storm.png';
    }
    return 'assets/images/rainbow.png';
  }
}
