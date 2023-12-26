class Product {
  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.quantity,
      required this.tags,
      required this.imagepath,
      required this.category,
      required this.liked});
  final String name;
  final String price;
  final String description;
  final int quantity;
  final List<String> tags;
  final List<String> imagepath;
  final String category;
  bool liked;
}

List<Product> samples = [
  Product(
      name: "Apple iPhone 15 Pro (Blue Titanium)",
      price: "₹1,39,900",
      description:
          "FORGED IN TITANIUM — iPhone 15 Pro has a strong and light aerospace-grade titanium design with a textured matte-glass back. ADVANCED DISPLAY — The 6.1” Super Retina XDR display with ProMotion ramps up refresh rates to 120Hz when you need exceptional graphics performance. GAME-CHANGING A17 PRO CHIP — A17 Pro is incredibly efficient and helps to deliver amazing all-day battery life.POWERFUL PRO CAMERA SYSTEM — Get incredible framing flexibility with 7 pro lenses. Capture super high-resolution photos with more color and detail.CUSTOMIZABLE ACTION BUTTON — Action button is a fast track to your favorite feature. Just set the one you want, like Silent mode, Camera, Voice Memo, Shortcut, and more. Then press and hold to launch the action.",
      quantity: 3,
      tags: [],
      imagepath: [
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1692846360609",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV1_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1692846357281",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV2?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1693011635011",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV3?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1693011636681"
      ],
      category: "Electronics",
      liked: false),
  Product(
      name: "PWRFrame TR 2 Men's Training Shoes",
      price: "₹4,499",
      description:
          "Start every workout the right way and with the ultimate foundation. PWRFrame TR 2 is a high-performance training shoe that features a 3D midsole frame system engineered for forefoot support during explosive movements. This targeted technology helps keep you steady through every interval and a wide range of routines. Prepare to own your session in this function-packed style.Ultra-thin TPU frame, strategically placed in the high-stress areas to deliver lightweight support and increased stability.Lightweight EVA designed to cushion your landing and propel your next step.Durable performance rubber compound designed for all-surface tractionLow-cut boot.Textile upper PWRFrame support PROFOAM midsole Rubber outsole Heel-to-toe drop: 10mm Style: 378790_02 Color: Ash Gray-Ultra Blue",
      quantity: 2,
      tags: [],
      imagepath: [
        "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/378790/02/sv04/fnd/IND/fmt/png/PWRFrame-TR-2-Men's-Training-Shoes",
        "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/378790/02/sv01/fnd/IND/fmt/png/PWRFrame-TR-2-Men's-Training-Shoes",
        "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/378790/02/bv/fnd/IND/fmt/png/PWRFrame-TR-2-Men's-Training-Shoes",
        "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/378790/02/sv02/fnd/IND/fmt/png/PWRFrame-TR-2-Men's-Training-Shoes"
      ],
      category: "Clothes and Footwear",
      liked: false),
  Product(
      name: "Apple iPhone 15 Pro (Blue Titanium)",
      price: "₹1,39,900",
      description:
          "FORGED IN TITANIUM — iPhone 15 Pro has a strong and light aerospace-grade titanium design with a textured matte-glass back. ADVANCED DISPLAY — The 6.1” Super Retina XDR display with ProMotion ramps up refresh rates to 120Hz when you need exceptional graphics performance. GAME-CHANGING A17 PRO CHIP — A17 Pro is incredibly efficient and helps to deliver amazing all-day battery life.POWERFUL PRO CAMERA SYSTEM — Get incredible framing flexibility with 7 pro lenses. Capture super high-resolution photos with more color and detail.CUSTOMIZABLE ACTION BUTTON — Action button is a fast track to your favorite feature. Just set the one you want, like Silent mode, Camera, Voice Memo, Shortcut, and more. Then press and hold to launch the action.",
      quantity: 1,
      tags: [],
      imagepath: [
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1692846360609",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV1_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1692846357281",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV2?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1693011635011",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV3?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1693011636681"
      ],
      category: "Electronics",
      liked: false),
  Product(
      name: "Apple iPhone 15 Pro (Blue Titanium)",
      price: "₹1,39,900",
      description:
          "FORGED IN TITANIUM — iPhone 15 Pro has a strong and light aerospace-grade titanium design with a textured matte-glass back. ADVANCED DISPLAY — The 6.1” Super Retina XDR display with ProMotion ramps up refresh rates to 120Hz when you need exceptional graphics performance. GAME-CHANGING A17 PRO CHIP — A17 Pro is incredibly efficient and helps to deliver amazing all-day battery life.POWERFUL PRO CAMERA SYSTEM — Get incredible framing flexibility with 7 pro lenses. Capture super high-resolution photos with more color and detail.CUSTOMIZABLE ACTION BUTTON — Action button is a fast track to your favorite feature. Just set the one you want, like Silent mode, Camera, Voice Memo, Shortcut, and more. Then press and hold to launch the action.",
      quantity: 5,
      tags: [],
      imagepath: [
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1692846360609",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV1_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1692846357281",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV2?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1693011635011",
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium_AV3?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1693011636681"
      ],
      category: "Electronics",
      liked: false)
];
