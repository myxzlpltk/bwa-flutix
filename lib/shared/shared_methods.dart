part of 'shared.dart';

Future<File> getImage() async {
  PickedFile pickedFile =
  await ImagePicker().getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

Future<String> uploadImage(File image, String uid) async{
  String fileName = uid + extension(image.path);

  try{
    TaskSnapshot task = await FirebaseStorage.instance.ref("avatars/$fileName").putFile(image);
    String downloadURL = await task.ref.getDownloadURL();

    return downloadURL;
  } catch (e){
    return null;
  }
}