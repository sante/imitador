import 'package:dartx/dartx.dart';

List<Pair<double, double>> deriveSamples(
  List<Pair<double, double>> samples,
    int windowSize,
) {
  final List<Pair<double, double>> derivedSamples = [];

  if (samples.length < 2) {
    return derivedSamples; // Not enough data to calculate speed
  }

  for (int i = 0; i < samples.length - windowSize; i++) {
    final window = samples.slice(i, i + windowSize);
    final time = window.first.first;
    final instantDerived = <double>[];
    for (int j = 0 ; j < window.length - 1; j++) {
      final start = window[j];
      final end = window[j + 1];
      final deltaTime = end.first - start.first;
      final deltaPosition = end.second - start.second;
      if (deltaTime != 0) {
        final speed = deltaPosition / deltaTime;
        instantDerived.add(speed);
      }
    }
    derivedSamples.add(Pair(time, instantDerived.average()));
  }

  return derivedSamples;
}

List<Pair<double, double>> integrateSamples(
  List<Pair<double, double>> samples,
    double initialValue,
) {
  final List<Pair<double, double>> integratedSamples = [];

  if (samples.isEmpty) {
    return integratedSamples; // No speed data to integrate
  }

  double currentTime = samples.first.first;
  double currentValue = initialValue;

  for (final sample in samples) {
    final time = sample.first;
    final value = sample.second;

    // Calculate the time difference
    final deltaTime = time - currentTime;

    // Update the position using the speed and time difference
    currentValue += value * deltaTime;

    // Add the new position sample
    integratedSamples.add(Pair(time, currentValue));

    // Update the current time
    currentTime = time;
  }

  return integratedSamples;
}

extension SampleExtensions on List<Pair<double, double>> {
  List<Pair<double, double>> rollingAverage(int windowSize) {
    final List<Pair<double, double>> averagedSamples = [];

    for (int i = 0; i < length - windowSize - 1; i++) {
      final window = slice(i, i + windowSize);
      final time = window.first.first;
      final averageValue = window.map((e) => e.second).average();
      averagedSamples.add(Pair(time, averageValue));
    }

    return averagedSamples;
  }
}
