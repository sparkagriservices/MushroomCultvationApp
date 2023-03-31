class Weather {
  final double temperature;
  final String condition;
  final String iconCode;

  Weather({
    required this.temperature,
    required this.condition,
    required this.iconCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final temperature = json['main']['temp'];
    final condition = json['weather'][0]['main'];
    final iconCode = json['weather'][0]['icon'];
    return Weather(
      temperature: temperature,
      condition: condition,
      iconCode: iconCode,
    );
  }
}