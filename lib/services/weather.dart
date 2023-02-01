
class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'images/Rainy.png';
    } else if (condition < 400) {
      return 'images/Rainy.png';
    } else if (condition < 600) {
      return 'images/Rainy.png';
    } else if (condition < 700) {
      return 'images/Rainy.png';
    } else if (condition < 800) {
      return 'images/Beautiful Night.png';
    } else if (condition == 800) {
      return 'images/So Hot.png';
    } else if (condition <= 804) {
      return 'images/Beautiful Night.png';
    } else {
      return 'images/So Hot.png';
    }
  }
}