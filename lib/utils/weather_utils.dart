class WeatherUtils {
  static int kelvinToCelcius(double kelvin) {
    return (kelvin - 273.15).toInt();
  }

  static double kelvinToFahrenheit(double kelvin) {
    return 1.8 * (kelvin - 273) + 32;
  }

}