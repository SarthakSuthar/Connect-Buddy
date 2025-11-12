import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker extends StatefulWidget {
  final String title;
  final String hint;
  final Function(File?) onImageSelected;
  final File? initialImage;
  final bool enabled;

  const AppImagePicker({
    super.key,
    required this.hint,
    required this.onImageSelected,
    this.initialImage,
    this.title = "",
    this.enabled = true,
  });

  @override
  State<AppImagePicker> createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.initialImage;
  }

  Future<void> _pickImage(BuildContext context) async {
    if (!widget.enabled) return;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  _setImage(pickedFile);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  _setImage(pickedFile);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _setImage(XFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled ? () => _pickImage(context) : null,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            Container(
              width: double.infinity,
              height: 160,
              // margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100,
              ),
              child: _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    )
                  : Center(
                      child: Text(
                        widget.hint,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
