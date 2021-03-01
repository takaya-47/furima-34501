const preview = () => {
  const previewBox = document.getElementById("preview-box");
  document.getElementById("item-image").addEventListener('change', (e) => {
    // 画像のデータを取得
    const file = e.target.files[0]
    // 画像のデータからURLを生成
    const imageUrl = window.URL.createObjectURL(file);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('src', imageUrl);

    // プレビュー画像の見た目を整える
    previewBox.classList.remove('preview-hidden');
    previewImage.classList.add('preview-image');

    previewBox.appendChild(previewImage);
  });
}

window.addEventListener('load', preview);