/// Demonstrates Dart 3 records, named fields, and pattern destructuring

// 1. Function returning a typed record with named and positional fields
({double latitude, double longitude, String city}) getCoordinates() {
  return (latitude: 9.0765, longitude: 7.3986, city: 'Abuja');
}

// 2. Pattern matching in JSON inspection
String classifyJson(Map<String, dynamic> json) {
  return switch (json) {
    {'status': 'ok', 'data': List items} => 'Received ${items.length} items',
    {'status': 'error', 'code': int code} => 'Error with HTTP code $code',
    _ => 'Unknown payload format',
  };
}

void main() {
  final coords = getCoordinates();
  print('City: ${coords.city}, Lat: ${coords.latitude}');

  final response = classifyJson({'status': 'ok', 'data': [1, 2, 3]});
  print(response);
}
