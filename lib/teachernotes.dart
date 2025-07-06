import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class StreamSelectionPage extends StatelessWidget {
  const StreamSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme for a sleek look
      appBar: AppBar(
        title: const Text(
          'Select Stream & Year',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildStreamCard(context, 'BSC IT', 'FY'),
            _buildStreamCard(context, 'BSC IT', 'SY'),
            _buildStreamCard(context, 'BSC IT', 'TY'),
            _buildStreamCard(context, 'BSC Data Science', 'FY'),
            _buildStreamCard(context, 'BSC Data Science', 'SY'),
            _buildStreamCard(context, 'BSC Data Science', 'TY'),
          ],
        ),
      ),
    );
  }

  Widget _buildStreamCard(BuildContext context, String stream, String year) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[900],
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(stream: stream, year: year),
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback:
                    (bounds) => LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: const Icon(
                  Icons.library_books,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8), // Reduced from 16
              ShaderMask(
                shaderCallback:
                    (bounds) => LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: Text(
                  stream,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 4), // Reduced from 8
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4, // Reduced from 6
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  year,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String stream;
  final String year;

  const ChatScreen({super.key, required this.stream, required this.year});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  PlatformFile? _selectedFile;

  Future<void> _sendMessage() async {
    if (_messageController.text.isEmpty && _selectedFile == null) return;

    try {
      Map<String, dynamic> messageData = {
        'timestamp': FieldValue.serverTimestamp(),
        'sender': 'teacher',
        'stream': widget.stream,
        'year': widget.year,
      };

      if (_selectedFile != null) {
        // Check if file data exists
        if (_selectedFile!.bytes == null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('No file data found!')));
          return;
        }

        // Upload to Firebase Storage
        Reference storageRef = _storage.ref().child(
          'notes/${widget.stream}/${widget.year}/${DateTime.now().millisecondsSinceEpoch}_${_selectedFile!.name}',
        );

        UploadTask uploadTask = storageRef.putData(_selectedFile!.bytes!);
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();

        messageData.addAll({
          'fileUrl': downloadUrl,
          'fileName': _selectedFile!.name,
          'fileType': _selectedFile!.extension ?? 'unknown',
          'type': 'file',
        });
      } else {
        messageData.addAll({'text': _messageController.text, 'type': 'text'});
      }

      // Add to Firestore
      await _firestore
          .collection('notes')
          .doc('${widget.stream}_${widget.year}')
          .collection('messages')
          .add(messageData);

      _messageController.clear();
      setState(() => _selectedFile = null);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Upload failed: ${e.toString()}')));
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
      withData: true, // ← THIS IS CRUCIAL
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          '${widget.stream} ${widget.year}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    _firestore
                        .collection('notes')
                        .doc('${widget.stream}_${widget.year}')
                        .collection('messages')
                        .orderBy('timestamp', descending: true)
                        .snapshots(), // Added stream parameter
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    );
                  }

                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var message = snapshot.data!.docs[index];
                      return _buildMessageItem(message);
                    },
                  );
                },
              ),
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot message) {
    final bool isMe = message['sender'] == 'teacher';
    final timestamp = message['timestamp']?.toDate() ?? DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  isMe
                      ? Colors.blue[800]?.withOpacity(0.9)
                      : Colors.grey[800]?.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: isMe ? Radius.circular(20) : Radius.circular(0),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message['type'] == 'file')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.insert_drive_file,
                        size: 40,
                        color: Colors.white70,
                      ),
                      SizedBox(height: 8),
                      Text(
                        message['fileName'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blueAccent, Colors.lightBlue],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton.icon(
                          icon: Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            'Download',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed:
                              () => _downloadFile(
                                message['fileUrl'],
                                message['fileName'],
                              ),
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    message['text'] ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                SizedBox(height: 8),
                Text(
                  DateFormat('HH:mm').format(timestamp),
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.blue),
            onPressed: _pickFile,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child:
                        _selectedFile == null
                            ? TextField(
                              controller: _messageController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Type your message...',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            )
                            : Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.insert_drive_file,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      _selectedFile!.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    onPressed:
                                        () => setState(
                                          () => _selectedFile = null,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlue],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadFile(String url, String fileName) async {
    try {
      final directory = await getDownloadsDirectory();
      if (directory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cannot access download directory')),
        );
        return;
      }
      final savePath = '${directory.path}/$fileName';

      // Check if file already exists
      bool fileExists = await File(savePath).exists();
      if (fileExists) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('File already downloaded')));
        _openFile(savePath);
        return;
      }

      Dio dio = Dio();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Downloading $fileName...'),
            ],
          ),
        ),
      );

      await dio.download(url, savePath);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File saved to Downloads'),
          backgroundColor: Colors.green,
        ),
      );
      _openFile(savePath);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Download failed: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _openFile(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cannot open file: ${result.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error opening file: ${e.toString()}')),
      );
    }
  }
}
