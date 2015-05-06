// Color palette //
@water: #9eb7b7;
@river: #8080c2;
@drain:  mix(@river,red,60);

// Water Features (including riverbanks) //
#water {
  ::shadow {
    polygon-fill: mix(@land,@fill4,75);
  }
  ::fill {
    polygon-fill: @water;
    // blurring reveals the polygon fill from ::shadow around
    // the edges of the water
    image-filters: agg-stack-blur(5,5);
  }
}

// Wetland / Floodprone Areas //
#landuse_overlay[class='wetland'] {
  ::shadow {
    polygon-fill: mix(@water,@fill4,75);
    polygon-opacity: 0.2;
  }
  ::fill {
    polygon-fill: @water;
    polygon-opacity: 0.2;
    // blurring reveals the polygon fill from ::shadow around
    // the edges of the water
    image-filters: agg-stack-blur(5,5);
  }
}

// Rivers, Streams, Canals //
#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @river;
    line-width: 0.5;
    [zoom>=12] { line-width: 1.0; }
    [zoom>=13] { line-width: 1.3; }
    [zoom>=14] { line-width: 2.6; }
    [zoom>=15] { line-width: 3.4; }
    [zoom>=16] { line-width: 3.8; }
    [zoom>=17] { line-width: 4.4; }
    [zoom>=18] { line-width: 5.0; }
    [zoom>=19] { line-width: 6.0; }
  }
  [type='stream'] {
    line-color: @river;
    line-width: 0.5;
    [zoom>=13] { line-width: 0.7; }
    [zoom>=14] { line-width: 1.3; }
    [zoom>=15] { line-width: 1.7; }
    [zoom>=16] { line-width: 1.9; }
    [zoom>=17] { line-width: 2.2; }
    [zoom>=18] { line-width: 2.5; }
    [zoom>=19] { line-width: 3.0; }
  }
  [type='stream_intermittent'] {
    line-dasharray: 4,2;
  }
}

// Drains //
// **** add width and depth to label, maybe type?
// (would do dashes for covered features if it came with MapBox streets)
#waterway {
  [type='drain'],
  [type='ditch'] {
    line-join: round;
    line-color: @drain;
    line-width: 0.2;
    [zoom>=14] { line-width: 0.5; }
    [zoom>=15] { line-width: 1.0; }
    [zoom>=16] { line-width: 1.5; }
    [zoom>=17] { line-width: 1.8; }
    [zoom>=18] { line-width: 2.1; }
    [zoom>=19] { line-width: 2.5; }
  }
}

