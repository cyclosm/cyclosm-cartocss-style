/* Coming from openstreetmap-carto */
#ferry-routes {
  [zoom >= 8] {
    /* background prevents problems with overlapping ferry-routes, see #457 at openstreetmap-carto */
    background/line-color: @water;
    background/line-width: 1; /* Needs to be a bit wider than the route itself because of antialiasing */
    line-color: @ferry-route;
    line-width: 0.4;
    line-dasharray: 4,4;
    [zoom >= 11] {
      background/line-width: 1;
      line-width: 0.8;
      line-dasharray: 6,6;
    }
    [bicycle!=null][bicycle!='no'] {
      line-color: @cycle-fill;
    }
  }
}

#ferry-routes-text {
  [zoom >= 13] {
    text-name: "[name]";
    text-face-name: @sans;
    text-placement: line;
    text-fill: @ferry-route-text;
    text-spacing: 1000;
    text-size: 10;
    text-dy: -8;
  }
}
