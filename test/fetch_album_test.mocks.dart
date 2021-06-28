import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:mocking/main.dart';
import './fetch_album_test.mocks.mocks.dart';
import '../lib/main.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group(
    'fetchAlbum',
    () {
      test(
        'returns an Album if the http call completes successfully',
        () {
          final client = MockClient();
          when(client.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
              .thenAnswer((realInvocation) async => http.Response(
                  '{"userId": 1, "id": 2, "title": "mock"}', 200));
          //?!? expect(await fetchAlbum(client), isA<Album>());

          expect(fetchAlbum(client), isA<Album>());
        },
      );
      test(
        "throws an exception if the http call completes with an error",
        () {
          final client = MockClient();
          when(client.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          expect(fetchAlbum(client), throwsException);
        },
      );
    },
  );
}
