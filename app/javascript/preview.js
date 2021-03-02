const preview = () => {
  const previewBox = document.getElementById("preview-box");
  const uploadBox = document.getElementById("upload-box");

  const createImageHTML = (imageUrl) => {

    // プレビュー画像用のHTML要素を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('src', imageUrl);
    previewImage.setAttribute('class', 'image-element');
    let imageElementNum = document.querySelectorAll('.image-element').length;

    // プレビュー画像の見た目を整える
    previewBox.classList.remove('preview-hidden');
    previewImage.classList.add('preview-image');

    // プレビュー画像を表示させる
    previewBox.appendChild(previewImage);

    // ２つ目以降のファイル選択ボタンを生成
    const inputHTML = document.createElement('input');
    inputHTML.setAttribute('id', `item_image_${imageElementNum}`);
    inputHTML.setAttribute('name', 'item[images][]');
    inputHTML.setAttribute('type', 'file');

    // ファイル選択ボタンを表示させる
    uploadBox.appendChild(inputHTML);

    // ２枚目以降のファイル選択とプレビュー表示も可能にする
    inputHTML.addEventListener('change', (e) => {
      const file = e.target.files[0];
      const imageUrl = window.URL.createObjectURL(file);
      createImageHTML(imageUrl);
    });
  }

  document.getElementById("item-image").addEventListener('change', (e) => {
    // 画像のデータを取得
    const file = e.target.files[0]
    // 画像のデータからURLを生成
    const imageUrl = window.URL.createObjectURL(file);

    // 画像データを突っ込んで上で定義した関数を呼び出す
    createImageHTML(imageUrl);
  });
}

window.addEventListener('load', preview);