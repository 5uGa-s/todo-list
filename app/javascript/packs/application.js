// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery

import $ from 'jquery';
window.jQuery = $;
window.$ = $;

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//エラーメッセージ

$(document).ready(function() {
  setTimeout(function() {
    $('.notice, .error-message, .alert').fadeOut('slow');
  }, 1000);

//タイトルの全体の表示
$(document).ready(function() {
  $('.boards-title-show').click(function() {
    $(this).next('.boards-title-full').toggle(); // クリックで表示切り替え
  });
});

});

function adjustCommentCount() {
  setTimeout(function () {
    const commentCount = document.querySelector(".comment-count");
    if (commentCount) {
      // 数字の幅を取得
      const width = commentCount.offsetWidth;

      // 幅が一定値より大きい場合、左にずらす
      if (width > 10) {
        commentCount.style.marginRight = "5px"; // 左にずらす幅を設定
      }
    }
  }, 10); // 適切な遅延時間を設定
}

// ページ初期読み込み時
document.addEventListener("DOMContentLoaded", adjustCommentCount);

// ページ遷移時
window.addEventListener("popstate", adjustCommentCount);





// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
