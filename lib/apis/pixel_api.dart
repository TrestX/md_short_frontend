import 'dart:convert';
import 'dart:io';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:http/http.dart' as http;
import 'package:platform_device_id/platform_device_id.dart';
class PixelApiClient {
  PixelApiClient();
  Future getPlatformId() async {
    var cj = CookieJar();
    List<Cookie> results = await cj.loadForRequest(Uri.parse("https://mdshorts.com/xx"));  
    if (results.isEmpty){
        final Uri url = Uri.https("bidder.doceree.com", '/v1/doceree-init');
        final response = await http.get(url);
        final jsonData = jsonDecode(response.body);
        final pUid = jsonData['platformUid'];
        Cookie("_docereeId",pUid);
        List<Cookie> cookies = [Cookie("_docereeId", pUid)];
        var cj = CookieJar();
        await cj.saveFromResponse(Uri.parse("https://mdshorts.com"),cookies);
        await cj.loadForRequest(Uri.parse("https://mdshorts.com/xx"));
    }
  }

  Future syncPixel() async {
    var cj = CookieJar();
    final fname = await ProfileNotifier().getFirstName();
    final eFname = base64.encode(utf8.encode(fname));
    final lname = await ProfileNotifier().getLastName();
    final elname = base64.encode(utf8.encode(lname));
    final pno = await ProfileNotifier().getPhoneNumber();
    final epno = base64.encode(utf8.encode(pno));
    final spec = await ProfileNotifier().getSpecialities();
    final espec = base64.encode(utf8.encode(spec.isNotEmpty?spec[0]:""));
    final lldev = await PlatformDeviceId.getDeviceId;
    List<Cookie> results = await cj.loadForRequest(Uri.parse("https://mdshorts.com/xx"));  
    var puid;
    if (results.isEmpty) {
        final Uri url0 = Uri.https("bidder.doceree.com", '/v1/doceree-init');
        final response = await http.get(url0);
        final jsonData = jsonDecode(response.body);
        puid = jsonData['platformUid'];
    }else{
      puid = results[0];
    } 
    final Uri url = Uri.https("qa-tracking.doceree.com", '/mdsync/',{"fname":eFname,"lname":elname,"pno":epno,"spec":espec,"puid":puid,"lldev":lldev});
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    await http.get(url, headers: requestHeaders);
  }
}
