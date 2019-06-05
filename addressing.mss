/* Features related to (postal) adresses: */

@address-color: #666;

#addresses {
  [zoom >= 18] {
    text-name: "[addr_housename]";
    ["addr_housenumber" != null] {
      text-name: [addr_housenumber];
      ["addr_housename" != null] {
        text-name: [addr_housenumber] + "\n" + [addr_housename];
      }
      ["addr_unit" != null] {
        text-name: [addr_housenumber] + " " + [addr_unit];
        ["addr_housename" != null] {
          text-name: [addr_housenumber] + " " + [addr_unit] + "\n" + [addr_housename];
        }
      }
    }
    text-placement: interior;
    text-face-name: @sans;
    text-fill: @address-color;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-size: 10;
    text-wrap-width: 30; // 3.0 em
    text-line-spacing: -1.5; // -0.15 em
    text-margin: 3; // 0.3 em
    [zoom >= 18] {
      text-halo-radius: @standard-halo-radius * 1.25;
      ["addr_unit" != null]["addr_housenumber" = null] {
        text-name: [addr_unit];
      }
    }
    [zoom >= 20] {
        text-size: 11;
        text-wrap-width: 22; // 2.0 em
        text-line-spacing: -1.65; // -0.15 em
        text-margin: 3.3; // 0.3 em
    }
  }
}
