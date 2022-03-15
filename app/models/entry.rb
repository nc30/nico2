# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  bike        :string           not null
#  color       :integer          default(0), not null
#  comment     :string           not null
#  index       :integer          default("あ"), not null
#  kana        :string           default(""), not null
#  maker       :integer          default("ホンダ")
#  maker_ex    :string           default(""), not null
#  name        :string           default(""), not null
#  password    :string           not null
#  reserve_num :integer
#  status      :integer          default("○参加")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#
# Indexes
#
#  index_entries_on_event_id  (event_id)
#
class Entry < ApplicationRecord
  belongs_to :event

  enum index: ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "や", "ゆ", "よ", "わ", "を", "ん", "英"]

  def set_index
    if kana.length > 0 && ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "や", "ゆ", "よ", "わ", "を", "ん", "英"].include?(kana[0])
      self.index = kana[0]
    else
      self.index = "英"
    end
  end

  def maker_string
    ["ホンダ", "ヤマハ", "カワサキ", "スズキ", "ハーレー", "BMW", "DUCATI", "トライアンフ", "KTM", "MVアグスタ", "アプリリア", "その他"][maker]
  end

  def status_long
    ["○参加", "△未定", "×不参加", "●参加"][status]
  end

  def status_short
    ["○", "仮", "×", "●"][status]
  end

  def maker_name
    return maker if maker <= 10
    return maker_ex
  end

  def maker_color
    "red"
  end

end
