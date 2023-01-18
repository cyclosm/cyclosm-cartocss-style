#aerialways {
  [aerialway = 'cable_car'],
  [aerialway = 'gondola'],
  [aerialway = 'mixed_lift'] {
    [zoom >= 12] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: #808080;

      dash/line-width: 3;
      dash/line-join: round;
      dash/line-cap: round;
      dash/line-color: black;
      dash/line-dasharray: 0.4,13;
      dash/line-clip: false;

      [bicycle='yes'] {
        line/line-color: @cycle-fill;
        dash/line-color: darken(@cycle-fill, 25%);
      }

      [zoom >= 17] {
        text-name: "[name]";
        text-fill: #666666;
        text-size: 10;
        text-dy: 4;
        text-spacing: 900;
        text-clip: false;
        text-placement: line;
        text-min-distance: 18;
        text-face-name: @sans;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
      }
      [zoom >= 19] {
        text-size: 11;
        text-dy: 5;
      }
    }
  }

  [aerialway = 'goods'] {
    [zoom >= 12] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: #808080;

      dash/line-width: 3.5;
      dash/line-join: round;
      dash/line-color: #707070;
      dash/line-dasharray: 6,25;
      dash/line-clip: false;

      [bicycle='yes'] {
        line/line-color: @cycle-fill;
        dash/line-color: lighten(@cycle-fill, 12.5%);
      }

      [zoom >= 17] {
        text-name: "[name]";
        text-fill: #666666;
        text-size: 10;
        text-dy: 4;
        text-spacing: 900;
        text-clip: false;
        text-placement: line;
        text-min-distance: 18;
        text-face-name: @sans;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
      }
      [zoom >= 19] {
        text-size: 11;
        text-dy: 5;
      }
    }
  }

  [aerialway = 'chair_lift'],
  [aerialway = 'drag_lift'],
  [aerialway = 't-bar'],
  [aerialway = 'j-bar'],
  [aerialway = 'platter'],
  [aerialway = 'rope_tow'],
  [aerialway = 'magic_carpet'],
  [aerialway = 'zip_line'] {
    [zoom >= 12] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: #808080;

      dash/line-width: 4;
      dash/line-join: round;
      dash/line-color: black;
      dash/line-dasharray: 1,30;
      dash/line-clip: false;

      [bicycle='yes'] {
        line/line-color: @cycle-fill;
        dash/line-color: darken(@cycle-fill, 25%);
      }

      [zoom >= 17] {
        text-name: "[name]";
        text-fill: #666666;
        text-size: 10;
        text-dy: 4;
        text-spacing: 900;
        text-clip: false;
        text-placement: line;
        text-min-distance: 18;
        text-face-name: @sans;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
      }
      [zoom >= 19] {
        text-size: 11;
        text-dy: 5;
      }
    }
  }
}
