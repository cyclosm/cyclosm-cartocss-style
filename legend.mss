#legend-icons {
    marker-file: url("symbols/legend/[icon].svg");
    marker-fill: #000;
    marker-placement: interior;
    marker-clip: false;
    marker-height: 20;
}

#legend-icons::text {
    text-name: "[label]";
    text-size: 13;
    text-face-name: @sans_bold;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: point;
    text-placements: E;
    text-dx: 20;
}

#legend-labels {
    text-name: "[label]";
    text-size: 13;
    text-face-name: @sans_bold;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: point;
    text-placements: S;
    text-dy: 20;
}
