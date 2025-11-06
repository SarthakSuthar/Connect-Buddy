//log in green color
import 'dart:developer';

void showlog(String message) {
  log('\x1B[32m$message\x1B[0m');
}
