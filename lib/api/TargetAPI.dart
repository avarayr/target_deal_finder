import 'dart:convert';
import 'package:http/http.dart' as http;

class TargetAPI {
  TargetAPI();

  Future<dynamic> getItemListingByUPC(String upc) async {
    final url =
        "https://redsky.target.com/v2/plp/search/?channel=web&keyword=$upc&pricing_store_id=0&key=0";
    var result = await http.get(url);
    var searchResult = json.decode(result.body);
    var items = searchResult['search_response']['items']['Item'] as List;
    if (items.length == 0) return null;
    return items[0];
  }
}
