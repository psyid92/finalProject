<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Masonry</title>
    <style>
      .item {
        width: 100px;
        height: 100px;
        float: left;
        margin: 5px;
        background-color: #2195c9;
      }
    </style>
    <script src="masonry.pkgd.min.js"></script>
  </head>
  <body>
    <div id="container">
      <div class="item">Lorem</div>
      <div class="item">Ipsum</div>
      <div class="item">Dolor</div>
      <div class="item">Lorem</div>
      <div class="item">Ipsum</div>
      <div class="item">Dolor</div>
      <div class="item">Lorem</div>
      <div class="item">Ipsum</div>
      <div class="item">Dolor</div>
      <div class="item">Lorem</div>
      <div class="item">Ipsum</div>
      <div class="item">Dolor</div>
    </div>
    <script>
      var container = document.querySelector( '#container' );
      var msnry = new Masonry( container, {
        // options
        columnWidth: 110,
        itemSelector: '.item',
      } );
    </script>
  </body>
</html>