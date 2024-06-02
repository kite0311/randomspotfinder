class Types {
  static final Entertainment entertainment = Entertainment();
  static final FoodAndDrink foodAndDrink = FoodAndDrink();
  static final Shopping shopping = Shopping();
  static final HealthAndWellness healthAndWellness = HealthAndWellness();
  static final Services services = Services();
  static final Transportation transportation = Transportation();
  static final EducationAndGovernment educationAndGovernment =
      EducationAndGovernment();
  static final Miscellaneous miscellaneous = Miscellaneous();
}
/*
 * Places API のtypesに設定可能な値を定数化
 * コメントアウト個所は、現状の仕様では使用しない想定
 */

class Entertainment {
  static const String AMUSEMENT_PARK = 'amusement_park'; // 遊園地
  static const String AQUARIUM = 'aquarium'; // 水族館
  static const String CASINO = 'casino'; // カジノ
  static const String MOVIE_THEATER = 'movie_theater'; // 映画館
  static const String MUSEUM = 'museum'; // 博物館
  static const String NIGHT_CLUB = 'night_club'; // ナイトクラブ
  static const String PARK = 'park'; // 公園
  static const String STADIUM = 'stadium'; // スタジアム
  static const String ZOO = 'zoo'; // 動物園
  static const String ART_GALLERY = 'art_gallery'; // 美術館

  static const List<String> entertainmentList = [
    Entertainment.AMUSEMENT_PARK,
    Entertainment.AQUARIUM,
    Entertainment.CASINO,
    Entertainment.MOVIE_THEATER,
    Entertainment.MUSEUM,
    Entertainment.NIGHT_CLUB,
    Entertainment.PARK,
    Entertainment.STADIUM,
    Entertainment.ZOO,
    Entertainment.ART_GALLERY,
  ];
}

class FoodAndDrink {
  static const String BAKERY = 'bakery'; // パン屋
  static const String BAR = 'bar'; // バー
  static const String CAFE = 'cafe'; // カフェ
  static const String RESTAURANT = 'restaurant'; // レストラン
  static const String LIQUOR_STORE = 'liquor_store'; // 酒屋

  static const List<String> foodAndDrinkList = [
    FoodAndDrink.BAKERY,
    FoodAndDrink.BAR,
    FoodAndDrink.CAFE,
    FoodAndDrink.RESTAURANT,
    FoodAndDrink.LIQUOR_STORE,
  ];
}

class Shopping {
  static const String BOOK_STORE = 'book_store'; // 書店
  static const String CLOTHING_STORE = 'clothing_store'; // 衣料品店
  static const String CONVENIENCE_STORE = 'convenience_store'; // コンビニ
  static const String DEPARTMENT_STORE = 'department_store'; // デパート
  static const String ELECTRONICS_STORE = 'electronics_store'; // 電気店
  static const String FURNITURE_STORE = 'furniture_store'; // 家具店
  static const String HARDWARE_STORE = 'hardware_store'; // ハードウェア店
  static const String HOME_GOODS_STORE = 'home_goods_store'; // 家庭用品店
  static const String JEWELRY_STORE = 'jewelry_store'; // 宝石店
  static const String PET_STORE = 'pet_store'; // ペットショップ
  static const String SHOE_STORE = 'shoe_store'; // 靴屋
  static const String SHOPPING_MALL = 'shopping_mall'; // ショッピングモール
  static const String STORE = 'store'; // 店舗
  static const String SUPERMARKET = 'supermarket'; // スーパーマーケット

  static const List<String> shoppingList = [
    Shopping.BOOK_STORE,
    Shopping.CLOTHING_STORE,
    Shopping.CONVENIENCE_STORE,
    Shopping.DEPARTMENT_STORE,
    Shopping.ELECTRONICS_STORE,
    Shopping.FURNITURE_STORE,
    Shopping.HARDWARE_STORE,
    Shopping.HOME_GOODS_STORE,
    Shopping.JEWELRY_STORE,
    Shopping.PET_STORE,
    Shopping.SHOE_STORE,
    Shopping.SHOPPING_MALL,
    Shopping.STORE,
    Shopping.SUPERMARKET,
  ];
}

class HealthAndWellness {
  static const String BEAUTY_SALON = 'beauty_salon'; // 美容院
  static const String DENTIST = 'dentist'; // 歯医者
  // static const String DOCTOR = 'doctor'; // 医者
  static const String GYM = 'gym'; // ジム
  static const String HAIR_CARE = 'hair_care'; // ヘアケア
  static const String HOSPITAL = 'hospital'; // 病院
  static const String PHARMACY = 'pharmacy'; // 薬局
  // static const String PHYSIOTHERAPIST = 'physiotherapist'; // 理学療法士
  static const String SPA = 'spa'; // スパ
  // static const String VETERINARY_CARE = 'veterinary_care'; // 獣医

  static const List<String> healthAndWellnessList = [
    HealthAndWellness.BEAUTY_SALON,
    HealthAndWellness.DENTIST,
    HealthAndWellness.GYM,
    HealthAndWellness.HAIR_CARE,
    HealthAndWellness.HOSPITAL,
    HealthAndWellness.PHARMACY,
    HealthAndWellness.SPA,
  ];
}

class Services {
  static const String ATM = 'atm'; // ATM
  static const String BANK = 'bank'; // 銀行
  // static const String CAR_DEALER = 'car_dealer'; // 車のディーラー
  static const String CAR_RENTAL = 'car_rental'; // レンタカー
  // static const String CAR_REPAIR = 'car_repair'; // 自動車修理
  // static const String CAR_WASH = 'car_wash'; // カーウォッシュ
  // static const String ELECTRICIAN = 'electrician'; // 電気工事士
  // static const String FIRE_STATION = 'fire_station'; // 消防署
  static const String GAS_STATION = 'gas_station'; // ガソリンスタンド
  static const String LAUNDRY = 'laundry'; // ランドリー
  // static const String LAWYER = 'lawyer'; // 弁護士
  // static const String LOCKSMITH = 'locksmith'; // 鍵屋
  // static const String MOVING_COMPANY = 'moving_company'; // 引っ越し業者
  static const String PAINTER = 'painter'; // 画家
  // static const String PLUMBER = 'plumber'; // 配管工
  static const String POLICE = 'police'; // 警察
  // static const String ROOFING_CONTRACTOR = 'roofing_contractor'; // 屋根工事業者
  static const String STORAGE = 'storage'; // 倉庫

  static const List<String> servicesList = [
    Services.ATM,
    Services.BANK,
    Services.CAR_RENTAL,
    Services.GAS_STATION,
    Services.LAUNDRY,
    Services.PAINTER,
    Services.POLICE,
    Services.STORAGE,
  ];
}

class Transportation {
  static const String AIRPORT = 'airport'; // 空港
  static const String BUS_STATION = 'bus_station'; // バス停
  // static const String LIGHT_RAIL_STATION = 'light_rail_station'; // 軽便鉄道駅
  static const String SUBWAY_STATION = 'subway_station'; // 地下鉄駅
  static const String TAXI_STAND = 'taxi_stand'; // タクシー乗り場
  static const String TRAIN_STATION = 'train_station'; // 鉄道駅
  static const String TRANSIT_STATION = 'transit_station'; // 交通駅

  static const List<String> transportationList = [
    Transportation.AIRPORT,
    Transportation.BUS_STATION,
    Transportation.SUBWAY_STATION,
    Transportation.TAXI_STAND,
    Transportation.TRAIN_STATION,
    Transportation.TRANSIT_STATION,
  ];
}

class EducationAndGovernment {
  static const String CITY_HALL = 'city_hall'; // 市役所
  static const String COURTHOUSE = 'courthouse'; // 裁判所
  static const String LIBRARY = 'library'; // 図書館
  static const String PRIMARY_SCHOOL = 'primary_school'; // 小学校
  static const String SCHOOL = 'school'; // 学校
  static const String SECONDARY_SCHOOL = 'secondary_school'; // 中学校
  static const String UNIVERSITY = 'university'; // 大学

  static const List<String> educationAndGovernmentList = [
    EducationAndGovernment.CITY_HALL,
    EducationAndGovernment.COURTHOUSE,
    EducationAndGovernment.LIBRARY,
    EducationAndGovernment.PRIMARY_SCHOOL,
    EducationAndGovernment.SCHOOL,
    EducationAndGovernment.SECONDARY_SCHOOL,
    EducationAndGovernment.UNIVERSITY,
  ];
}

class Miscellaneous {
  static const String CAMPGROUND = 'campground'; // キャンプ場
  static const String CEMETERY = 'cemetery'; // 墓地
  static const String CHURCH = 'church'; // 教会
  static const String EMBASSY = 'embassy'; // 大使館
  static const String FLORIST = 'florist'; // 花屋
  // static const String FUNERAL_HOME = 'funeral_home'; // 葬儀場
  // static const String HINDU_TEMPLE = 'hindu_temple'; // ヒンドゥー教の寺院
  static const String LODGING = 'lodging'; // 宿泊施設
  static const String MEAL_DELIVERY = 'meal_delivery'; // 食事配達
  static const String MEAL_TAKEAWAY = 'meal_takeaway'; // テイクアウト
  // static const String MOSQUE = 'mosque'; // モスク
  static const String MOVIE_RENTAL = 'movie_rental'; // ビデオレンタル
  static const String PARKING = 'parking'; // 駐車場
  static const String POST_OFFICE = 'post_office'; // 郵便局
  static const String REAL_ESTATE_AGENCY = 'real_estate_agency'; // 不動産代理店
  // static const String RV_PARK = 'rv_park'; // RVパーク
  // static const String SYNAGOGUE = 'synagogue'; // シナゴーグ
  static const String TOURIST_ATTRACTION = 'tourist_attraction'; // 観光名所
  static const String TRAVEL_AGENCY = 'travel_agency'; // 旅行代理店
  static const String BICYCLE_STORE = 'bicycle_store'; // 自転車店
// static const String DRUGSTORE = 'drugstore'; // 薬局
// static const String INSURANCE_AGENCY = 'insurance_agency'; // 保険代理店
// static const String LOCAL_GOVERNMENT_OFFICE = 'local_government_office'; // 地方自治体のオフィス

  static const List<String> miscellaneousList = [
    Miscellaneous.CAMPGROUND,
    Miscellaneous.CEMETERY,
    Miscellaneous.CHURCH,
    Miscellaneous.EMBASSY,
    Miscellaneous.FLORIST,
    Miscellaneous.LODGING,
    Miscellaneous.MEAL_DELIVERY,
    Miscellaneous.MEAL_TAKEAWAY,
    Miscellaneous.MOVIE_RENTAL,
    Miscellaneous.PARKING,
    Miscellaneous.POST_OFFICE,
    Miscellaneous.REAL_ESTATE_AGENCY,
    Miscellaneous.TOURIST_ATTRACTION,
    Miscellaneous.TRAVEL_AGENCY,
    Miscellaneous.BICYCLE_STORE,
  ];
}
