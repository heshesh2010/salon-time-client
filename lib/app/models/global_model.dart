import 'parents/model.dart';

class Global extends Model {
  String mockBaseUrl;
  String laravelBaseUrl;
  String apiPath;
  int newOrder;
  int accepted;
  int attended;
  int absent;
  int done;
  int declined;
  Global({this.mockBaseUrl, this.laravelBaseUrl, this.apiPath});

  Global.fromJson(Map<String, dynamic> json) {
    mockBaseUrl = json['mock_base_url'].toString();
    laravelBaseUrl = json['laravel_base_url'].toString();
    apiPath = json['api_path'].toString();
    newOrder = intFromJson(json, 'newOrder');
    accepted = intFromJson(json, 'accepted');
    attended = intFromJson(json, 'attended');
    absent = intFromJson(json, 'absent');
    done = intFromJson(json, 'done');
    declined = intFromJson(json, 'declined');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mock_base_url'] = this.mockBaseUrl;
    data['laravel_base_url'] = this.laravelBaseUrl;
    data['api_path'] = this.apiPath;
    return data;
  }
}
