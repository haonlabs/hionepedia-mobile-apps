import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<String> downloadFile(String url, String fileName) async {
  try {
    Dio dio = Dio();
    // Mendapatkan direktori penyimpanan
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String savePath = '${appDocDir.path}/$fileName';

    // Mengunduh file
    await dio.download(url, savePath);
    log('File downloaded to: $savePath');
    return savePath;
  } catch (e) {
    log('Error downloading file: $e');
    return '';
  }
}
