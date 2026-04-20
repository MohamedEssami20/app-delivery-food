import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;

import '../utils/app_keys.dart';

class SupabaseStorageService {
  static final SupabaseClient client = Supabase.instance.client;

  static Future<String?> uploadProfileImage(File file, String userId) async {
    try {
      final fileName =
          '$userId-${DateTime.now().millisecondsSinceEpoch}${path.extension(file.path)}';
      final storagePath = 'profile_images/$fileName';

      // Ensure you have created a bucket named 'avatars' in your Supabase project
      // and updated its policies to allow public read/write if necessary.
      final bucket = client.storage.from('avatars');

      await bucket.upload(storagePath, file);

      final publicUrl = bucket.getPublicUrl(storagePath);
      return publicUrl;
    } catch (e) {
      log('Supabase upload error: $e');
      return null;
    }
  }

  // create method that create bucket 
 static Future<void> createBucket(String bucketName) async {
    BucketOptions bucketOptions = const BucketOptions(public: true);
    List<Bucket> bucketList = await client.storage.listBuckets();
    bool isbucketExits = false;
    for (var bucket in bucketList) {
      if (bucket.id == bucketName) {
        isbucketExits = true;
        break;
      }
    }
    if (!isbucketExits) {
      await client.storage.createBucket(bucketName, bucketOptions);
    }
  }

  // intial supabase;
  static Future<void> initSupabase() async {
    await Supabase.initialize(
      url: AppKeys.supabaseProjectUrl,
      anonKey: AppKeys.supabaseAnonKey,
    );
    log("******** supabase intialized********");
  }
}
