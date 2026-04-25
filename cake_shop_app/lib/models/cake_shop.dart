class CakeShop {
  //ตัวแปรที่ใช้เก็บข้อมูล แมปกับรายละเอียดของสินค้า
  String? name;
  String? address;
  String? phone;
  String? image1;
  String? image2;
  String? image3;
  String? description;
  String? openCloseTime;
  String? website;
  String? facebook;
  String? latitude;
  String? longitude;

// สร้าง constructor เอาไว้สร้าง object เพื่อเก็บข้อมูล/แพ็คข้อมูล
  CakeShop({
    this.name,
    this.address,
    this.phone,
    this.image1,
    this.image2,
    this.image3,
    this.description,
    this.openCloseTime,
    this.website,
    this.facebook,
    this.latitude,
    this.longitude,
  });
}