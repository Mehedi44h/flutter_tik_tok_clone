

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/constant.dart';
import 'package:tik_tok_clone/controllers/auth_controller.dart';
import 'package:tik_tok_clone/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {

  // compress video and upload to firebase storage
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  // upload video to firebase storage
  

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnil(String videoPath) async {
    final thumbnil = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnil;
  }

  // upload thumbnil image to firebase storage
  Future<String> _upLoadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnils').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnil(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;

      String videoUrl = await _uploadVideoToStorage("video $len", videoPath);

      String thumbnil = await _upLoadImageToStorage("Video $len", videoPath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "video $len ",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songname: songName,
        caption: caption,
        videoUrl: videoUrl,
        thumbnil: thumbnil,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
      );
      await firestore
          .collection('videos')
          .doc("video $len ")
          .set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar("Error uploading video", e.toString());
    }
  }
}
