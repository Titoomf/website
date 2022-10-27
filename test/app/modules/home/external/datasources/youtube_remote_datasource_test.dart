import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/external/datasources/youtube_remote_datasource.dart';
import 'package:flutterando/app/utils/shared/service/client/dio_client.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/youtube_data_mock.dart';

class DioSpy extends Mock implements DioCliente {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  final dio = DioSpy();
  final datasource = YoutubeRemoteDatasource(dio);
  final _requestOptionsMock = RequestOptionsMock();

  test('Should return a list of ResultYoutubeModel', () async {
    when(() => dio.get(any(), any())).thenAnswer((_) async => Response(
        data: youtubeDataMock,
        requestOptions: _requestOptionsMock,
        statusCode: 200));
    final result = await datasource.getYoutube();
    expect(result, isA<List<ResultYoutube>>());
  });
}
