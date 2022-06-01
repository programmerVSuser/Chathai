import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class howToUes extends StatefulWidget {
  const howToUes({Key key}) : super(key: key);

  @override
  _howToUesState createState() => _howToUesState();
}

class _howToUesState extends State<howToUes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text(
              'Usability Chathai Club',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 10, right: 10,top: 15,bottom: 10),
          child: Column(
            children: [
              Container(padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'image/Cha.png',
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) => EntryItem(
                  data[index],
                ),
              ),
            ],
          ),
        ));
  }
}

class Entry {
  final String title;
  final List<Entry>
  children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> data = <Entry>[
  Entry('1. ชาไทย คลับ คืออะไร', <Entry>[
    Entry('เเอพพลิเคชั่นชาไทยมีไว้เพื่อเก็บสะสมเเต้มคะเเนน สร้างขึ้นมาเพื่อความสดวกในการเก็บรักษาเเต้มคะเเนนอันมีค่าจากร้าน ชาไทย คลับ เพื่อป้องกันการชำรุด ขาด หาย เมื่อเก็บเเต้มคะเเนนด้วยกระดาษดังร้านขายน้ำทั่วไป ทำให้ลูกค้าอันเป็นที่รักต้องเสียสิทธิ์ในผลประโยชน์ของตัวเอง ทางร้านชาไทย คลับ ได้เล็งเห็นถึงปัญหาดังกล่าวได้จัดทำเเอพพลิเคชั่นเพื่อให้ลูกค้าอันเป็นที่รักใช้สิทธิของตัวเองอย่างสูงสุด ทางร้านชาไทย คลับ ขอขอบคุณทุกท่านที่ไว้วางใจติดตั้ง เเอพพลิเคชั่น ขอขอบคุณคับ'),
      ],
  ),
  Entry('2. วิธีดูหน้าของสินค้า', <Entry>[
    Entry('สามารดูสินค้าของทางร้านชาไทย คลับ ได้โดย'),
    Entry('1.กดไอคอน รูปบ้าน หรือชื่อปุ่มว่า Home ตรงเเถบเมนู ปุ่มด้านล่าง'),
  ],
  ),
  Entry('3. วิธีดูเเต้มคะเเนนสะสม', <Entry>[
    Entry('คุณสามารถดูเเต้มคะเเนนสะสมได้โดยกดไอคอน รูปเหรียญ หรือชื่อปุ่มว่า Point ตรงเเถบเมนู ปุ่มด้านล่าง'),
    Entry('หากคุณยังไม่ได้เติมโค้ดเพิ่อเพิ่มเเต้มคะเเนนของคุณในหน้าเเต้มคะเเนนของคุณจะว่างป่าวเเละจะมีไอคอนรีโหลดหมุนเพื่อรอข้อมูลคะเเนนของคุณ'),

  ]),
  Entry('4. วิธีติดต่อกับผู้ดูเเลระบบ', <Entry>[
    Entry('คุณสามารถสอบถามหรือเเจ้งปัณหามีวิธีดังนี'),
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า Contact'),
    Entry('ในหน้า Contast Chathai Club จะมีข้อมูลที่สามารถติดต่อผู้ดูเเลระบบสามารถติดต่อได้ตามช่องทางด้านล่าง'),
  ]),
  Entry('5. วิธีดูร้านค้าเเละสาขาในประเทศไทย', <Entry>[
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า Shop Location'),
    Entry('ในหน้า Map Chathai Club จะบอกตำเเหน่งร้านค้าทั้งหมดในประเทศไทย สรามารถกดตรงหมุมสีเเดงเพื่อดูชื่อสาขาของทางร้านได้'),
  ]),
  Entry('6. วิธีดูเงื่อนไขเเละข้อตกลงของทางร้าน', <Entry>[
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า Terms and Conditions'),
  ]),
  Entry('7. เกี่ยวกับชาไทย คลับ', <Entry>[
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า About Chathai Club'),
  ]),
  Entry('8. วิธีเพิ่มรูปภาพเเละข้อมูลของคุณ', <Entry>[
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า Information'),
    Entry('กดไอคอนกล้องเพื่อทำการโหลดรูปภาพของคุณ'),
    Entry('กดไอคอนดินสอ เพื่อเพิ่มข้อมูลของคุณ'),
    Entry('กดปุ่ม Save เพื่อเพิ่มข้อมูลของคุณ'),
  ]),
  Entry('9. วิธิเพิ่มเเต้มคะเเนนของคุณ', <Entry>[
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า Add point '),
    Entry('ทำการกรอกพ้อยของคุณที่ได้จากบนเเก้วน้ำของทางร้าน ชาไทย คลับ ต่อมาทำการกดปุ่ม Save Point เพื่อเพิ่มเเต้มคะเเนนของคุณ'),
    Entry('หากเเต้มคะเเนนของคุนเต็ม10คะเเนนไม่สามารถกดปุ่ม Add point ได้ จะต้องทำการเเลกเเต้มคะเเนนของคุณ'),
  ]),
  Entry('10. วิธิเเลกเเต้มคะเเนนของคุณ', <Entry>[
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า Exchange Point'),
    Entry('ในหน้า Sceen Point คุณสามารถเเลกเเต้มคะเเนนโดยการกดปุ่ม Scanner Point เพื่อทำการ Scanner QR ของทางร้าน เพื่อทำการเเลกเเต้มคะเเนน'),
  ]),
  Entry('11. วิธีออกจากระบบ', <Entry>[
    Entry('ไปยังหน้า Dashboard เเละกดปุ่มที่ชื่อว่า Log Out'),
  ]),
  Entry('12. วิธีเปลี่ยนพาสเวิร์ด', <Entry>[
    Entry('ให้ทำการออกจากระบบ เเละในหน้าเเรกของเเอพพลิเคชันชาไทย คลับ จะมี ข้อความปุ่มสีเเดงที่ชื่อว่า Reset Password ทำการกดปุ่ม ใส่ อีเมลที่ทำการล็อกอิน เเล้วกดปุ่ม Reset จะมีลิ้งค์ส่งไปยังอีเมล ทำการกดลิ้งเพื่อเปลี่ยนพาสเวิร์ด'),
  ]),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(color: Colors.red[700], fontSize: 14),
      ),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
