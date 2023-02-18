class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      #中間テーブルの作成にはreferencesというパラメーターを用いてpostモデル及びtagモデルの中間テーブルであることを示す
      t.timestamps
    end
  end
end
