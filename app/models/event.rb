# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  body              :text             default("")
#  break_time        :string           default("")
#  contact_to        :string           default(""), not null
#  deadline          :string           default("")
#  description       :string           default(""), not null
#  important_message :text
#  limit             :integer
#  locale            :integer          default("北海道"), not null
#  markdown          :boolean          default(TRUE)
#  owner             :string           default(""), not null
#  password          :string
#  place             :string           default(""), not null
#  setup_place       :string           default("")
#  setup_time        :string           default("")
#  status            :integer          default("開催予定"), not null
#  title             :string           default(""), not null
#  x_day             :date
#  x_day_end         :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Event < ApplicationRecord
  has_many :entries

  def joined_count
    entries.count{|e|e.status==0}
  end

  def reserved_count
    entries.count{|e|[1,4].include?(e.status)}
  end

  def locale_text
    ["北海道", "東北", "関東・甲信越", "中部・北陸", "関西", "中国・四国", "九州・沖縄", "リモート"][locale]
  end

  def status_text
    ["開催予定", "未定", "審議中", "中止"][status]
  end

  def all_count
    entries.count{|e|[0,1,3].include?(e.status)}
  end

end
