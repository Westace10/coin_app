import 'package:flutter_dotenv/flutter_dotenv.dart';

const String baseUrl =
    'https://akeem-ashaolu-s-workspace-ldgbe5.us-east-1.xata.sh/db/';
var headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': dotenv.env['API_KEY']!,
};
