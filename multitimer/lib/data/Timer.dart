import 'package:json_annotation/json_annotation.dart';
import 'TimerCategory.dart';
import 'Section.dart';
import 'dart:async' as Async;

part 'Timer.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Timer {
  Timer({String this.name = ""}) {}

  @JsonKey(defaultValue: [])
  List<Section> sections = [];
  @JsonKey(required: true)
  String name;

  @JsonKey(includeToJson: false, includeFromJson: false)
  bool isActive = false;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool isExpired = false;
  @JsonKey(includeToJson: false, includeFromJson: false)
  late int activesectionnumber;

  Async.Timer? alarm;
  Stopwatch? stopwatch;

  Section getCurrentSection() {
    if (activesectionnumber < 0) return Section(duration: Duration.zero, message: "Invalid timer");
    return sections[activesectionnumber];
  }

  void activate() {
    activesectionnumber = 0;
    isActive = true;
    isExpired = false;
    alarm = new Async.Timer(getCurrentSection().duration, () {
      print("Now what`?");
    });
    stopwatch = Stopwatch();
    stopwatch?.start();
  }

  void deactivate() {
    isActive = false;
    isExpired = false;
    activesectionnumber = -1;
    alarmOff();
  }

  void alarmOff() {
    alarm?.cancel();
    alarm = null;
    stopwatch?.stop();
    stopwatch = null;
  }

  Duration _getRemainingTime() {
    if (stopwatch == null) return Duration.zero;
    var planned = getCurrentSection().duration;
    var passed = stopwatch!.elapsed;
    var diff = planned - passed;
    if (diff < Duration.zero) return Duration.zero;
    return diff;
  }

  String getRemainingTime() {
    var duration = _getRemainingTime();
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hh = twoDigits(duration.inHours);
    String mm = twoDigits(duration.inMinutes.remainder(60));
    String ss = twoDigits(duration.inSeconds.remainder(60));
    return "$hh:$mm:$ss";
  }

  void expire() {
    isActive = false;
    isExpired = true;
    alarmOff();
  }

  void nextsection() {
    isActive = true;
    isExpired = false;
    activesectionnumber++;
    if (activesectionnumber >= sections.length) {
      deactivate();
    }
  }

  @JsonKey(includeToJson: false, includeFromJson: false)
  late TimerCategory category;

  @override
  String toString() => toJson().toString();

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  Map<String, dynamic> toJson() => _$TimerToJson(this);
}
