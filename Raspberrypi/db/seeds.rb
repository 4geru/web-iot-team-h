# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Command.create(
    mizu: Random.rand(2) == 1 ? true : false,
    red_led: Random.rand(2) == 1 ? true : false,
    green_led: Random.rand(2) == 1 ? true : false,
    blue_led: Random.rand(2) == 1 ? true : false
  )
end

# 5.times do
#   Log.create(
#  tanbo_id: 1,
#  shitsudo: Random.rand(255.0),
#  oto: Random.rand(255.0),
#  ondo: Random.rand(255.0),
#  camera: Random.rand(255.0),
#  light: Random.rand(255.0),
#  loged_at: Time.current
#  )

# end
puts 'success to create tables'
