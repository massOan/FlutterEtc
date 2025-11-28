import 'package:json_annotation/json_annotation.dart';

part 'greeting_mids.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GreetingMids {
  final List<GreetingMid> greetMids;

  GreetingMids({required this.greetMids});

  factory GreetingMids.fromJson(Map<String, dynamic> json) =>
      _$GreetingMidsFromJson(json);

  /// ✅ 더미 데이터
  factory GreetingMids.dummy() {
    return GreetingMids(
      greetMids: [
        GreetingMid(
          midCatKey: 101,
          midCatName: "응원의 메시지",
          greetings: [
            Greeting(greetingKey: 1, greetingMessage: "오늘 하루도 힘내세요!"),
            Greeting(greetingKey: 2, greetingMessage: "당신은 잘 하고 있어요 😊"),
            Greeting(greetingKey: 3, greetingMessage: "조금씩 나아지고 있어요."),
          ],
        ),
        GreetingMid(
          midCatKey: 102,
          midCatName: "기쁨을 전해요",
          greetings: [
            Greeting(greetingKey: 4, greetingMessage: "행복한 하루 보내세요!"),
            Greeting(greetingKey: 5, greetingMessage: "웃음 가득한 하루 되길 ✨"),
          ],
        ),
        GreetingMid(
          midCatKey: 103,
          midCatName: "건강 응원",
          greetings: [
            Greeting(greetingKey: 6, greetingMessage: "따뜻하게 입고 나가세요!"),
            Greeting(greetingKey: 7, greetingMessage: "물 많이 마시고 휴식도 챙기세요."),
          ],
        ),
      ],
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GreetingMid {
  final int midCatKey;
  final String midCatName;
  final List<Greeting> greetings;

  GreetingMid({
    required this.midCatKey,
    required this.midCatName,
    required this.greetings,
  });

  factory GreetingMid.fromJson(Map<String, dynamic> json) =>
      _$GreetingMidFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Greeting {
  final int greetingKey;
  final String greetingMessage;

  Greeting({required this.greetingKey, required this.greetingMessage});

  factory Greeting.fromJson(Map<String, dynamic> json) =>
      _$GreetingFromJson(json);
}
