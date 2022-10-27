import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/utils/shared/service/client/my_http_client.dart';

import '../../../../utils/shared/constants_api.dart';
import '../../infra/datasources/youtube_datasource.dart';
import '../mappers/result_youtube_mapper.dart';

class YoutubeRemoteDatasource implements YoutubeDatasource {
  final IHttpClient client;

  YoutubeRemoteDatasource(this.client);
  Future<List<ResultYoutube>> getYoutube() async {
    var response = await client.get(
      ConstantsApiUrls.getplaylistItems,
      {
        'key': ConstantsApiUrls.apiKey,
        'part': 'snippet',
        //TODO: TROCAR A PLAYLIST
        'playlistId': 'PLlBnICoI-g-d-v_fWlkZX2HRgHHPnJx9s',
        'maxResults': 8,
      },
    );

    if (response.statusCode == 200) {
      var jsonList = response.data['items'];
      var listYoutube =
          jsonList.map((e) => ResultYoutubeMapper.fromMap(e)).toList();
      final parsedList = List.castFrom<dynamic, ResultYoutube>(listYoutube);
      return parsedList;
    }

    return <ResultYoutube>[];
  }
}
