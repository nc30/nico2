# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

e = Event.create(
  title: "春の房総いちご狩りツーリング",
  x_day: '2015-03-21',
  body: '2/22 目的地、ルート、走行について、解散後の注意事項　を更新しました！',
  description: '',
  owner: 'らっきょ',
  status: 0,
  locale: 3,
  place: '千葉市中央区中央港→山武市富田',
  setup_place: '千葉ポートタワー前',
  contact_to: 'らっきょのTwitterアカ→https://twitter.com/wildcard_silverへご連絡ください',
  setup_time: '10:00',
  break_time: 'いちごでお腹いっぱいになったら（遅くとも15：00頃）',
  deadline: '3月14日（予定）',
  limit: 0
)

Entry.create(
  event: e,
  name: "影狼",
  bike: "ZX-10",
  maker: 4,
  status: 0,
  comment: "ボランティアしますze",
  password: ""
)
