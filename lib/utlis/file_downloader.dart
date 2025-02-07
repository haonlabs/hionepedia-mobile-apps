import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<String> downloadFile(String url, String fileName) async {
  try {
    // Mendapatkan direktori penyimpanan
    Directory? appDocDir = await getDownloadsDirectory();
    String savePath = '${appDocDir?.path}/$fileName'.trim();

    // Check if the file already exists
    File file = File(savePath);
    if (await file.exists()) {
      log('File already exists at: $savePath');
      return savePath; // Return the existing file path
    }

    // If the file does not exist, download it
    Dio dio = Dio();
    await dio.download(url, savePath);
    log('File downloaded to: $savePath');
    return savePath;
  } catch (e) {
    log('Error downloading file: $e');
    return '';
  }
}
