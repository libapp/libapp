# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# t.integer  "member_id"
# t.string   "room_number"
# t.datetime "start_at"
# t.datetime "end_at"
# t.integer  "status"

# t.string   "name"
# t.string   "email"
# t.string   "password"

# t.string   "number",     null: false
# t.integer  "size"
# t.integer  "building"
# t.integer  "status"
Member.create(name: 'member', email: 'member@lib.app', password: 'foobar',password_confirmation: 'foobar')
Member.create(name: 'member1', email: 'member1@lib.app', password: 'foobar',password_confirmation: 'foobar')
Admin.create(name: 'admin', email: 'admin@lib.app', password: 'foobar',password_confirmation: 'foobar',level: 0)
Admin.create(name: 'admin1', email: 'admin1@lib.app', password: 'foobar',password_confirmation: 'foobar')
Schedule.create(member_id: 6, room_number: 'HB2', start_at: "2016-09-24 22:35:15", end_at: "2016-09-24 22:35:15", status: 1)
Schedule.create(member_id: 6, room_number: 'HB21', start_at: "2016-09-24 22:35:15", end_at: "2016-09-24 22:35:15", status: 1)
Schedule.create(member_id: 6, room_number: 'HB2', start_at: "2016-09-24 22:35:15", end_at: "2016-09-24 22:35:15", status: 1)
Schedule.create(member_id: 6, room_number: 'HB2', start_at: "2016-09-24 22:35:15", end_at: "2016-09-24 22:35:15", status: 1)
Schedule.create(member_id: 6, room_number: 'HB2', start_at: "2016-09-24 22:35:15", end_at: "2016-09-24 22:35:15", status: 1)
Schedule.create(member_id: 7, room_number: 'HB21', start_at: "2016-09-24 22:35:15", end_at: "2016-09-24 22:35:15", status: 1)

Room.create(number: 'HB211',size: 2, building: 2)
Room.create(number: 'HB21',size: 1, building: 2)
Room.create(number: 'HB2',size: 2, building: 1)

