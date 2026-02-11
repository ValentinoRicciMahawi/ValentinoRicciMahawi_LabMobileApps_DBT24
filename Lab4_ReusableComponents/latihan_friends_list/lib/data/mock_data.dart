import '../models/user_model.dart';
import '../models/message_model.dart';

class MockData {
  static List<UserModel> getUsers() {
    return [
      UserModel(
        id: '1',
        name: 'Bahlil',
        avatar: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/720x0/webp/photo/2025/09/26/1043297320.jpg',
        isOnline: true,
      ),
      UserModel(
        id: '2',
        name: 'Megawati',
        avatar: 'https://kompaspedia.kompas.id/wp-content/uploads/2022/10/FC-09115-I-24-CMK008-1409x2048.jpg',
        isOnline: false,
      ),
      UserModel(
        id: '3',
        name: 'Tukul',
        avatar: 'https://i.pravatar.cc/150?img=12',
        isOnline: true,
      ),
      UserModel(
        id: '4',
        name: 'Gengis Khan',
        avatar: 'https://i.pravatar.cc/150?img=13',
        isOnline: false,
      ),
      UserModel(
        id: '5',
        name: 'Jule',
        avatar: 'https://i.pravatar.cc/150?img=9',
        isOnline: true,
      ),
      UserModel(
        id: '6',
        name: 'Saha',
        avatar: 'https://i.pravatar.cc/150?img=10',
        isOnline: false,
      ),
    ];
  }

  static Map<String, List<MessageModel>> getMessages() {
    return {
      '1': [
        MessageModel(
          id: 'm1',
          senderId: '1',
          receiverId: 'me',
          message: 'Pagi!',
          time: '1:35',
        ),
        MessageModel(
          id: 'm2',
          senderId: 'me',
          receiverId: '1',
          message: 'Pagi, Lil',
          time: '1:35',
        ),
        MessageModel(
          id: 'm3',
          senderId: 'me',
          receiverId: '1',
          message: 'Kapan kebon sawit jadi?',
          time: '1:35',
        ),
        MessageModel(
          id: 'm4',
          senderId: 'me',
          receiverId: '1',
          message: 'pengen masak ni gw',
          time: '1:35',
        ),
        MessageModel(
          id: 'm5',
          senderId: '1',
          receiverId: 'me',
          message: "doh sabar, duitnya kurang nih",
          time: '1:36',
        ),
        MessageModel(
          id: 'm6',
          senderId: 'me',
          receiverId: '1',
          message: "jyaelah",
          time: '1:36',
        ),
        MessageModel(
          id: 'm7',
          senderId: 'me',
          receiverId: '1',
          message: 'makannya duitnya jangan dibuat beli motor mulu dong',
          time: '1:36',
        ),
        MessageModel(
          id: 'm8',
          senderId: 'me',
          receiverId: '1',
          message: 'hedon lu',
          time: '1:36',
        ),
        MessageModel(
          id: 'm9',
          senderId: '1',
          receiverId: 'me',
          message: 'ya maap cok',
          time: '1:37',
        ),
      ],
      '2': [
        MessageModel(
          id: 'm10',
          senderId: '2',
          receiverId: 'me',
          message: 'Hidup Jokowi!',
          time: 'Yesterday',
        ),
      ],
      '3': [
        MessageModel(
          id: 'm11',
          senderId: '3',
          receiverId: 'me',
          message: 'Ok',
          time: 'Monday',
        ),
      ],
      '4': [
        MessageModel(
          id: 'm12',
          senderId: '4',
          receiverId: 'me',
          message: 'Check the documents',
          time: 'Monday',
        ),
      ],
      '5': [
        MessageModel(
          id: 'm13',
          senderId: '5',
          receiverId: 'me',
          message: 'Good morning',
          time: 'Sunday',
        ),
      ],
      '6': [
        MessageModel(
          id: 'm14',
          senderId: '6',
          receiverId: 'me',
          message: 'Thank you',
          time: 'Sunday',
        ),
      ],
    };
  }

  static String getLastMessage(String userId) {
    final messages = getMessages()[userId];
    if (messages == null || messages.isEmpty) return '';
    return messages.last.message;
  }

  static String getLastMessageTime(String userId) {
    final messages = getMessages()[userId];
    if (messages == null || messages.isEmpty) return '';
    return messages.last.time;
  }
}