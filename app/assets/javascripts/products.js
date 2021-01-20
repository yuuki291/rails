document.addEventListener("turbolinks:load", function () {

    var prodcutImage = document.querySelector('.prodcut-image');

    function handleFileSelect(evt) {
        var files = evt.target.files; // FileListオブジェクト

        // ファイルリストをループして、画面ファイルをサムネイルとしてレタリングする
        for (var i = 0, f; f = files[i]; i++) {
            // 画像ファイルのみを処理する
            if (!f.type.match('image.*')) {
                continue;
            }

            var reader = new FileReader();

            reader.onload = (function (theFile) {
                return function (e) {
                    // サムネイルをレタリングする
                    var span = document.createElement('span');
                    span.innerHTML = ['<img class = "prodcut-preview-thumb" src="', e.target.result,
                        '" title = "', escape(theFile.name), '"/>'].join('');
                    document.getElementById('list').insertBefore(span, null);
                };
            })(f);
            reader.readAsDataURL(f);
        }
    }

    if (prodcutImage) {
        this.addEventListener('change', handleFileSelect, false);
    }

});

//----------------------------
$(function () {
    $(".product-index-grid").slick({
        dots: true,
    });
});